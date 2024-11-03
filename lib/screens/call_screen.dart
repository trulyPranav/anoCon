import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class VideoCallScreen extends StatefulWidget {
  final String callId;
  const VideoCallScreen({super.key, required this.callId});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  MediaStream? _remoteStream;
  RTCVideoRenderer _localVideoRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteVideoRenderer = RTCVideoRenderer();

  @override
  void initState() {
    super.initState();
    _initWebRTC();
  }

  Future<void> _initWebRTC() async {
    await _localVideoRenderer.initialize();
    await _remoteVideoRenderer.initialize();

    // Create local media stream
    try {
      _localStream = await navigator.mediaDevices.getUserMedia({
        'audio': true,
        'video': true,
      });
      _localVideoRenderer.srcObject = _localStream;
    } catch (e) {
      print("Error getting user media: $e");
      return; // Handle error appropriately
    }

    // Create PeerConnection
    try {
      _peerConnection = await createPeerConnection({
        'iceServers': [
          {'urls': 'stun:stun.l.google.com:19302'},
        ],
      });

      _peerConnection!.addStream(_localStream!);

      // Send ICE candidates to Firestore
      _peerConnection!.onIceCandidate = (RTCIceCandidate candidate) {
        FirebaseFirestore.instance
            .collection('calls')
            .doc(widget.callId)
            .collection('offerCandidates')
            .add({'candidate': candidate.toMap()});
      };

      // Handle remote stream
      _peerConnection!.onAddStream = (MediaStream stream) {
        setState(() {
          _remoteStream = stream;
          _remoteVideoRenderer.srcObject = _remoteStream;
        });
      };

      // Listen for incoming ICE candidates from Firestore
      FirebaseFirestore.instance
          .collection('calls')
          .doc(widget.callId)
          .collection('answerCandidates')
          .snapshots()
          .listen((snapshot) {
        for (var change in snapshot.docChanges) {
          if (change.type == DocumentChangeType.added) {
            final candidateData = change.doc.data()?['candidate'];
            final candidate = RTCIceCandidate(
              candidateData['candidate'],
              candidateData['sdpMid'],
              candidateData['sdpMLineIndex'],
            );
            if (_peerConnection != null) {
              _peerConnection!.addIceCandidate(candidate).catchError((e) {
                print("Failed to add ICE candidate: $e");
              });
            }
          }
        }
      });

      // Check for an existing offer to respond to
      await _checkForOffer();
    } catch (e) {
      print("Error creating peer connection: $e");
    }
  }

  Future<void> _checkForOffer() async {
    final callDoc = FirebaseFirestore.instance.collection('calls').doc(widget.callId);
    callDoc.snapshots().listen((snapshot) async {
      if (snapshot.exists && snapshot.data()!['offer'] != null) {
        final offer = snapshot.data()!['offer'];
        await _peerConnection!.setRemoteDescription(RTCSessionDescription(offer['sdp'], offer['type']));
        final answer = await _peerConnection!.createAnswer();
        await _peerConnection!.setLocalDescription(answer);

        await callDoc.set({'answer': {'sdp': answer.sdp, 'type': answer.type}}, SetOptions(merge: true));
      }
    });
  }

  @override
  void dispose() {
    _localStream?.dispose();
    _remoteStream?.dispose();
    _localVideoRenderer.dispose();
    _remoteVideoRenderer.dispose();
    _peerConnection?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Call")),
      body: Column(
        children: [
          Expanded(child: RTCVideoView(_localVideoRenderer)), // Local video
          Expanded(child: RTCVideoView(_remoteVideoRenderer)), // Remote video
        ],
      ),
    );
  }
}

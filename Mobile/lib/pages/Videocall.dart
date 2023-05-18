// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';

// class VideoCallApp extends StatefulWidget {
//   const VideoCallApp({Key? key}) : super(key: key);

//   @override
//   _VideoCallAppState createState() => _VideoCallAppState();
// }

// class _VideoCallAppState extends State<VideoCallApp> {
//   late RTCPeerConnection _peerConnection;
//   MediaStream? _localStream;
//   MediaStream? _remoteStream;
//   bool _isCameraOn = true;
//   bool _isMicOn = true;

//   @override
//   void initState() {
//     super.initState();
//     _initCall();
//   }

//   void _initCall() async {
//     // Create a peer connection
//     _peerConnection = await createPeerConnection();

//     // Get the local media stream
//     _localStream = await navigator.mediaDevices.getUserMedia({
//       'audio': true,
//       'video': {
//         'facingMode': 'user',
//       },
//     });

//     // Add local stream to the peer connection
//     _localStream!.getTracks().forEach((track) {
//       _peerConnection.addTrack(track, _localStream!);
//     });

//     // Set the remote stream to display video
//     _peerConnection.onTrack = (event) {
//       if (event.track.kind == 'video') {
//         setState(() {
//           _remoteStream = event.streams[0];
//         });
//       }
//     };
//   }

//   Future<RTCPeerConnection> createPeerConnection([Map<String, dynamic>? configuration]) async {
//     final Map<String, dynamic> configuration = {
//       'iceServers': [
//         {'url': 'stun:stun.l.google.com:19302'},
//       ],
//     };

//     final peerConnection = await createPeerConnection(configuration);

//     return peerConnection;
//   }

//   void _toggleCamera() {
//     setState(() {
//       _isCameraOn = !_isCameraOn;
//       _localStream!.getVideoTracks()[0].enabled = _isCameraOn;
//     });
//   }

//   void _toggleMic() {
//     setState(() {
//       _isMicOn = !_isMicOn;
//       _localStream!.getAudioTracks()[0].enabled = _isMicOn;
//     });
//   }

//   @override
//   void dispose() {
//     _localStream?.dispose();
//     _remoteStream?.dispose();
//     _peerConnection.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Call App'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: _remoteStream != null
//                 ? RTCVideoView(_remoteStream! as RTCVideoRenderer)
//                 : Container(),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(_isCameraOn ? Icons.videocam : Icons.videocam_off),
//                 onPressed: _toggleCamera,
//               ),
//               IconButton(
//                 icon: Icon(_isMicOn ? Icons.mic : Icons.mic_off),
//                 onPressed: _toggleMic,
//               ),
//             ],
//           ),
//           Expanded(
//             child: RTCVideoView(_localStream! as RTCVideoRenderer),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     home: VideoCallApp(),
//   ));
// }

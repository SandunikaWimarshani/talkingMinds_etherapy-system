// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';

// class VideoCallScreen extends StatefulWidget {
//   @override
//   _VideoCallScreenState createState() => _VideoCallScreenState();
// }

// class _VideoCallScreenState extends State<VideoCallScreen> {
//   // Variables for WebRTC
//   MediaStream? _localStream;
//   MediaStream? _remoteStream;
//   RTCPeerConnection? _peerConnection;
//   RTCVideoRenderer _localRenderer = RTCVideoRenderer();
//   RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

//   // Function to initialize WebRTC
//   Future<void> _initializeWebRTC() async {
//     await _localRenderer.initialize();
//     await _remoteRenderer.initialize();
//     _localStream = await navigator.mediaDevices.getUserMedia({'audio': true, 'video': true});
//     _localRenderer.srcObject = _localStream!;
//   }

//   // Function to create a peer connection
//   Future<void> _createPeerConnection() async {
//     Map<String, dynamic> configuration = {
//       'iceServers': [        {'url': 'stun:stun.l.google.com:19302'},      ],
//     };
//     _peerConnection = await createPeerConnection(configuration, {});
//     _peerConnection!.addStream(_localStream!);
//     _peerConnection!.onAddStream = (stream) {
//       _remoteStream = stream;
//       _remoteRenderer.srcObject = _remoteStream!;
//     };
//   }

//   // Function to start the call
//   Future<void> _startCall() async {
//     await _initializeWebRTC();
//     await _createPeerConnection();
//     RTCSessionDescription offer = await _peerConnection!.createOffer({});
//     await _peerConnection!.setLocalDescription(offer);
//     // send the offer to the other user
//   }

//   // Function to answer the call
//   Future<void> _answerCall(RTCSessionDescription offer) async {
//     await _initializeWebRTC();
//     await _createPeerConnection();
//     await _peerConnection!.setRemoteDescription(offer);
//     RTCSessionDescription answer = await _peerConnection!.createAnswer({});
//     await _peerConnection!.setLocalDescription(answer);
//     // send the answer to the other user
//   }

//   @override
//   void dispose() {
//     _localRenderer.dispose();
//     _remoteRenderer.dispose();
//     _localStream!.getTracks().forEach((track) => track.stop());
//     _peerConnection!.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Call'),
//       ),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.4,
//               height: MediaQuery.of(context).size.height * 0.4,
//               child: RTCVideoView(_remoteRenderer),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.4,
//               height: MediaQuery.of(context).size.height * 0.4,
//               child: RTCVideoView(_localRenderer),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.videocam),
//         onPressed: () async {
//           await _startCall();
//         },
//       ),
//     );
//   }
// }

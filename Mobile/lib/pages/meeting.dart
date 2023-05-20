// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';

// class VideoConference extends StatefulWidget {
//   @override
//   _VideoConferenceState createState() => _VideoConferenceState();
// }

// class _VideoConferenceState extends State<VideoConference> {
//   MediaStream? _localStream;
//   final _localRenderer = RTCVideoRenderer();

//   @override
//   void initState() {
//     super.initState();
//     initWebRTC();
//   }

//   Future<void> initWebRTC() async {
//     await _localRenderer.initialize();
//     await _getUserMedia();
//   }

//   Future<void> _getUserMedia() async {
//     final mediaConstraints = <String, dynamic>{
//       'audio': true,
//       'video': {
//         'facingMode': 'user',
//       },
//     };

//     MediaStream stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
//     _localRenderer.srcObject = stream;
//     setState(() {
//       _localStream = stream;
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _localRenderer.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Conference'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: RTCVideoView(
//               _localRenderer,
//               mirror: true,
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _hangUp,
//             child: const Text('Hang Up'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _hangUp() async {
//     _localStream?.getTracks().forEach((track) {
//       track.stop();
//     });
//     _localRenderer.srcObject = null;
//     Navigator.pop(context);
//   }
// }

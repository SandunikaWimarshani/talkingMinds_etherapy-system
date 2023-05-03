import React, { useState, useEffect, useRef } from 'react';
import '../styles/meeting.css';
import {Link} from 'react-router-dom';

import { FaMicrophone, FaMicrophoneSlash, FaVideo, FaVideoSlash } from 'react-icons/fa';

const Meeting = () => {
  const [localStream, setLocalStream] = useState(null);
  const [remoteStream, setRemoteStream] = useState(null);
  const localVideoRef = useRef(null);
  const remoteVideoRef = useRef(null);
  const [isConnected, setIsConnected] = useState(false);
  const [isAudioEnabled, setIsAudioEnabled] = useState(true);
  const [isVideoEnabled, setIsVideoEnabled] = useState(true);

  useEffect(() => {
    const startCall = async () => {
      const stream = await navigator.mediaDevices.getUserMedia({
        video: true,
        audio: true
      });
      setLocalStream(stream);
      localVideoRef.current.srcObject = stream;

      const configuration = { iceServers: [{ urls: 'stun:stun.l.google.com:19302' }] };
      const peerConnection = new RTCPeerConnection(configuration);

      stream.getTracks().forEach(track => {
        peerConnection.addTrack(track, stream);
      });

      peerConnection.addEventListener('track', event => {
        if (remoteVideoRef.current.srcObject !== event.streams[0]) {
          setRemoteStream(event.streams[0]);
          remoteVideoRef.current.srcObject = event.streams[0];
        }
      });

      const offer = await peerConnection.createOffer();
      await peerConnection.setLocalDescription(offer);

      // Send offer to server and wait for answer

      peerConnection.addEventListener('connectionstatechange', event => {
        if (peerConnection.connectionState === 'connected') {
          setIsConnected(true);
        } else {
          setIsConnected(false);
        }
      });
    };

    startCall();
  }, []);

  const toggleAudio = () => {
    localStream.getAudioTracks()[0].enabled = !isAudioEnabled;
    setIsAudioEnabled(!isAudioEnabled);
  };

  const toggleVideo = () => {
    localStream.getVideoTracks()[0].enabled = !isVideoEnabled;
    setIsVideoEnabled(!isVideoEnabled);
  };

  return (
    <div className='video_screen'>
      <div className='videos_container'>
        <div className='video_wrapper'>
          <video ref={localVideoRef} autoPlay muted />
          {isConnected && <p className='connection_status'>Connected</p>}
          {!isConnected && <p className='connection_status'>Connecting...</p>}
          <div className='video_controls'>
            <button className='control_button' onClick={toggleAudio}>
              {isAudioEnabled ? <FaMicrophone /> : <FaMicrophoneSlash />}
            </button>
            <button className='control_button' onClick={toggleVideo}>
              {isVideoEnabled ? <FaVideo /> : <FaVideoSlash />}
            </button>
          </div>
        </div>
        <div className='video_wrapper'>
          <video ref={remoteVideoRef} autoPlay />
        </div>
        <button className='book_btn'><Link to = '/Feedback'>End Session</Link></button>
      </div>
    </div>
    
  );
};

export default Meeting;
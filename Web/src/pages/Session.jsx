import React, { useState, useRef, useEffect } from 'react';
import SimplePeer from 'simple-peer';
import { BsCameraVideoFill, BsCameraVideoOffFill, BsMicFill, BsMicMuteFill } from 'react-icons/bs';
import { v4 as uuidv4 } from 'uuid';
import { Container, Row, Col } from 'reactstrap'
import '../styles/meeting.css';

import Video from '../assets/images/video.jpg'
import {motion} from 'framer-motion'
import {Link} from 'react-router-dom';

function Session() {
  const [peer, setPeer] = useState(null);
  const [initiator, setInitiator] = useState(false);
  const [localStream, setLocalStream] = useState(null);
  const [remoteStream, setRemoteStream] = useState(null);
  const [isVideoOn, setVideoOn] = useState(true);
  const [isAudioOn, setAudioOn] = useState(true);
  const [isScreenSharing, setScreenSharing] = useState(false); // New state for screen sharing
  const localVideoRef = useRef();
  const remoteVideoRef = useRef();
  const roomId = useRef('');

  useEffect(() => {
    roomId.current = uuidv4(); // Generate a unique room ID
  }, []);

  const createPeer = () => {
    navigator.mediaDevices.getUserMedia({ video: true, audio: true })
      .then((stream) => {
        setLocalStream(stream);
        localVideoRef.current.srcObject = stream;

        const newPeer = new SimplePeer({ initiator: true, stream });
        setPeer(newPeer);
        setInitiator(true);

        newPeer.on('stream', (stream) => {
          setRemoteStream(stream);
          remoteVideoRef.current.srcObject = stream;
        });

        // Create and share the room ID with the other participant
        const roomData = {
          roomId: roomId.current,
        };
        newPeer.signal(JSON.stringify(roomData));
      })
      .catch((error) => {
        console.error('Error accessing media devices:', error);
      });
  };

  const joinPeer = () => {
    const preferredMedia = window.prompt('Do you prefer an audio or video meeting? (audio/video)');

    if (preferredMedia === 'audio') {
      navigator.mediaDevices.getUserMedia({ audio: true })
        .then((stream) => {
          setLocalStream(stream);

          const newPeer = new SimplePeer({ initiator: false, stream });
          setPeer(newPeer);

          newPeer.on('stream', (stream) => {
            setRemoteStream(stream);
            remoteVideoRef.current.srcObject = stream;
          });

          newPeer.on('signal', (data) => {
            // Send the room ID to the other participant
            const roomData = {
              roomId: roomId.current,
            };
            newPeer.signal(JSON.stringify(roomData));
          });
        })
        .catch((error) => {
          console.error('Error accessing audio device:', error);
        });
    } else if (preferredMedia === 'video') {
      navigator.mediaDevices.getUserMedia({ video: true, audio: true })
        .then((stream) => {
          setLocalStream(stream);
          localVideoRef.current.srcObject = stream;

          const newPeer = new SimplePeer({ initiator: false, stream });
          setPeer(newPeer);

          newPeer.on('stream', (stream) => {
            setRemoteStream(stream);
            remoteVideoRef.current.srcObject = stream;
          });

          newPeer.on('signal', (data) => {
            // Send the room ID to the other participant
            const roomData = {
              roomId: roomId.current,
            };
            newPeer.signal(JSON.stringify(roomData));
          });
        })
        .catch((error) => {
          console.error('Error accessing media devices:', error);
        });
    } else {
      // User canceled or entered an invalid preference
      return;
    }
  };

  const handleSignal = (data) => {
    peer.signal(JSON.parse(data));
  };

  const handleHangUp = () => {
    peer.destroy();
    setPeer(null);
    setInitiator(false);
    setLocalStream(null);
    setRemoteStream(null);
  };

  const toggleVideo = () => {
    const tracks = localStream.getVideoTracks();
    tracks.forEach((track) => {
      track.enabled = !track.enabled;
    });
    setVideoOn(!isVideoOn);
  };

  const toggleAudio = () => {
    const tracks = localStream.getAudioTracks();
    tracks.forEach((track) => {
      track.enabled = !track.enabled;
    });
    setAudioOn(!isAudioOn);
  };

  const toggleScreenSharing = () => {
    if (!isScreenSharing) {
      navigator.mediaDevices.getDisplayMedia({ video: true })
        .then((stream) => {
          const videoTrack = stream.getVideoTracks()[0];
          const sender = peer.addTrack(videoTrack, stream);
          setScreenSharing(true);
          videoTrack.onended = () => {
            sender.replaceTrack(stream.getVideoTracks()[0], videoTrack);
            setScreenSharing(false);
          };
        })
        .catch((error) => {
          console.error('Error accessing screen sharing:', error);
        });
    } else {
      const videoTrack = localStream.getVideoTracks()[0];
      const sender = peer.addTrack(videoTrack, localStream);
      setScreenSharing(false);
      sender.replaceTrack(localStream.getVideoTracks()[0], videoTrack);
    }
  };

  return (
    <div className='vimg'>
                <img src={Video} alt=''/>
                <div className='videoimg'>
                
                <h1 className='vtopic'>Chat with a Counselor Now </h1>
                <h4 className='vchat'> An innovative, practical, and cost-effective replacement for traditional in-person treatment is online video therapy. We are here to offer our clients effective mental assistance and treatment while also assisting them in coping with the problems of daily life. To start improving your life, get in touch with our online video therapist!</h4>

               

              </div>

      {localStream && (
        <div className="video-container">
          <video ref={localVideoRef} autoPlay playsInline muted={isVideoOn} />
          {remoteStream && <video ref={remoteVideoRef} autoPlay playsInline />}
        </div>
      )}

      {!peer && (
        <div className="button-container">
          <motion.button whileTap={{scale:1.2}} button onClick={joinPeer} className="startbtn">Join Video Chat</motion.button>
           
        </div>
      )}

      {/* {initiator && (
        <div className="info-container">
          <p>Share the following room ID with the person you want to chat with:</p>
          <pre>{roomId.current}</pre>
        </div>
      )}

      {!initiator && (
        <div className="info-container">
          <p>Provide the received room ID to join the video chat:</p>
          <textarea onChange={(e) => handleSignal(e.target.value)}></textarea>
        </div>
      )} */}

      {peer && <button className="hangup-button" onClick={handleHangUp}><Link to = '/Feedback'>Hang Up</Link></button>}

      {peer && (
        <div className="controls">
          <button className={`control-button ${isVideoOn ? 'active' : ''}`} onClick={toggleVideo}>
            {isVideoOn ? <BsCameraVideoFill /> : <BsCameraVideoOffFill />}
          </button>
          <button className={`control-button ${isAudioOn ? 'active' : ''}`} onClick={toggleAudio}>
            {isAudioOn ? <BsMicFill /> : <BsMicMuteFill />}
          </button>
          <button
            className={`control-button ${isScreenSharing ? 'active' : ''}`}
            onClick={toggleScreenSharing}
          >
            {isScreenSharing ? 'Stop Sharing' : 'Share Screen'}
          </button>
        </div>
      )}
    </div>
  );
}

export default Session;

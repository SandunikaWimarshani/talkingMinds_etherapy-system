import React, { useState } from 'react';
import { Container, Row, Col } from 'reactstrap';
import { FiSend } from 'react-icons/fi';
import {Link} from 'react-router-dom';
import '../styles/chatbot.css';

function ChatScreen() {
  const [messages, setMessages] = useState([]);
  const [inputText, setInputText] = useState('');

  const handleInputChange = (e) => {
    setInputText(e.target.value);
  };

  const handleSendMessage = () => {
    if (inputText.trim() !== '') {
      setMessages([...messages, inputText]);
      setInputText('');
    }
  };

  return (
    <Container>
      <Row>
        <Col>
          <h1>
            <center> Talk with your Therapist </center>
          </h1>
          <div className="chat-screen">
            <div className="messages">
              {messages.map((message, index) => (
                <div className="message" key={index}>
                  {message}
                </div>
              ))}
            </div>

            <div className="input-container">
              <input
                type="text"
                value={inputText}
                onChange={handleInputChange}
                placeholder="Type your message..."
              />
              <button onClick={handleSendMessage}>
                <FiSend />
              </button>
              
            </div>
            
          </div>
          
        </Col>
        
      </Row>
      <div className='button-container'>
          <button className='pre1'><Link to = '/Chatbot'>Back</Link></button>
          <button className='next1'><Link to = '/Session'>Next</Link></button>


          
        </div>

    </Container>
    
    
  );
}

export default ChatScreen;

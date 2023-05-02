import React, { useState, useEffect } from 'react';
import axios from 'axios';

import '../styles/chatbot.css'

const Chatbot = () => {
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState('');

  useEffect(() => {
    const welcomeMessage = {
      text: 'Hello! How can I assist you today?',
      sender: 'bot',
    };
    setMessages([welcomeMessage]);
  }, []);

  const handleInput = (e) => {
    setInput(e.target.value);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (input.trim() === '') return;

    const message = { text: input, sender: 'user' };
    setMessages([...messages, message]);
    setInput('');

    try {
      const response = await axios.post(
        'https://api.dialogflow.com/v1/query?v=20150910',
        {
          query: input,
          lang: 'en',
          sessionId: '12345',
        },
        {
          headers: {
            Authorization: `Bearer ${process.env.REACT_APP_DIALOGFLOW_API_KEY}`,
          },
        }
      );
      const botMessage = { text: response.data.result.fulfillment.speech, sender: 'bot' };
      setMessages([...messages, botMessage]);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div>
      <div className='bot_window'>
        {messages.map((message, index) => (
          <div key={index}>
            {message.sender === 'user' ? (
              <p>You: {message.text}</p>
            ) : (
              <p>Bot: {message.text}</p>
            )}
          </div>
        ))}
      </div>
      <form className='form_bot' onSubmit={handleSubmit}>
        <input type="text" value={input} className='text_bot' onChange={handleInput} />
        <button className='submit_bot' type="submit">Send</button>
      </form>
    </div>
  );
};

export default Chatbot;

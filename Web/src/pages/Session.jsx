import React, { useState } from "react";

import '../styles/session.css'

const Session = () => {
  const [sessionName, setSessionName] = useState("");
  const [sessionPassword, setSessionPassword] = useState("");

  const handleJoinSession = () => {
    // handle joining the session with sessionName and sessionPassword
  };

  return (
    <div>
      <h1 className="session_topic">Session Page</h1>
      <form onSubmit={handleJoinSession}>
        <div>
        <label className="sessionName">Session Name:</label>
        <input
          type="text"
          id="sessionName"
          value={sessionName}
          onChange={(e) => setSessionName(e.target.value)}
        />
        <label className="sessionPassword">Session Password:</label>
        <input
          type="password"
          id="sessionPassword"
          value={sessionPassword}
          onChange={(e) => setSessionPassword(e.target.value)}
        />

        </div>
       
        <button className='book_btn'type="submit">Join Session</button>
      </form>
    </div>
  );
};

export default Session;

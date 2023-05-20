import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { BsCheckCircle, BsXCircle } from 'react-icons/bs';
import '../styles/feedback.css';

const Feedback = () => {
  const [isSatisfied, setIsSatisfied] = useState(null);

  const handleFeedback = (satisfied) => {
    setIsSatisfied(satisfied);
  };
  const [showPopup, setShowPopup] = useState(false);

  return (
    <div className='feedback_container'>
      <div className={showPopup ? 'overlay' : ''} onClick={() => setShowPopup(false)}>
        {showPopup && (
          <div className='popup'>
            <center>
            {/* <img src={right} alt='' className='right'/>  */}

            </center>
            
            <h2 className='wait'> <center>Are you want to sign out?</center></h2>

            <button onClick={() => setShowPopup(true)} className='btnpop'><Link to = '/Signout'>Yes</Link></button>
            
          </div>
        )}
      </div>
      {!isSatisfied && (
        <div className='feedback_options'>
          <h2>Are you satisfied with the session?</h2>
          <div className='button_group'>
            <button className='feedback_button' onClick={() => handleFeedback(true)}>
            <i class="ri-emotion-line"></i>
              Yes
            </button>
            <button className='feedback_button' onClick={() => handleFeedback(false)}>
            <i class="ri-emotion-unhappy-fill"></i>
              No
            </button>
          </div>
        </div>
      )}
      {isSatisfied && (
        <div className='feedback_message'>
          <h1>Thank you for your feedback!</h1>
          <h4>You rated the session as {isSatisfied ? 'satisfied' : 'unsatisfied'}.</h4>
          <button className='feedback_button' onClick={() => setShowPopup(true)}>GO BACK </button>
          
        </div>
      )}
    </div>
  );
};

export default Feedback;

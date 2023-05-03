import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import '../styles/feedback.css';

const Feedback = () => {
  const [isSatisfied, setIsSatisfied] = useState(null);

  const handleFeedback = (satisfied) => {
    setIsSatisfied(satisfied);
  };

  return (
    <div className='feedback_container'>
      {!isSatisfied && (
        <div className='feedback_options'>
          <h2>Are you satisfied with the session?</h2>
          <div className='button_group'>
            <button className='feedback_button' onClick={() => handleFeedback(true)}>
              Yes
            </button>
            <button className='feedback_button' onClick={() => handleFeedback(false)}>
              No
            </button>
          </div>
        </div>
      )}
      {isSatisfied && (
        <div className='feedback_message'>
          <h2>Thank you for your feedback!</h2>
          <p>You rated the session as {isSatisfied ? 'satisfied' : 'unsatisfied'}.</p>
          <button className='feedback_button'>
            <Link to='/'>Go Back</Link>
          </button>
        </div>
      )}
    </div>
  );
};

export default Feedback;
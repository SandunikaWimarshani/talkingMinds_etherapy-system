import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {Link} from 'react-router-dom';

import '../styles/appointment.css'


const AppointmentConfirmation = ({ appointment }) => {
  const navigate = useNavigate();
  const [session, setSession] = useState(null);
  
  const handleConfirmAppointment = () => {
    const counselorName = appointment?.counselor?.name; // fix for error
    const newSession = {
      counselorName: counselorName,
      appointmentDate: appointment.date,
      appointmentTime: appointment.time,
    };
    setSession(newSession);
  };
  
  const handleStartSession = () => {
    navigate('/sessions', { session });
  };
  
  return (
    <div>
      <h2><center>Confirm Your Appointment</center></h2>
      <p className='para'>
        You are scheduled for an appointment with {appointment?.counselor?.name} on {appointment?.date} at {appointment?.time}.
      </p>
      <button className='book_btn'><Link to = '/List_appointments'>  VIEW </Link></button>
      <button className='book_btn'><Link to = '/Session'>CONFIRM APPOINTMENT</Link></button>
      {session && (
        <div>
          <p>Your appointment has been confirmed. Click the button below to start your session.</p>
          <button onClick={handleStartSession}>Start Session</button>

          
        </div>
        
      )}
    </div>
  );
};

export default AppointmentConfirmation;

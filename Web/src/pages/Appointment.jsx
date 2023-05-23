import React, {useState,} from 'react'
import { Container, Row, Col, Form, FormGroup } from 'reactstrap'
import { toast, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

import '../styles/appointment.css'

import {Link} from 'react-router-dom';
import Head from '../components/head/Head';

import {db, auth} from '../firebase config';
import { collection, addDoc,where,serverTimestamp, onSnapshot,query, orderBy } from 'firebase/firestore';

import right from '../assets/images/right.jpg'


function Appointments() {

  const [enteryourname, setEnteryourname] = useState('')
  const [enteryouremail, setEnteryouremail] = useState('')
  const [entercounselorname, setEntercounselorname] = useState('')
  const [enterdate, setEnterdate] = useState('')
  const [entertime, setEntertime] = useState('')
  const [showPopup, setShowPopup] = useState(false);
 
  
  const appointmentRef = collection (db, 'appointment')

  

  const AddAppointments = async(event) => {
    event.preventDefault();

    if(enteryourname === '' || enteryouremail === '' || entercounselorname === '' || enterdate ==='' || entertime === '') return;
    
    await addDoc(appointmentRef, {
      name:enteryourname,
      email: enteryouremail,
      counselorName: entercounselorname,
      date: enterdate,
      time: entertime,
     
    });
  }
  
  return (
    <Head title='Appointment'>

<div className={showPopup ? 'overlay' : ''} onClick={() => setShowPopup(false)}>
        {showPopup && (
          <div className='popup'>
            <center>
            <img src={right} alt='' className='right'/> 

            </center>
            
            <h2 className='wait'> <center>Thank you for your reservation</center></h2>

            <button onClick={() => setShowPopup(true)} className='btnpop'><Link to = '/List_appointments'>View</Link></button>
            <button onClick={() => setShowPopup(false)} className='btnpop'><Link to = '/Confirm_appointments'>Next</Link></button>
          </div>
        )}
      </div>
      
      <section>
    <Container>
      <Row>
        <Col lg='8'>
          
          <Form classname='box' onSubmit={AddAppointments}>
              <h1><center> BOOK APPOINTMENT </center> </h1>

            <FormGroup className='box_group'>
              <span className='topic'>Your Name  </span>
              <input type='text' className='tboxName' placeholder='Enter your name' value= {enteryourname} onChange={e => setEnteryourname(e.target.value)} required></input>
            </FormGroup>

            <FormGroup className='box_group'>
              <span className='topic'> Your Email </span>
              <input type='email' className='tboxEmail' placeholder='Enter your email' value= {enteryouremail} onChange={e => setEnteryouremail(e.target.value)} ></input>
            </FormGroup>

            <FormGroup className='box_group'>
              <span className='topic'> Counselor Name </span>
              <input type='text' className='tboxCName' placeholder='Enter selected counselor name' value= {entercounselorname} onChange={e => setEntercounselorname(e.target.value)} required></input>
            </FormGroup>

            <FormGroup className='box_group'>
              <span className='topic'> Date </span>
              <input type='date' className='tboxDate' placeholder='Enter date' value= {enterdate} onChange={e => setEnterdate(e.target.value)} required></input>
            </FormGroup>

            <FormGroup className='box_group'>
              <span className='topic'> Time </span>
              <input type='time' className='tboxTime' placeholder='Enter Time' value= {entertime} onChange={e => setEntertime(e.target.value)}></input>
            </FormGroup>

            {/* <FormGroup className='box_group'>
              <span className='topic'> Conversation Mode </span>
             <select className='tboxMode'  value= {entermode} onChange={e => setEntermode(e.target.value)} required>
             <option value=''> </option>
              <option value='video'> Video Conversation</option>
              <option value='audio'> Audio Conversation</option>
             </select>
            </FormGroup> */}

            <button className='book_btn' onClick={() => setShowPopup(true)}> SUBMIT </button>
            
            
          </Form>
          
        </Col>
      </Row>
    </Container>
   </section>
    </Head>
    
  )
}

export default Appointments
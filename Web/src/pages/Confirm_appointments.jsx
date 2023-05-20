import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import '../styles/confirm.css'
import {motion} from 'framer-motion'

import { Container, Row, Col } from 'reactstrap'
import Chat from '../assets/images/chat.jpg'


function Confirm_appointments() {
  return (
   
      
        <Container>
          <Row>
            <Col lg='6' md='6'>
              
            </Col>

            <Col lg='8' md='8'>
              <div className='cimg'>
                <img src={Chat} alt=''/>
                <div className='ccontent1'>
                
                <h2 className='cht'>Chat with a Counselor Now </h2>
                <h4 className='pchat'> Online consultation with a psychiatrist or psychologist without leaving your home. To get in touch with your therapist, you can message them whenever you want and set up live sessions for whenever it's convenient for you.</h4>

                <motion.button whileTap={{scale:1.2}} className='start_btn1'> <Link to = '/chatbot'>Chat With Me</Link> </motion.button>

              </div>


              </div>
            </Col>

          </Row>
        </Container>

  )
}


export default Confirm_appointments;
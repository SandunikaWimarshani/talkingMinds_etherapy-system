import React from 'react'
import '../../styles/Pro_One.css'
import 'remixicon/fonts/remixicon.css'
import {Link} from 'react-router-dom';

import { Container, Row, Col } from 'reactstrap'
import Head from '../head/Head'

import ProFour from '../../assets/images/pro4.jpg'


function ProfileFour() {

  const timeSlots = [
    { date: '2023-05-22', time: '02:30 PM' },
    { date: '2023-05-23', time: '11:00 AM' },
    { date: '2023-05-24', time: '03:00 PM' },
    { date: '2023-05-25', time: '03:00 PM' },
    { date: '2023-05-26', time: '11:30 AM' },
    { date: '2023-05-27', time: '06:30 PM' },
    { date: '2023-05-28', time: '06:00 PM' },
   
  ];
  return (
    <Head>
      <section>
        <Container>
          <Row>
            <Col>
            
    
   
      <div className='profile_data'>
        <h6 className='profile_title'>
          <center><u>ABOUT ME</u></center> 
        </h6>
        <div className='proImg'>
        <img src={ProFour}  alt=''></img>

        </div>
        
        
      </div>
   
    
  
            </Col>
            <Col lg='6'>
            <h5 className='profile_subtitle'>
          <center><b>Mr. Harry Jake</b></center>
          
        </h5>
        <h4 className='specialties'>Specialties : Relationship issues, Anger management, Career difficulties, Isolation/Loneliness, Panic Disorder and Panic Attacks</h4>
       
        <p className='profile_desc'> I have three years of professional work experience . I have expertise working with clients who 
        are dealing with depression, self-esteem issues, sorrow and loss, stress and anxiety, and motivation. I collaborate with my 
        clients to provide a setting that is open and safe so that ideas and emotions can be expressed without worrying about being judged. 
        I'm pleased of you for starting therapy—it might be brave to make the decision to do so.

 </p>
    </Col>

            
            
            <Col>
            <div className='profile_data'>
        <h6 className='profile_title-review'>
          <u>RATING</u>
          <div className='profile_rating'>
            <div>
              <span> <i class="ri-star-fill"></i></span>
              <span> <i class="ri-star-fill"></i></span>
              
              
            </div>
          </div>
        </h6>
        </div>
            
            </Col>

            <Col>
   
    
            <div className='profile_data'>
            <h6 className='profile_title-review'>
          <u>LICENSING</u> 
          <div>
          <b>OR LCSW L9824</b>

          </div>
         
        </h6>
        
      </div>
        
            </Col>
          </Row>
        </Container>

        <div className='time_slots'>
          <h6 className='profile_title'>
           
              <u>AVAILABLE TIME SLOTS</u>
          
          </h6>
          <ul>
            {timeSlots.map((slot, index) => (
              <li key={index}>
                <span>{slot.date}</span> - <span>{slot.time}</span>
              </li>
            ))}
          </ul>
        </div>
        <button className='btn_book'><Link to = '/Appointment'> BOOK APPOINTMENTS </Link></button>
      </section>

    </Head>
    
  )
}

export default ProfileFour
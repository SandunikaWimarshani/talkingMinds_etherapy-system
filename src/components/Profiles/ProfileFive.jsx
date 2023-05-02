import React from 'react'
import '../../styles/Pro_One.css'
import 'remixicon/fonts/remixicon.css'
import {Link} from 'react-router-dom';

import { Container, Row, Col } from 'reactstrap'
import Head from '../head/Head'

import ProFive from '../../assets/images/pro5.jpg'

function ProfileFive() {
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
        <img src={ProFive}  alt=''></img>

        </div>
        
        
      </div>
   
    
  
            </Col>
            <Col lg='6'>
            <h5 className='profile_subtitle'>
          <center><b>Miss. Isla Lauren</b></center>
        </h5>
        <h6> Specialties : Communication Problems, Control Issues, Women's Issues, Workplace Issues, Young Adult Issues</h6>
        <p className='profile_desc'> I have three years of professional counseling experience and ten years of experience in the domains 
        of social work, mental health, and medicine. I have expertise working with individuals who are dealing with stress and anxiety,
         abuse and trauma, depression and mood disorders, as well as the physiological effects that mental health has on our bodies. 
         I think everyone should be treated with decency, compassion, and respect. I take satisfaction in considering people as a whole as well 
         as their individual components.

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
          <b>MO LCDW 3020034052</b>

          </div>
         
        </h6>
        
      </div>
        
            </Col>
          </Row>
        </Container>
        <button className='btn_book'><Link to = '/Appointment'> BOOK APPOINTMENTS </Link></button>
      </section>

    </Head>
    
  )
}

export default ProfileFive
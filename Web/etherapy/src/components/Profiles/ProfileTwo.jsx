import React from 'react'
import '../../styles/Pro_One.css'
import 'remixicon/fonts/remixicon.css'
import {Link} from 'react-router-dom';

import { Container, Row, Col } from 'reactstrap'
import Head from '../head/Head'

import ProTwo from '../../assets/images/pro2.jpg'


function ProfileTwo() {
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
        <img src={ProTwo}  alt=''></img>

        </div>
        
        
      </div>
   
    
  
            </Col>
            <Col lg='6'>
            <h5 className='profile_subtitle'>
          <center><b>Mr. Allan Lewis</b></center>
       
        </h5>
        <h4 className='specialties'>Specialties : Relationship issues, Family conflicts, Sleeping disorders, Parenting issues, Anger management</h4>
        <p className='profile_desc'> I have been a licensed mental health counselor (LMHC) for more than six years. I have worked with 
        individuals, couples, families, and groups in non-profit, residential, and clinical practice settings. I also have expertise 
        assisting individuals. I've had a lot of experience working with folks who want to improve their lives. I've developed a broad range 
        of abilities, expertise, and solutions to help with problems like depression, anxiety, addiction, finding one's purpose, trauma, 
        grief/loss issues, and low self-esteem. 


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
          <b>OR LCSW L9824</b>

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

export default ProfileTwo
import React from 'react'
import '../../styles/Pro_One.css'
import 'remixicon/fonts/remixicon.css'
import {Link} from 'react-router-dom';

import { Container, Row, Col } from 'reactstrap'
import Head from '../head/Head'

import ProOne from '../../assets/images/pro1.jpg'

function ProfileOne() {
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
        <img src={ProOne}  alt=''></img>

        </div>
        
        
      </div>
   
    
  
            </Col>
            <Col lg='6'>
            <h5 className='profile_subtitle'>
          <center><b>Mr. Henry Wilson</b></center>
        </h5>
        <h4 className='specialties'>Specialties : Depression, Coping with life changes, Family of Origin Issues, Forgiveness, Men's Issues, Sexuality, Social Anxiety and Phobia</h4>
        <p className='profile_desc'> I have 12 years of professional work experience and a Nebraska license. I have expertise
         assisting people with difficulties relating to stress and anxiety, relationships, and intimate relationships. In my opinion, 
         you are the authority on your experience, and you possess a variety of skills that will help you go through difficult situations. 
         It requires bravery to start the process of looking for a more rewarding and happy existence. To help you with that process, I'm here.
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
          <b>IA LMHC 031242</b>

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

export default ProfileOne
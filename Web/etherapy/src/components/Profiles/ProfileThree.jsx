import React from 'react'
import '../../styles/Pro_One.css'
import 'remixicon/fonts/remixicon.css'
import {Link} from 'react-router-dom';

import { Container, Row, Col } from 'reactstrap'
import Head from '../head/Head'

import ProThree from '../../assets/images/pro3.jpg'


function ProfileThree() {
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
        <img src={ProThree}  alt=''></img>

        </div>
        
        
      </div>
   
    
  
            </Col>
            <Col lg='6'>
            <h5 className='profile_subtitle'>
          <center><b>Mrs. Jessica Megan</b></center>
         
        </h5>
        <h4 className='specialties'>Specialties : Addictions, Parenting issues, Caregiver Issues and Stress,Dependent Personality, Divorce and Separation, 
        Domestic Violence, Emptiness, Family Problems</h4>
        <p className='profile_desc'> I have approximately 10 years of experience working with people, kids, teens, and couples 
        as a licensed mental health counselor. I have spent the past five years collaborating closely with victims of severe
         trauma and domestic violence. I am passionate about assisting people in becoming their best self. This, in my opinion, 
         frequently calls for the effort of raising our awareness of how our emotions affect our behavior.Any person who is committed
          to changing their unhealthy thought patterns and behaviors in order to become the person they have always wanted to be is someone 
          I look forward to working with. 



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
          <b>WA LICSW 67312063</b>

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

export default ProfileThree
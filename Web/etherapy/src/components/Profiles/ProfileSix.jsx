import React from 'react'
import '../../styles/Pro_One.css'
import 'remixicon/fonts/remixicon.css'
import {Link} from 'react-router-dom';

import { Container, Row, Col } from 'reactstrap'
import Head from '../head/Head'

import ProSix from '../../assets/images/pro6.jpg'

function ProfileSix() {
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
        <img src={ProSix}  alt=''></img>

        </div>
        
        
      </div>
   
    
  
            </Col>
            <Col lg='6'>
            <h5 className='profile_subtitle'>
          <center><b>Mr. Peter Nelson</b></center>
        </h5>
        <h4 className='specialties'> Specialties : Family conflicts, Communication Problems, Control Issues, Coping with Natural or Human-Caused Disaster, Disruptive Mood Dysregulation Disorder </h4>
        <p className='profile_desc'> I have 8 years of experience working with couples, families, and people of all ages as a 
        licensed marriage and family therapist in Iowa. I've worked with people who had a variety of issues, including as depression, 
        anxiety, marital problems, parenting troubles, and pressures in general. All concerns are welcomed in my counseling without any bias. 
        I think everyone deserves to be treated with decency, kindness, and respect. Each client receives treatment from me according to their 
        specific needs, goals, and circumstances. Everyone has the capacity for change.

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
          <b>IA LMFT 176398</b>

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

export default ProfileSix
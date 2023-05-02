import React from 'react'

import {Link} from 'react-router-dom';
import {motion} from 'framer-motion'

import Head from '../components/head/Head'
import '../styles/home.css'

import { Container, Row, Col } from 'reactstrap'
import background from '../assets/images/background.jpg'

import Services from '../services/Services';



function Home() {
  return (
    <Head title = {'Home'}>
      <section className='hero_section'>
        <Container>
          <Row>
            <Col lg='6' md='6'>
              <div className='hero_content'>
                
                <h2> Welcome to talkingMinds</h2>
                <p> People who talk about their mental health struggles are not attention seeking, they are Support Seeking.</p>

                <motion.button whileTap={{scale:1.2}} className='start_btn'> <Link to = '/FrontScreen'>Get Started</Link> </motion.button>

              </div>
            </Col>

            <Col lg='6' md='6'>
              <div className='hero_img'>
                <img src={background} alt=''/>

              </div>
            </Col>

          </Row>
        </Container>

      </section>
      <Services/>
      
    </Head>
  )
}

export default Home
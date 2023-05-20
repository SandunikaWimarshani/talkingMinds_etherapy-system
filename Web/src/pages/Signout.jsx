import React from 'react'

import {Link} from 'react-router-dom';
import {motion} from 'framer-motion'


import '../styles/home.css'

import { Container, Row, Col } from 'reactstrap'
import final from '../assets/images/final.jpg'





function Signout() {
  return (
   
        <Container>
          <Row>
            <Col lg='6' md='6'>
              <div className='hero_content'>
                
                <h3 > Thank you for participating! We appreciate your time and contribution</h3>
                <p> You're successfully singned out!</p>

                <motion.button whileTap={{scale:1.2}} className='start_btn'> <Link to = '/'>Go Back</Link> </motion.button>

              </div>
            </Col>

            <Col lg='6' md='6'>
              <div className='hero_img'>
                <img src={final} alt=''/>

              </div>
            </Col>

          </Row>
        </Container>

      
  )
}

export default Signout
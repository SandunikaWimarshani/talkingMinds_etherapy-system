import React from 'react'
import { Fragment } from 'react'
import { Container, Row, Col, Form, FormGroup } from 'reactstrap'

import {Link} from 'react-router-dom';

import cover from '../assets/images/cover.png'

function Chatbot() {
  return (
    <Fragment>
        <section>
            <div>
                <span className='front-icon'>
                    <center>
                    <div className='front-img'>
                    <img src= {cover} alt='cover' width={120} height={120} />

                    </div>
                    

                    </center>
                

                </span>
                <h1 className='hello'><center>Welcome to the Chat!</center></h1>
                <h3><center>Let's talk with your therapist</center></h3>
               
                <Container>
                    <Row>
                        <Col lg='8'>
                            <Form classname='box'>
                           
                            <button className='lets-start-btn'><Link to = '/chatScreen'>  Chat with message </Link></button>
                            <button className='lets-start-btn'><Link to = '/SessionUser'>  Let's Meeting </Link></button>

                            

                            </Form>
                            
                        </Col>
                    </Row>
                </Container>
            </div>
        </section>
    </Fragment>
  )
}

export default Chatbot
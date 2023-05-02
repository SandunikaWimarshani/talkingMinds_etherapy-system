import React from 'react'
import { Fragment } from 'react'
import { Container, Row, Col, Form, FormGroup } from 'reactstrap'
import '../../styles/frontScreen.css'
import {Link} from 'react-router-dom';

import cover from '../../assets/images/cover.png'

function Frontscreen() {
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
                <h1 className='hello'><center>Hello Welcome!</center></h1>
                <h3><center>Please answer the following questions</center></h3>
                <Container>
                    <Row>
                        <Col lg='8'>
                            <Form classname='box'>
                            <h4><center> Enter your name </center> </h4>
                            
                            <FormGroup className='box_group'>
                            <input type='text' className='tName'></input>

                            </FormGroup>
                            <button className='lets-start-btn'><Link to = '/Quiz'>  Let's Start </Link></button>

                            </Form>
                            
                        </Col>
                    </Row>
                </Container>
            </div>
        </section>
    </Fragment>
  )
}

export default Frontscreen
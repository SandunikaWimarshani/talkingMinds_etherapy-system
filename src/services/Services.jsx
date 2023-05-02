import React from 'react'
import { Container, Row, Col } from 'reactstrap'

import './services.css'

import service from '../assets/images/service_img.jpg'
import select from '../assets/images/select.jpg'
import talk from '../assets/images/talk.jpg'


function Services() {
  return (
    <section className='services'>
        <Container>
            <Row>
               
                <Col lg='3' md='4'>
                    <div className='service_item'>
                        <h1> The Greatest Online Therapists Waiting at Your Tap </h1>
                        <p> You obviously need some continuous support if you're suffering and hurting from the stress of daily life. You can deal with various mental health challenges and associated issues with the assistance of qualified professionals through therapy

A qualified therapist will comprehend the underlying causes of your difficulties, provide thoughtful solutions, and assist you in moving forward in terms of your mental health.

Getting online counseling is one of the easiest ways to handle this. You don't need to travel to a therapist's office or spend time while stuck in traffic

Online therapy is typically just as successful as traditional face-to-face counseling, which is why so many people have switched in recent years.</p>

                   <div className='service_img'>
                        <img src={service} alt=''></img>
                    </div>
                    </div>
                    
                </Col>
            </Row>
        </Container>

        <Container>
            <Row>
                <Col lg='3' md='4'>
                    <div className='select_person'>
                        <h1> Comfort and Privacy </h1>
                        <p>
                        The ability to meet with online therapists from the convenience of your home is one of the major benefits. You can hide away yourself in a room or other quiet area and communicate with your therapist just through audio or video sessions.

While a therapist's office affords plenty of confidentiality, online counseling combines privacy and anonymity. If you don't want to, you don't have to disclose your identity to the therapist. Those in high-risk situations who can't afford to attend a therapist openly will find this to be especially beneficial. Sometime selling aid is simpler for people who struggle with social anxiety.
                        </p>

                        <div className='select_img'>
                        <img src={select} alt=''></img>
                    </div>
                    </div>
                    
                </Col>
            </Row>
        </Container>

        <Container>
            <Row>
                <Col lg='3' md='4'>
                    <div className='talk'>
                        <h1>Convenience and Accessibility</h1>
                        <p> It's simple and convenient to participate in sessions with an online therapist. You can access therapists online if you have an internet connection and a computer or other device that can connect to the internet. Even if you live in a far-off part of your country, you can still take advantage of a wide range of skills.

Those from remote communities that have few options benefit from this. If there isn't a therapist in your neighborhood who can help with your mental health issue, you can discover one online. Because you may receive therapy in the comfort of your own home rather than having to travel to the therapist's office, talkingMinds is also more accessible to those with mobility problems or other limitations.</p>

                    <div className='talk_img'>
                    <img src={talk} alt=''></img>
    
                    </div>
                    </div>
                    

                </Col>
            </Row>
        </Container>
    </section>
  )
}

export default Services
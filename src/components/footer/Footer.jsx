import React from 'react'
import './footer.css'

import cover from '../../assets/images/cover.png'

import { Container, Row, Col } from 'reactstrap'
import { Link } from 'react-router-dom';

function Footer() {
  return (
    <footer className='footer'>
      <Container>
        <Row>
          <Col lg='4'>
            <div className='logo'>
              <img src={cover} alt=''></img>
              <div>
                <h1> talkingMinds </h1>
              </div>
            </div>
            
          </Col>

          <Col lg='2'>
            <div className='footer_quick-links'>
            <div className="footer_center">
      <ul className="footer_list">
      <li className="footerlist_item">
        <Link to='/home'>
        HOME
        </Link></li>
        
        <li className="footerlist_item">
        <Link to='/list'>
        LIST
        </Link></li>
        <li className="footerlist_item">
        <Link to='/C_login'>
        FOR COUNSELORS
        </Link></li>
        <li className="footerlist_item">
        <Link to='/admin'>
        FOR ADMIN
        </Link></li>

        
        

      </ul>
      <br>
      
      </br>

<div className="footer_base">
      <ul className="footer_baselist">
      <li className="footer_baseitem">Ⓒ 2023</li>
        <li className="footer_baseitem">talkingMinds</li>
        <li className="footer_baseitem">Privacy Policy </li>
        <li className="footer_baseitem">Terms of Service</li>

      </ul>
      
         
    </div>


      
      
         
    </div>
            </div>
          </Col>
        </Row>
      </Container>

    </footer>
  )
}

export default Footer
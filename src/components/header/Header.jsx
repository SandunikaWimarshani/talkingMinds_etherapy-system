import React from 'react';

import { NavLink } from 'react-router-dom';
import './header.css'


import cover from '../../assets/images/cover.png'

import { Container, Row } from 'reactstrap';

const nav_links = [
  {
    path: 'home',
    display: 'HOME'
    
  },
  {
    path: 'list',
    display: 'LIST'
  },
  {
    path: 'appointment',
    display: 'APPOINTMENT'
  },
  
  {
    path: 'signin',
    display: 'SIGNIN'
  },
  {
    path: 'signout',
    display: 'SIGNOUT'
  },
]

function Header() {
  return (
    <header className='header'>
      
      <Container>
        <Row>
          <div className='nav_wrapper'>
            <div className='logo'> 
              <img src= {cover} alt='cover' />
              <div>
                <h1> talkingMinds </h1>
              </div>

            </div>
            <div className='navigation'>
              <ul className='menu'>
                
                {
                  nav_links.map((item, index) => (
                    <li className='nav_item' key={index}>
                      <NavLink to = {item.path} className={(navClass) => navClass.isActive ? 'nav_active': ''}> {item.display}</NavLink>
                    </li>

                  ))
                }
                
              </ul>
            </div>

            
            
            
           
          </div>
        </Row>
      </Container>

    </header>
  )
}

export default Header
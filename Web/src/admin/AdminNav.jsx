import React from 'react'
import { Container, Row } from 'reactstrap'

import { NavLink } from 'react-router-dom'

import '../styles/admin_nav.css'
import Cover from '../../src/assets/images/cover.png'

const admin_nav = [
  {
    display: 'Dashboard',
    path: '/dashboard'
  },

  

  
 
]

function AdminNav() {

 
  return (
   
    <div className='admin-header'>
    <div className='admin_nav-top'>
      <Container>
        <div className='admin_nav-wrapper-top'>
        <div className='logo'>
          <div className='logo_img'>
            <img src={Cover} alt=''></img>
          </div>
              
              <div>
                <h1> talkingMinds </h1>
              </div>

              

              <br></br>

              

            </div>

          
        </div>
        
      </Container>
    </div>

    <section className='admin_menu '>
      <Container>
        <Row>
          <div className='admin_navigation'>
            <ul className='admin_menu-list'>
              {admin_nav.map((item,index) => (
                <li className='admin_menu-item' key={index}>
                  <NavLink to={item.path} className={navClass => navClass.isActive ? 'active_admin-menu' : ''} > {item.display}</NavLink>
                </li>
              ))}

            </ul>
          </div>
        </Row>
      </Container>
    </section>
   </div>
 
  )
}

export default AdminNav


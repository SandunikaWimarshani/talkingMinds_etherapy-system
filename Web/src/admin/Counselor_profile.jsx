import React from 'react'
import { Container, Row, Col, Nav, NavItem, NavLink, TabContent, TabPane } from 'reactstrap'
import classnames from 'classnames'

import '../styles/counselor.css'
import counselor from '../assets/images/counselor.jpg'

function CounselorProfile() {
  const [activeTab, setActiveTab] = React.useState('1')

  const toggleTab = (tab) => {
    if (activeTab !== tab) setActiveTab(tab)
  }

  return (
    <Container>
      <Row>
        <Col lg="3">
          <div className='user_img'>
            <img src={counselor} alt=''></img>
          </div>
          <Nav vertical className='profile_tabs'>
            <NavItem>
              <NavLink
                className={classnames({ active: activeTab === '1' })}
                onClick={() => { toggleTab('1'); }}>
                New Counselors
              </NavLink>
            </NavItem>
            <NavItem>
              <NavLink
                className={classnames({ active: activeTab === '2' })}
                onClick={() => { toggleTab('2'); }}>
                Appointments
              </NavLink>
            </NavItem>
          </Nav>
        </Col>
        <Col lg="9">
          <TabContent activeTab={activeTab}>
            <TabPane tabId="1">
              <h3>New Counselors</h3>
              <p>List of new counselors goes here...</p>
            </TabPane>
            <TabPane tabId="2">
              <h3>Appointments</h3>
              <p>List of appointments goes here...</p>
            </TabPane>
          </TabContent>
        </Col>
      </Row>
    </Container>
  )
}

export default CounselorProfile

import React from 'react';
import { Container, Row, Col, Button, TabContent, TabPane } from 'reactstrap';
import classnames from 'classnames';
// import firebase from 'firebase';

import '../styles/counselor.css';
import counselor from '../assets/images/counselor.jpg';

function CounselorProfile() {
  const [activeTab, setActiveTab] = React.useState('1');
  const [appointments, setAppointments] = React.useState([]);

  const toggleTab = (tab) => {
    if (activeTab !== tab) setActiveTab(tab);
  };

  // const getAppointments = () => {
  //   const appointmentsRef = firebase.database().ref('appointments');
  //   appointmentsRef.on('value', (snapshot) => {
  //     const appointments = snapshot.val();
  //     const appointmentsList = [];
  //     for (let id in appointments) {
  //       appointmentsList.push(appointments[id]);
  //     }
  //     setAppointments(appointmentsList);
  //   });
  // };

  // React.useEffect(() => {
  //   getAppointments();
  // }, []);

  return (
    <Container>
      <Row>
        <Col lg="3">
          <div className="user_img">
            <img src={counselor} alt=""></img>
          </div>
          <div className="profile_tabs">
            <Button
              color="link"
              className={classnames({ active: activeTab === '1' })}
              onClick={() => { toggleTab('1'); }}>
              New Counselors
            </Button>
            <Button
              color="link"
              className={classnames({ active: activeTab === '2' })}
              onClick={() => { toggleTab('2'); }}>
              Appointments
            </Button>
          </div>
        </Col>
        <Col lg="9">
          <TabContent activeTab={activeTab}>
            <TabPane tabId="1">
              <h3>New Counselors</h3>
              <p>List of new counselors goes here...</p>
            </TabPane>
            <TabPane tabId="2">
              <h3>Appointments</h3>
              <ul>
                {appointments.map((appointment) => (
                  <li key={appointment.id}>
                    <div>Date: {appointment.date}</div>
                    <div>Time: {appointment.time}</div>
                    <div>Counselor: {appointment.counselor}</div>
                    <div>Client: {appointment.client}</div>
                  </li>
                ))}
              </ul>
            </TabPane>
          </TabContent>
        </Col>
      </Row>
    </Container>
  );
}

export default CounselorProfile;

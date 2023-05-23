import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Table, Button, Modal, ModalHeader, ModalBody, ModalFooter } from 'reactstrap';
import { db } from '../firebase config';
import { collection, query, onSnapshot, orderBy, deleteDoc, doc } from 'firebase/firestore';
import { Link, useNavigate } from 'react-router-dom';
import '../styles/list-appointments.css';

function ListAppointments() {
  const [showPopup, setShowPopup] = useState(false);
  const [appointments, setAppointments] = useState([]);
  const [successMessage, setSuccessMessage] = useState('');
  const [selectedAppointment, setSelectedAppointment] = useState(null);
  const [showDetails, setShowDetails] = useState(false);

  const navigate = useNavigate();

  useEffect(() => {
    const q = query(collection(db, 'appointment'), orderBy('date'));

    const unsubscribe = onSnapshot(q, (snapshot) => {
      const appointmentData = snapshot.docs.map((doc) => ({
        id: doc.id,
        ...doc.data(),
      }));
      setAppointments(appointmentData);
    });

    return unsubscribe;
  }, []);

  const handleDelete = async (id) => {
    try {
      await deleteDoc(doc(db, 'appointment', id));
      setSuccessMessage('Appointment deleted successfully');
    } catch (error) {
      console.error('Error removing document: ', error);
    }
  };

  const handleEdit = (id) => {
    console.log(`Editing appointment with id ${id}`);
    navigate(`/Update_appointments/${id}`);
  };

  const deleteAppointment = async (id) => {
    const confirmDelete = window.confirm('Are you sure you want to delete this appointment?');
    if (confirmDelete) {
      try {
        await deleteDoc(doc(db, 'appointment', id));
        setSuccessMessage('Appointment deleted successfully');
      } catch (error) {
        console.error('Error removing document: ', error);
      }
    }
  };

  const toggleDetailsModal = () => {
    setShowDetails(!showDetails);
  };

  const openAppointmentDetails = (appointment) => {
    setSelectedAppointment(appointment);
    toggleDetailsModal();
  };

  return (

    
    <Container>
      <Row>
        <Col lg='12'>
        <div className={showPopup ? 'overlay' : ''} onClick={() => setShowPopup(false)}>
          {showPopup && (
            <div className='popup'>
              
              <h2 className='wait'> Your Appointments is Confirmed!</h2>
              <button onClick={() => setShowPopup(true)} className='btnpop'>
              <Link to='/Confirm_appointments'>OK</Link>
              </button>
              
            </div>
          )}
        </div>
          <h1 className='booking_title'>Appointments List</h1>
          {successMessage && <p>{successMessage}</p>}
          <Table className='table'>
            <thead>
              <tr>
                <th className='columns'>Name</th>
                <th className='columns'>Email</th>
                <th className='columns'>Counselor Name</th>
                <th className='columns'>Date</th>
                <th className='columns'>Time</th>
                <th className='columns actions-column'>Actions</th>
              </tr>
            </thead>
            <tbody>
              {appointments.map((appointment) => (
                <tr key={appointment.id}>
                  <td>{appointment.name}</td>
                  <td>{appointment.email}</td>
                  <td>{appointment.counselorName}</td>
                  <td>{appointment.date}</td>
                  <td>{appointment.time}</td>
                  <td>
                    <button className='dlt-btn' onClick={() => deleteAppointment(appointment.id)}>
                      Delete
                    </button>
                    {' '}
                    <Button className='edit-btn' color='warning' onClick={() => handleEdit(appointment.id)}>
                      Edit
                    </Button>
                    {' '}
                    <Button className='view-btn' color='primary'  onClick={() => setShowPopup(true)}>
                   
                      View
                    </Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
          
        </Col>
      </Row>
      
    </Container>
  );
}

export default ListAppointments;

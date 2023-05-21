import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Table, Button, Input } from 'reactstrap';
import { db } from '../firebase config';
import { collection, query, onSnapshot, orderBy, deleteDoc, doc, where } from 'firebase/firestore';
import { Link, useNavigate } from 'react-router-dom';
import '../styles/clist-appointments.css';

function CListAppointments() {
  const [appointments, setAppointments] = useState([]);
  const [successMessage, setSuccessMessage] = useState('');
  const [searchQuery, setSearchQuery] = useState('');

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

  const handleSearch = (event) => {
    setSearchQuery(event.target.value);
  };

  const filteredAppointments = appointments.filter((appointment) =>
    appointment.counselorName.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <Container>
      <Row>
        <Col lg='12'>
          <h1 className='booking_title'>List of Appointments</h1>
          {successMessage && <p>{successMessage}</p>}
          <div className='search-container'>
            <Input
              type='text'
              placeholder='Search counselor name here..'
              value={searchQuery}
              onChange={handleSearch}
              className='search-input'
            />
          </div>
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
              {filteredAppointments.map((appointment) => (
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

export default CListAppointments;

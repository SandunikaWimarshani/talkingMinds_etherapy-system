import React, { useState, useEffect } from 'react';
import { Button, Form, FormGroup, Input, Label, Modal, ModalBody, ModalFooter, ModalHeader } from 'reactstrap';
import { db } from '../firebase config';

const EditAppointment = ({ isOpen, toggle, appointment }) => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [counselorName, setCounselorName] = useState('');
  const [date, setDate] = useState('');
  const [time, setTime] = useState('');
  const [mode, setMode] = useState('');

  useEffect(() => {
    // Fetch the appointment data from Firebase and set the state variables
    db.collection('appointment').doc(appointment.id).get().then(doc => {
      const data = doc.data();
      setName(data.name);
      setEmail(data.email);
      setCounselorName(data.counselorName);
      setDate(data.date);
      setTime(data.time);
      setMode(data.mode);
    });
  }, [appointment.id]);

  const handleEdit = () => {
    db.collection('appointment').doc(appointment.id).set({
      name,
      email,
      counselorName,
      date,
      time,
      mode,
    }, { merge: true });
    toggle();
  }

  return (
    <Modal isOpen={isOpen} toggle={toggle}>
      <ModalHeader toggle={toggle}>Edit Appointment</ModalHeader>
      <ModalBody>
        <Form>
          <FormGroup>
            <Label for="name">Name</Label>
            <Input type="text" name="name" id="name" value={name} onChange={(e) => setName(e.target.value)} />
          </FormGroup>
          <FormGroup>
            <Label for="email">Email</Label>
            <Input type="email" name="email" id="email" value={email} onChange={(e) => setEmail(e.target.value)} />
          </FormGroup>
          <FormGroup>
            <Label for="counselorName">Counselor Name</Label>
            <Input type="text" name="counselorName" id="counselorName" value={counselorName} onChange={(e) => setCounselorName(e.target.value)} />
          </FormGroup>
          <FormGroup>
            <Label for="date">Date</Label>
            <Input type="date" name="date" id="date" value={date} onChange={(e) => setDate(e.target.value)} />
          </FormGroup>
          <FormGroup>
            <Label for="time">Time</Label>
            <Input type="time" name="time" id="time" value={time} onChange={(e) => setTime(e.target.value)} />
          </FormGroup>
          <FormGroup>
            <Label for="mode">Mode</Label>
            <Input type="select" name="mode" id="mode" value={mode} onChange={(e) => setMode(e.target.value)}>
              <option value="online">Audio</option>
              <option value="in-person">Video</option>
            </Input>
          </FormGroup>
        </Form>
      </ModalBody>
      <ModalFooter>
        <Button color="primary" onClick={handleEdit}>Save Changes</Button>{' '}
        <Button color="secondary" onClick={toggle}>Cancel</Button>
      </ModalFooter>
    </Modal>
  );
};

export default EditAppointment;

import React, { useState } from 'react';
import { Button, Form, FormGroup, Input, Label, Modal, ModalBody, ModalFooter, ModalHeader } from 'reactstrap';
import { db } from '../firebase config';

const EditAppointment = ({ isOpen, toggle, appointment }) => {
  const [name, setName] = useState(appointment.name);
  const [email, setEmail] = useState(appointment.email);
  const [counselorName, setCounselorName] = useState(appointment.counselorName);
  const [date, setDate] = useState(appointment.date);
  const [time, setTime] = useState(appointment.time);
  const [mode, setMode] = useState(appointment.mode);

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
              <option value="online">Online</option>
              <option value="in-person">In-person</option>
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

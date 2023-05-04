import React, { useState, useEffect } from 'react';
import { Container, Row, Col } from 'reactstrap';

function AdminDashboard() {
  const [counselorsCount, setCounselorsCount] = useState(0);
  const [usersCount, setUsersCount] = useState(0);
  const [feedbackResults, setFeedbackResults] = useState([]);
  const [progress, setProgress] = useState(0);

  useEffect(() => {
    // Fetch data from the server
    fetch('/api/dashboard')
      .then(response => response.json())
      .then(data => {
        setCounselorsCount(data.counselorsCount);
        setUsersCount(data.usersCount);
        setFeedbackResults(data.feedbackResults);
        setProgress(data.progress);
      })
      .catch(error => console.error(error));
  }, []);

  return (
    <Container>
      <Row>
        <Col>
          <h1>Dashboard</h1>
        </Col>
      </Row>
      <Row>
        <Col md={3}>
          <div className="dashboard-card">
            <h2>Counselors Count</h2>
            <p>{counselorsCount}</p>
          </div>
        </Col>
        <Col md={3}>
          <div className="dashboard-card">
            <h2>Users Count</h2>
            <p>{usersCount}</p>
          </div>
        </Col>
        <Col md={3}>
          <div className="dashboard-card">
            <h2>Feedback Results</h2>
            <ul>
              {feedbackResults.map((result, index) => (
                <li key={index}>{result}</li>
              ))}
            </ul>
          </div>
        </Col>
        <Col md={3}>
          <div className="dashboard-card">
            <h2>Progress</h2>
            <p>{progress}%</p>
          </div>
        </Col>
      </Row>
    </Container>
  );
}

export default AdminDashboard;

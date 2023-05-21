import React, { useState } from 'react';
import '../../styles/quiz.css';
import { Link } from 'react-router-dom';
import { getAuth, onAuthStateChanged } from 'firebase/auth';
import { db } from '../../firebase config';
import {
  collection,
  addDoc,
  where,
  serverTimestamp,
  onSnapshot,
  query,
  orderBy,
  doc,
  updateDoc,
  getDocs,
  collectionRef,
} from 'firebase/firestore';

function Quiz3() {
  const collectionRef = collection(db, 'Clients');
  var docid;

  const [selectedAnswer, setSelectedAnswer] = useState('');

  const updateClient = async (val) => {
    var email;
    const auth = getAuth();
    onAuthStateChanged(auth, (user) => {
      if (user) {
        email = user.email;
      }
    });
    const filteredRef = query(collectionRef, where('email', '!=', `${email}`));

    const querySnapshot = await getDocs(filteredRef);
    docid = await querySnapshot.docs[0].id;
    console.log(docid);

    const taskDocRef = doc(db, 'Clients', docid);
    await updateDoc(taskDocRef, {
      relationshipstatus: val,
    });
  };

  const handleAnswerClick = (val) => {
    setSelectedAnswer(val);
  };

  return (
    <div>
      <div>
        <div>
          <p>
            <span className='count'> Question 3 of 5</span>
          </p>
        </div>
        <h2 className='q1'> What is your relationship status?</h2>
        <div className='option-container'>
          <p
            className={`option ${selectedAnswer === 'Single' ? 'selected' : ''}`}
            onClick={() => handleAnswerClick('Single')}
          >
            Single
          </p>
          <p
            className={`option ${selectedAnswer === 'Married' ? 'selected' : ''}`}
            onClick={() => handleAnswerClick('Married')}
          >
            Married
          </p>
          <p
            className={`option ${selectedAnswer === 'In a relationship' ? 'selected' : ''}`}
            onClick={() => handleAnswerClick('In a relationship')}
          >
            In a relationship
          </p>
          <p
            className={`option ${selectedAnswer === 'Separated' ? 'selected' : ''}`}
            onClick={() => handleAnswerClick('Separated')}
          >
            Separated
          </p>
          <p
            className={`option ${selectedAnswer === 'Divorced' ? 'selected' : ''}`}
            onClick={() => handleAnswerClick('Divorced')}
          >
            Divorced
          </p>
          <p
            className={`option ${selectedAnswer === 'Widowed' ? 'selected' : ''}`}
            onClick={() => handleAnswerClick('Widowed')}
          >
            Widowed
          </p>
        </div>

        <div className='button-container'>
          <button className='pre'>
            <Link to='/Quiz2'>Previous</Link>
          </button>

          <button className='next'>
            <Link to='/Quiz4'>Next</Link>
          </button>
        </div>
      </div>
    </div>
  );
}

export default Quiz3;

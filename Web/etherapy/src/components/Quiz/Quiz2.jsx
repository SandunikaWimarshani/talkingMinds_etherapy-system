import React from 'react'
import '../../styles/quiz.css'
import {Link} from 'react-router-dom';
import { getAuth, onAuthStateChanged } from "firebase/auth";

import {db} from '../../firebase config';
import { collection, addDoc,where,serverTimestamp, onSnapshot,query, orderBy, doc, updateDoc, getDocs, collectionRef } from 'firebase/firestore';
import { useEffect, useState } from 'react'

function Quiz2() {

  const collectionRef = collection(db, "Clients");
  var docid;
  //const email = firebase.auth().currentUser.email;

  
    const updateClient = async (val) => {
      var email;
      const auth = getAuth();
      onAuthStateChanged(auth, (user) => {
        if (user) {
          email = user.email;
        } 
      });
      const filteredRef = query(
        collectionRef,
        where(`email`, "!=", `${email}`)
      );

      const querySnapshot = await getDocs(filteredRef);
      docid = await querySnapshot.docs[0].id;
      console.log(docid);


      const taskDocRef = doc(db, 'Clients', docid);
      await updateDoc(taskDocRef, {
        age: val,
      });

      
    };

  


  return (
    <div>
      <div>
        <div>
          <p>
            <span className='count'> Question 2 of 5</span>
          </p>
        </div>
        <h2 className='q1'> How old are you?</h2>
        <div className='option-container'>
          <p className='option' onClick={(e) => updateClient("Below 10")}>Below 10</p>
          <p className='option' onClick={(e) => updateClient("10-18")}>10-18</p>
          <p className='option' onClick={(e) => updateClient("18-30")}>18-30</p>
          <p className='option' onClick={(e) => updateClient("30-50")}>30-50</p>
          <p className='option' onClick={(e) => updateClient("Above 50")}>Above 50</p>

        </div>

        <div className='button-container'>
          <button className='pre'><Link to = '/Quiz'>Previous</Link></button>
          
          <button className='next'><Link to = '/Quiz3'>Next</Link></button>
        </div>
      </div>
    </div>
  )
}

export default Quiz2
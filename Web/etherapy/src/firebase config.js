


import { initializeApp } from "firebase/app";
//import { getAnalytics } from "firebase/analytics";
import { getAuth} from 'firebase/auth';
import { getFirestore} from 'firebase/firestore'
import { getStorage} from 'firebase/storage'



const firebaseConfig = {
  apiKey: "AIzaSyA8oo-vhEKC0LEjpK9nwukvAHaUoMyPPpU",
  authDomain: "e-therapy-app.firebaseapp.com",
  projectId: "e-therapy-app",
  storageBucket: "e-therapy-app.appspot.com",
  messagingSenderId: "34214729472",
  appId: "1:34214729472:web:e99c5c0e348af04a0685e5",
  measurementId: "G-13MXEC4SW6"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
//const analytics = getAnalytics(app);
export const auth = getAuth(app);
export const db = getFirestore(app)
export const storage = getStorage(app)

export default app;
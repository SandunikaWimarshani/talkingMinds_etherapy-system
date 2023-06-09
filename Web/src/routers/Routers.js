import { Routes, Route, Navigate} from 'react-router-dom'


import Home from '../pages/Home'
import List from '../pages/List'
import Appointment from '../pages/Appointment'
import Feedback from '../pages/Feedback'
import SignIn from '../pages/Signin'
import Signout from '../pages/Signout'

import SignUp from '../pages/Signup'
import AppointmentRoute from '../pages/Appointment'

import CounselorLogin from '../pages/C_login'
import CreateCounselor from '../pages/Create_couns'
import Admin from '../pages/admin'

import Quiz from '../components/Quiz/Quiz'
import Quiz2 from '../components/Quiz/Quiz2'
import Quiz3 from '../components/Quiz/Quiz3'
import Quiz4 from '../components/Quiz/Quiz4'
import Quiz5 from '../components/Quiz/Quiz5'
import FrontScreen from '../components/Quiz/Frontscreen'
import Dashboard  from '../admin/Dashboard'
import Counselor_profile  from '../admin/Counselor_profile'
import User_profile  from '../admin/User_profile'
import View_user  from '../admin/View_user'



// import User from '../admin/User'



import ProfileOne from '../components/Profiles/ProfileOne'
import ProfileTwo from '../components/Profiles/ProfileTwo'
import ProfileThree from '../components/Profiles/ProfileThree'
import ProfileFour from '../components/Profiles/ProfileFour'
import ProfileFive from '../components/Profiles/ProfileFive'
import ProfileSix from '../components/Profiles/ProfileSix'

import ListAppointments from '../pages/List_appointments'
import UpdateAppointments from '../pages/Update_appointments'
import ConfirmAppointment from '../pages/Confirm_appointments'

import Chatbot from '../pages/Chatbot'
import ChatScreen from '../pages/Screen'
import Session from '../pages/Session'
import SessionUser from '../pages/Session_user'


import CListAppointments from '../admin/CList_appointments'




function Routers() {
  return (
    <Routes>
    <Route path='/' element={<Navigate to ='home' />} />
    <Route path='home' element={<Home/>} />
    <Route path='list' element={<List/>} />
    <Route path='appointment' element={<Appointment/>} />
    <Route path='feedback' element={<Feedback/>} />
    <Route path='signin' element={<SignIn/>} />
    <Route path='signout' element={<Signout/>} />
    <Route path='signup' element={<SignUp/>} />
    <Route path='c_login' element={<CounselorLogin/>} />
    <Route path='Create_couns' element={<CreateCounselor/>} />

    <Route path='admin' element={<Admin/>} />
    <Route path='Counselor_profile' element={<Counselor_profile/>} />
    <Route path='User_profile' element={<User_profile/>} />
    <Route path='View_user' element={<View_user/>} />

    
    <Route path='profileOne' element={<ProfileOne/>} />
    <Route path='profileTwo' element={<ProfileTwo/>} />
    <Route path='profileThree' element={<ProfileThree/>} />
    <Route path='profileFour' element={<ProfileFour/>} />
    <Route path='profileFive' element={<ProfileFive/>} />
    <Route path='profileSix' element={<ProfileSix/>} />

    <Route path='List_appointments' element={<ListAppointments/>} />
    <Route path='Update_appointments/:id' element={<UpdateAppointments/>} />
    <Route path='Confirm_appointments' element = {<ConfirmAppointment/>} />
    <Route path='Confirm_appointments' element = {<ConfirmAppointment/>} />

  
    <Route path='Chatbot' element = {<Chatbot/>} />
    <Route path='ChatScreen' element = {< ChatScreen/>} />
    <Route path='Session' element = {<Session/>} />
    <Route path='SessionUser' element = {<SessionUser/>} />
    
  
    

    <Route path='quiz' element={<Quiz/>} />
    <Route path='quiz2' element={<Quiz2/>} />
    <Route path='quiz3' element={<Quiz3/>} />
    <Route path='quiz4' element={<Quiz4/>} />
    <Route path='quiz5' element={<Quiz5/>} />
    <Route path='frontscreen' element={<FrontScreen/>} />
    
    <Route path='/*' element={<AppointmentRoute/>} />
      
    <Route path='dashboard' element={<Dashboard/>} />
    <Route path='CListAppointments' element={<CListAppointments/>} />
    
   
     
   
      
   

    
  </Routes>
    

  )
 
  
};

export default Routers
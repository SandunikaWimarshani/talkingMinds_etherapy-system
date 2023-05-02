import React from 'react'
import {useAuth} from '../custom-hooks/useAuth'
import { Navigate } from 'react-router-dom'
import { Outlet } from 'react-router-dom'

const AppointmentRoute = ({ children }) => {
    const { currentuser } = useAuth();

    return currentuser ? <Outlet /> : <Navigate to= '/signin' />
}

export default AppointmentRoute
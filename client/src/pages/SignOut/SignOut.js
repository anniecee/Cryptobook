import React from 'react'
import './SignOut.css'
import { useNavigate } from 'react-router-dom';

function SignOut() {

  localStorage.setItem("loggedIn", false);
  localStorage.removeItem("username");
  localStorage.removeItem("userID");
  localStorage.removeItem("loginID");

  var navigate = useNavigate();

  function loginPage() {
    navigate('/Login');
  }

  return (
    <div className="SignOut">
      <h1>You have been logged out.</h1>
      <button onClick={loginPage}>Go to Login</button>
    </div>
  )
}

export default SignOut
import React, {useState} from 'react'
import './Register.css'
import Axios from 'axios';
import {useNavigate} from 'react-router-dom';

function Register() {

  const [loginID, setLoginID] = useState("");
  const [password, setPassword] = useState("");

  const [errMsg, setErrMsg] = useState("");

  let navigate = useNavigate();

  const register = () => {

    Axios.post("http://localhost:3001/user/login", {
      loginID: loginID,
      password: password
    }).then((response)=>{
      if(response.data.loggedIn === false && response.data.message !== "Wrong password"){
        Axios.post("http://localhost:3001/user/register", {
          loginID: loginID,
          password: password
        }).then((response2) => {
          localStorage.setItem("loggedIn", true);
          localStorage.setItem("loginID", loginID);

          navigate('/');
          window.location.reload();
        });
      } else if (response.data.loggedIn === true || response.data.message === "Wrong password"){
        setErrMsg("User Already exists.");
      }
    });

    
  };

  return (
    <div className="Register">
      <h1>Registration</h1>
        <div className="RegisterForm">
          <input type="text" placeholder='LoginID' onChange={
            (event)=>{
              setLoginID(event.target.value);
            }
          }/>
          <input type="password" placeholder='Password' onChange={
            (event)=>{
              setPassword(event.target.value);
            }
          }/>
          <button onClick={register}>Register</button>
          <h1 style={{color: 'red'}}>{errMsg}</h1>
        </div>
    </div>
  )
}

export default Register
import React, {useState} from 'react'
import './Login.css'
import Axios from 'axios';

import {useNavigate} from 'react-router-dom';

function Login() {

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const [errMsg, setErrMsg] = useState("");

  let navigate = useNavigate();

  const login = () => {
    Axios.post("http://localhost:3001/user/login", {
      username: username,
      password: password
    }).then((response) => {
      if(response.data.loggedIn){
        localStorage.setItem("loggedIn", true);
        localStorage.setItem("username", response.data.username);
        navigate("/");
      }else{
        setErrMsg(response.data.message);
      }
    });
  };

  return (
    <div className="Login">
      <h1>Login</h1>
        <div className="LoginForm">
          <input type="text" placeholder='Username' onChange={
            (event)=>{
              setUsername(event.target.value);
            }
          }/>
          <input type="password" placeholder='Password' onChange={
            (event)=>{ 
              setPassword(event.target.value);
            }
          }/>
          <button onClick={login}>Login</button>
          <h1 style={{color: 'red'}}>{errMsg}</h1>
        </div>
    </div>
  )
}

export default Login
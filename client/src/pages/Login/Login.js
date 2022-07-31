import React, {useState} from 'react'
import './Login.css'
import Axios from 'axios';

import {useNavigate} from 'react-router-dom';

import {Formik, Form, Field, ErrorMessage} from 'formik';
import * as Yup from 'yup'

function Login() {

  const [errMsg, setErrMsg] = useState("");

  let navigate = useNavigate();

  const login = (data) => {
    Axios.post("http://localhost:3001/user/login", {
        data
    }).then((response) => {
      if(response.data.loggedIn){
        localStorage.setItem("loggedIn", true);
        localStorage.setItem("loginID", response.data.loginID);
        localStorage.setItem("userID", response.data.userID);
        localStorage.setItem("username", response.data.username);
                
        navigate("/");
        window.location.reload();
      }else{
        setErrMsg(response.data.message);
      }
    });
  };

  const initialValues = {
    loginID: "",
    password: ""
  }

  const validationSchema = Yup.object().shape({
    loginID: Yup.string().required(),
    password: Yup.string().required(),
  });

  return (
    <div className="Login">
      <h1>Login</h1>
      <Formik
        initialValues={initialValues}
        onSubmit={login}
        validationSchema={validationSchema}
      >
      <Form className="formContainer">
        <label>LoginID:</label>
        <ErrorMessage name="loginID" component="span" />
                <Field
                autoComplete="off" 
                id="inputLogin" 
                name="loginID" 
                placeholder="LoginID"/>
      <label>password:</label>
      <ErrorMessage name="password" component="span" />
                <Field
                type="password"
                autoComplete="off" 
                id="inputLogin" 
                name="password" 
                placeholder="password"/>
          
          <button type="submit">Login</button>
          
      </ Form>
      </ Formik>
      <h1 style={{color: 'red'}}>{errMsg}</h1>
    </div>
  )
}

export default Login

/*<div className="LoginForm">
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
          <button onClick={login}>Login</button>
          <h1 style={{color: 'red'}}>{errMsg}</h1>
        </div>*/
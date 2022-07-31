import React, {useState} from 'react'
import './Register.css'
import Axios from 'axios';
import {useNavigate} from 'react-router-dom';

import {Formik, Form, Field, ErrorMessage} from 'formik';
import * as Yup from 'yup'



function Register() {

  const [loginID, setLoginID] = useState("");
  const [password, setPassword] = useState("");

  const [errMsg, setErrMsg] = useState("");

  let navigate = useNavigate();

  const initialValues = {
    loginID: "",
    name: "",
    userName_user: "",
    password: "",
    email: ""
  }

  const validationSchema = Yup.object().shape({
    loginID: Yup.string().required(),
    name: Yup.string().required(),
    userName_user: Yup.string().required(),
    password: Yup.string().required(),
    email: Yup.string().required()
  });

  const register = (data) => {
    Axios.post("http://localhost:3001/user/login", {
      data
    }).then((response)=>{
      if(response.data.loggedIn === false && response.data.message !== "Wrong password"){
        Axios.post("http://localhost:3001/user/register", {
          data
        }).then((response2) => {
          localStorage.setItem("loggedIn", true);
          localStorage.setItem("loginID", data.loginID);
          localStorage.setItem("userID", response2.data.userID);
          localStorage.setItem("username", response2.data.userName_user);

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
      <Formik
        initialValues={initialValues}
        onSubmit={register}
        validationSchema={validationSchema}
      >
      <Form className="formContainer">
        <label>LoginID:</label>
        <ErrorMessage name="login" component="span" />
                <Field
                autoComplete="off" 
                id="inputRegister" 
                name="loginID" 
                placeholder="LoginID"/>

        <label>Username:</label>
        <ErrorMessage name="userName_user" component="span" />
                <Field
                autoComplete="off" 
                id="inputRegister" 
                name="userName_user" 
                placeholder="Username"/>

        <label>Name:</label>
        <ErrorMessage name="name" component="span" />
                <Field
                autoComplete="off" 
                id="inputRegister" 
                name="name" 
                placeholder="Name"/>

        <label>Email:</label>
        <ErrorMessage name="email" component="span" />
                <Field
                autoComplete="off" 
                id="inputRegister" 
                name="email" 
                placeholder="Email"/>

        <label>Password:</label>
        <ErrorMessage name="password" component="span" />
                <Field
                type="password"
                autoComplete="off" 
                id="inputRegister" 
                name="password" 
                placeholder="Password"/>

        <button type="submit">Register</button>
      </Form>

      </Formik>
    </div>
  )
}

export default Register

/*<div className="RegisterForm">
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
        </div>*/
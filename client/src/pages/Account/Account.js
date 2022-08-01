import Axios from 'axios';
import React, {useState, useEffect} from 'react'
import './Account.css'

import {Formik, Form, Field, ErrorMessage} from 'formik';
import * as Yup from 'yup'

function Account() {

    const [balance, setBalance] = useState(0);
    const [cardsList, setCardsList] = useState([]);

    const initialValues = {
        cardNumber: "",
        nameOnCard: ""
      }
    
      const validationSchema = Yup.object().shape({
        cardNumber: Yup.string()
        .required()
        .matches(/^[0-9]+$/, "Must be only digits")
        .min(9, 'Must be exactly 9 digits')
        .max(9, 'Must be exactly 9 digits'),
        nameOnCard: Yup.string().required(),
      });

    useEffect(() => {
        
      Axios.get("http://localhost:3001/account", 
        {params: {
            userID: localStorage.getItem("userID")
        }}
      ).then((response)=>{
        setBalance(response.data[0].balance);
      });
    }, [])

    useEffect(()=>{
        Axios.get("http://localhost:3001/account/cards",
        {params: {
            userID: localStorage.getItem("userID")
            }}
        ).then((response)=>{
            setCardsList(response.data);
        })
    }, []);

    const addCard = (data)=>{
        const userID = localStorage.getItem("userID");
        console.log(data);

        Axios.post("http://localhost:3001/account/addcard",
        {
            userID: userID,
            cardNumber: data.cardNumber,
            nameOnCard: data.nameOnCard

        }).then((response)=>{
            setCardsList(response.data);
        })
    }
    

    return (
        <div>
            <div className="AccountInfo">
                <h1>Hello {localStorage.getItem("username")}</h1>
                Current Balance: {balance}
            </div>
            <div className="CardList">
                <h1>Cards List</h1>
                {cardsList.length > 0 ? (
                    <>
                    {cardsList.map((value)=>{
                        return(
                        <div className="card">
                            <div className="NameOnCard">{value.nameOnCard}</div>
                            <div className="NumberOnCard">{value.cardNumber_bankinginfo}</div>
                        </div>
                        )
                    })}
                    </>
                ):(
                    <></>
                )}
                <div className="AddCard">
                    <Formik 
                        initialValues={initialValues}
                        onSubmit={addCard}
                        validationSchema={validationSchema}>
                        <Form className="formContainer">
                        <label>Card Number:</label>
                        <ErrorMessage name="cardNumber" component="span" />
                                <Field
                                autoComplete="off" 
                                id="inputCard" 
                                name="cardNumber" 
                                placeholder="Card Number"/>

                        <label>Name on Card:</label>
                        <ErrorMessage name="nameOnCard" component="span" />
                                <Field
                                autoComplete="off" 
                                id="inputCard" 
                                name="nameOnCard" 
                                placeholder="Name on Card"/>

                        <button type="submit">Add card</button>

                        </Form>
                    </Formik>
                </div>
            </div>
        </div>
  )
}

export default Account
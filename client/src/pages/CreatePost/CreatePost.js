import Axios from 'axios';
import React, { useState } from 'react'
import "./CreatePost.css"
import {useNavigate} from 'react-router-dom';

function CreatePost() {
    const [text, setText] = useState("");
    const [price, setPrice] = useState(0); 
    const [crypto, setCrypto] = useState("");  
    const [type, setType] = useState("");  

    let navigate = useNavigate();
    
    const upload = () => {
      const formData = new FormData();
        Axios.post("http://localhost:3001/upload", {
            text: text,
            type: type,
            crypto: crypto,
            price: price,
            userID: localStorage.getItem("userID")
        }).then(()=>{
            navigate('../');
        });
      };

  return (
    <div className="CreatePost">
      <h1>Create a Post</h1>
        <div className="CreatePostForm">
          <input type="text" placeholder='Text' 
          onChange={(event)=>{
            setText(event.target.value)
          }}/>
          <select className="PostTypeSelection"
            onChange={(event)=>{
              setType(event.target.value)
            }}
          >
            <option value="normal">Normal post</option>
            <option value="buy">Buy post</option>
            <option value="sell">Sell post</option>
          </select>
          <input
            type="text" placeholder="Crypto (if buy/sell post)"
            onChange={(event)=>{
              setCrypto(event.target.value)
            }}
          />
          <input 
            type="number" 
            placeholder ="Set price (if buy/sell post)" 
            onChange={(event)=>{
              setPrice(event.target.value)
            }}
          />
          <button onClick={upload}>Post!</button>
        </div>
    </div>
  )
}

export default CreatePost
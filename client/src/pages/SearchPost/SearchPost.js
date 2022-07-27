import Axios from 'axios';
import React, { useState } from 'react'
import "./SearchPost.css"
import {useNavigate} from 'react-router-dom';

function CreatePost() {
    const [title, setTitle] = useState("");
    const [caption, setCaption] = useState("");
    const [img, setImg] = useState([]);
    const [price, setPrice] = useState();  // return integer?
    const [crypto, setCrypto] = React.useState("");  
    const [type, setType] = useState("");  

    let navigate = useNavigate();
    
    const upload = () => {
        const formData = new FormData();
        formData.append("file", img[0]);
        formData.append("upload_preset", "z0ri6wkr");
        Axios.post(
            "https://api.cloudinary.com/v1_1/djmmryhbz/image/upload",
             formData).then((response)=>{
                const imgId = response.data.public_id;

                Axios.post("http://localhost:3001/upload", {
                    title: title,
                    caption: caption,
                    imgId: imgId,
                    type: type,
                    crypto: crypto,
                    price: price,
                    userId: localStorage.getItem("username")
                }).then(()=>{
                    navigate('../');
                });
             });
    };

  return (
    <div className="CreatePost">
      <h1>Create a Post</h1>
        <div className="RegisterForm">
          <input type="text" placeholder='Title' 
          onChange={(event)=>{
            setTitle(event.target.value)
          }}/>
          <input type="text" placeholder='Caption' 
          onChange={(event)=>{
            setCaption(event.target.value)
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
            type="text" placeholder="Crypto"
            onChange={(event)=>{
              setCrypto(event.target.value)
            }}
          />
          <input 
            type="number" 
            placeholder ="Set price" 
            onChange={(event)=>{
              setPrice(event.target.value)
            }}
          />
          <input type="file" 
          onChange={(event)=>{
            setImg(event.target.files)
          }}/>
          <button onClick={upload}>Post!</button>
        </div>
    </div>
  )
}

export default CreatePost
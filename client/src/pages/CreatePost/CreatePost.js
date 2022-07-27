import Axios from 'axios';
import React, { useState } from 'react'
import "./CreatePost.css"
import {useNavigate} from 'react-router-dom';

function CreatePost() {
    const [title, setTitle] = useState("");
    const [caption, setCaption] = useState("");
    const [img, setImg] = useState([]);

    let navigate = useNavigate();

    // Option for buy/sell/...
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
                    userId: localStorage.getItem("username")
                }).then(()=>{
                    navigate('/');
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
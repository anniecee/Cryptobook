import React, {useEffect, useState} from 'react'
import "./Home.css"
import {Image} from 'cloudinary-react'
import  Axios  from 'axios';
import ThumbUpAltIcon from "@material-ui/icons/ThumbUpAlt";

function Home() {

  const [posts, setPosts] = useState([]);

  useEffect(() => {
    if(!localStorage.getItem("loggedIn")){
      localStorage.setItem("loggedIn", false);
    }
  }, []);

  useEffect(()=>{
    Axios.get("http://localhost:3001/upload").then((response)=>{
      setPosts(response.data);
    });
  }, []);

  const likePost = (postId, key)=>{
    Axios.post("http://localhost:3001/upload/like",
    {
      userLikes: localStorage.getItem("username"),
      postId: postId
    }).then((response)=>{

    });
  }

  return (
    <div className="Home">
      {posts.map((val, key)=>{
        return(
        <div className='Post'>
          <div className='Image'>
            <Image cloudName="djmmryhbz" 
              publicId={val.imgId} />
          </div>
        
        <div className='Content'>
          <div className='title'>
            {" "}
            {val.title} / by @{val.userID_post}
          </div>
          <div className='caption'>{val.text}</div>
        </div>
          <div className='Interactions'>
            <ThumbUpAltIcon id="likeButton"
            onClick={()=>{
              likePost(val.postId, key);
            }}/>
            {(val.likeCount)}
          </div>
        </div>
        )
      })}
    </div>
  )
} 

export default Home 
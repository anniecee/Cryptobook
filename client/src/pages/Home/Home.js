import React, {useEffect, useState} from 'react'
import "./Home.css"
import {Image} from 'cloudinary-react'
import  Axios  from 'axios';
import ThumbUpAltIcon from "@material-ui/icons/ThumbUpAlt";
import {useNavigate} from 'react-router-dom';

function Home() {

  const [posts, setPosts] = useState([]);
  let navigate = useNavigate(); // use this to navigate to new url path

  // Check login state
  useEffect(() => {
    if(!localStorage.getItem("loggedIn")){
      localStorage.setItem("loggedIn", false);
    }
  }, []);

  // Get all post data to display
  useEffect(()=>{
    Axios.get("http://localhost:3001/upload").then((response)=>{
      setPosts(response.data);
      console.log(response.data);
    });
  }, []);

  // Like function 
  // (Need to change multiple likes)
  const likePost = (postId, key)=>{
   
    Axios.post("http://localhost:3001/upload/like",
    {
      userLikes: localStorage.getItem("username"),
      postId: postId
    }).then((response)=>{
      window.location.reload(); // reload page
    });
  }

  // Add buy & sell button => when it's active, manipulate Transaction table

  // Add delete function
  const deletePost = (postId, key)=>{
    console.log(postId);   
    Axios.delete("http://localhost:3001/upload/delete/",
    {data: {
      postId: postId
    }}).then((response)=>{
      window.location.reload(); // reload page
    });
  }

  // Maybe have a separate page on nav bar for search 
  // (post max like count/ post by username/ post by name/ post by Crypto)

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
            {val.title} / by @{val.userId}
          </div>
          <div className='caption'>{val.caption}</div>
        </div>
          <div className='Interactions'>
            <ThumbUpAltIcon id="likeButton"
            onClick={()=>{
              likePost(val.postId, key);
            }}/>
            {val.likes}
            <div>
              <button onClick={()=>{deletePost(val.postId);}}>Delete</button>
            </div>
          </div>
        </div>
        )
      })}
    </div>
  )
} 

export default Home 
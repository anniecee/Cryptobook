import React, {useEffect, useState} from 'react'
import "./Home.css"
import {Image} from 'cloudinary-react'
import  Axios  from 'axios';
import ThumbUpAltIcon from "@material-ui/icons/ThumbUpAlt";
//import {useNavigate} from 'react-router-dom';

function Home() {

  const [posts, setPosts] = useState([]);
  const [postType, setPostType] = useState({});

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

  // Set post types (buy/sell + price + crypto)
  // TBU

  // Like function 
  // TBU
  // (Need to change multiple likes)
  const likePost = (postID, key)=>{
   
    Axios.post("http://localhost:3001/upload/like",
    {
      userLikes: localStorage.getItem("username"),
      postID: postID
    }).then((response)=>{
      window.location.reload(); // reload page
    });
  }

  // Add delete function
  // TBU
  const deletePost = (postID, key)=>{
    console.log(postID);   
    Axios.delete("http://localhost:3001/upload/delete/",
    {data: {
      postID: postID
    }}).then((response)=>{
      window.location.reload(); // reload page
    });
  }

  // Return front end
  return (
    <div className="Home">
       {/* Display post */}
       {posts.map((val, key)=>{
        return(

          <div className='Post'> 
            {/* Image - NEED TO CHANGE FOR imgId*/}
            <div className='Image'>
              <Image cloudName="djmmryhbz" 
                publicId={val.imgId} />
            </div>

            {/* Content */}
            <div className='Content'>
              <div className='title'>
                {" "}
                {val.title} / by @{val.userName_user}
              </div>
              <div className='caption'>{val.text}</div>
            </div>

            {/* Interaction */}
            <div className='Interactions'>
              <ThumbUpAltIcon id="likeButton"
              onClick={()=>{likePost(val.likeCount, key);}}/>
              {val.likeCount}
              <div className='DeleteButton'>
                <button onClick={()=>{deletePost(val.postID);}}>Delete</button>
              </div>
            </div>

          </div>
          )
        })}
        {/* End - Display post */}
    </div>
  )
} 

export default Home 
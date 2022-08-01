import React, { useState, useEffect } from 'react'
import "./PostInfo.css"
import Axios from 'axios';
import {useNavigate} from 'react-router-dom';
import ThumbUpAltIcon from "@material-ui/icons/ThumbUpAlt";

// Maybe have a separate page on nav bar for search 
// (post max like count/ post by username/ post by name/ post by Crypto)
function PostInfo() {
    const [like, setLike] = useState(0);
    const [posts, setPosts] = useState([]);

    const [options, setOptions] = useState({});
    
    let selectionsSearchLike = {
      postID: false,
      userID_post: false,
      text: false,
      likeCount: false,
      type: false
    };
    
    // Check login state
    useEffect(() => {
      if(!localStorage.getItem("loggedIn")){
        localStorage.setItem("loggedIn", false);
      }
    }, []);

    // Search by Like
    const searchByLike = () => {
      Axios.get("http://localhost:3001/postInfo/byLike",
          {params: {like: like}}
      ).then((response)=>{
        // Display posts as requested
        setPosts(response.data);
        setOptions(options);
        console.log(response.data);
         
      });
    };

  // Return front end
  return (
    <div className="PostInfo">
      <h1>Search for post info:</h1>
        <div className="RegisterForm">
          {/* Search by like */}
          <input type="number" class="searchByLikeBox" placeholder='With at least X likes' 
          onChange={(event)=>{
            setLike(event.target.value)
          }}/>
            <div className="Ticks">
            {/* Selections to display for SearchByLike posts */}
              PostID:<input type="checkbox" class="checkbox" onChange={()=>{
                  selectionsSearchLike = options;
                  selectionsSearchLike.postID = !options.postID;
                  setOptions(selectionsSearchLike);
              }}/>
              UserID:<input type="checkbox" class="checkbox" onChange={()=>{
                  selectionsSearchLike = options;
                  selectionsSearchLike.userID_post = !options.userID_post;
                  setOptions(selectionsSearchLike);
              }}/>
              Text:<input type="checkbox" class="checkbox" onChange={()=>{
                  selectionsSearchLike = options;
                  selectionsSearchLike.text = !options.text;
                  setOptions(selectionsSearchLike);
              }}/>
              Like Count:<input type="checkbox" class="checkbox" onChange={()=>{
                  selectionsSearchLike = options;
                  selectionsSearchLike.likeCount = !options.likeCount;
                  setOptions(selectionsSearchLike);
              }}/>
              Post Type:<input type="checkbox" class="checkbox" onChange={()=>{
                  selectionsSearchLike = options;
                  selectionsSearchLike.type = !options.type;
                  setOptions(selectionsSearchLike);
              }}/>
            </div>
            <button onClick={searchByLike}>Search by like!</button>
          
        </div>
        
        <div>
            <h1>RESULTS: </h1>
        </div>

        {/* Display table */}
        <div className="ResultTable">
            <table>
                <tr>
                    {options.postID ? (<th> Post ID </th>): (<></>) }
                    {options.userID_post ? (<th> User ID </th>): (<></>) }
                    {options.text ? (<th> Text </th>): (<></>) }
                    {options.likeCount ? (<th> Like Count </th>): (<></>) }
                    {options.type ? (<th> Post Type </th>): (<></>) }
                </tr>
                {posts.map((val, key) => {
                return (
                    <tr key={key}>
                        {options.postID ? (<td> {val.postID}</td>): (<></>) }
                        {options.userID_post ? (<td> {val.userID_post}</td>): (<></>) }
                        {options.text ? (<td> {val.text}</td>): (<></>) }
                        {options.likeCount ? (<td> {val.likeCount}</td>): (<></>) }
                        {options.type ? (<td> {val.type}</td>): (<></>) }
                    </tr>
                )
                })}

            </table>
        </div>

        {/* End - Display post */}
    </div>
    
  )
}

export default PostInfo
import './App.css';
import {BrowserRouter, Routes, Route} from 'react-router-dom';
import Home from "./pages/Home/Home";
import Navbar from './components/Navbar';
import Login from "./pages/Login/Login";
import Register from "./pages/Register/Register";
import CreatePost from "./pages/CreatePost/CreatePost";
import SearchPost from "./pages/SearchPost/SearchPost";
import PostInfo from "./pages/PostInfo/PostInfo";
import SignOut from "./pages/SignOut/SignOut";
import Transactions from './pages/Transactions/Transactions';

function App() {
  return (
    <>
      <Navbar />
      <BrowserRouter>
        <Routes>
          <Route path='/' element={<Home />}>
          </Route>
          <Route path='/register' element={<Register />}>
          </Route>
          <Route path='/login' element={<Login />}>
          </Route>
          <Route path='/CreatePost' element={<CreatePost />}>
          </Route>
          <Route path='/SearchPost' element={<SearchPost />}>
          </Route>
          <Route path='/PostInfo' element={<PostInfo />}>
          </Route>
          <Route path='/signOut' element={<SignOut />}>
          </Route>
          <Route path='/Transactions' element={<Transactions />}>
          </Route>
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;

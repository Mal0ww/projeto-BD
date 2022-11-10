import {BrowserRouter as Router, Routes, Route} from 'react-router-dom'
import Home from './components/pages/Home';
import Cadastro from './components/pages/Cadastro';
import Login from './components/pages/Login';
import Cursos from './components/pages/Cursos';
import Container from './components/layout/Container';
import Navbar from './components/layout/Navbar';
import Footer from './components/layout/Footer';

function App() {
  return (
    <Router>
      <Navbar></Navbar>
      <Container customClass="min-heigth">
        <Routes>
            <Route exact path='/' element={<Home/>}></Route>
            <Route exact path='/Cadastro' element={<Cadastro/>}></Route>
            <Route exact path='/Login' element={<Login/>}></Route>
            <Route exact path='/Cursos' element={<Cursos/>}></Route>
        </Routes>
      </Container>
      <Footer></Footer>
    </Router>
  );
}

export default App;

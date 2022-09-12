import {BrowserRouter as Router, Routes, Route} from 'react-router-dom'
import Home from './components/pages/Home';
import EspoPosi from './components/pages/EspoPos';
import Universidades from './components/pages/Univer';
import Cadastro from './components/pages/Cadastro';

import Container from './components/layout/Container';
import Navbar from './components/layout/Navbar';
import Footer from './components/layout/Footer';
import NovoAtle from './components/pages/NovoAtleta';
import Atleta from './components/pages/Atleta';
function App() {
  return (
    <Router>
      <Navbar></Navbar>
      <Container customClass="min-heigth">
        <Routes>
            <Route exact path='/' element={<Home/>}></Route>
            <Route exact path='/EspoPos' element={<EspoPosi/>}></Route>
            <Route exact path='/Univer' element={<Universidades/>}></Route>
            <Route exact path='/Cadastro' element={<Cadastro/>}></Route>
            <Route exact path='/NovoAtle' element={<NovoAtle/>}></Route>
            <Route exact path='/Atle' element={<Atleta/>}></Route>
        </Routes>
      </Container>
      <Footer></Footer>
    </Router>
  );
}

export default App;

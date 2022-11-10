import {Link} from 'react-router-dom'
import Container from './Container';
import styles from './css/Navbar.module.css';
import logo from '../../img/logo2.png'
import Botao from './Botao';
function Navbar(){
    return(
        <nav className={styles.navbar}>
            <Link to='/'>
                <img src={logo} alt='Banco'></img>
            </Link>
            <Container>
                <ul className={styles.list}>
                    <li className={styles.item}>
                        <Link to='/'>Home</Link>
                    </li>
                    <li className={styles.item}>
                        <Link to='/Cursos'>Cursos</Link>
                    </li>
                    <li className={styles.item}>
                        <Link to='/Cadastro'>Cadastro</Link>
                    </li>
                    <li className={styles.item}>
                        <Botao to='/Login' text="Login"></Botao>
                    </li>
                </ul>

            </Container>
      </nav>
    )
}

export default Navbar;
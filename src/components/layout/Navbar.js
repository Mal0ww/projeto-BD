import {Link} from 'react-router-dom'
import Container from './Container';
import styles from './css/Navbar.module.css';
import logo from '../../img/logo2.png'
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
                        <Link to='/Atle'>Atletas</Link>
                    </li>
                    <li className={styles.item}>
                        <Link to='/EspoPos'>Esporte/Posição</Link>
                    </li>
                    <li className={styles.item}>
                        <Link to='/Univer'>Universidades</Link>
                    </li>
                </ul>

            </Container>
      </nav>
    )
}

export default Navbar;
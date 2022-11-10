import {FaDatabase, FaGithub} from 'react-icons/fa';
import styles from './css/Footer.module.css'
function Footer(){
    return(
        <footer className={styles.footer}>
            <ul className={styles.foo_list}>
                <li>
                    <FaGithub></FaGithub>
                </li>
                <li>
                    <FaDatabase></FaDatabase>
                </li>
            </ul>
            <p className={styles.copy_right}><span>Projeto-Banco de Dados</span> &copy; 2022</p>
        </footer>
    )
}

export default Footer;
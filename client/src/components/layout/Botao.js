import { Link } from "react-router-dom";
import styles from './css/Botao.module.css';

function Botao({to, text}){
    return(
        <Link className={styles.btn} to={to}>
            {text}
        </Link>
    )
}

export default Botao;
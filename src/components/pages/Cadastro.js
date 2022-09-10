import ajustes from '../../img/ajustes.jpg'
import styles from './css/Home.module.css'
function Cadastro(){
    return(
        <div className={styles.home_container}>
            <h1>Cadastro</h1>
            <img src={ajustes} alt='Banco'></img>
        </div>
    )
}

export default Cadastro;
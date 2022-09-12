import ajustes from '../../img/ajustes.jpg'
import styles from './css/Home.module.css'
function EspoPosi(){
    return(
        <div className={styles.home_container}>
            <h1>EsporPosi</h1>
            <img src={ajustes} alt='Banco'></img>
        </div>
    )
}

export default EspoPosi;
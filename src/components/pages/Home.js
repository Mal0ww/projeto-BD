import styles from './css/Home.module.css'
import ajustes from '../../img/ajustes.jpg'
import Botao from '../layout/Botao';

function Home(){
    return(
        <section className={styles.home_container}>
            <h1>(site em estado de desenvolvimento)<span> Pica-Pau</span></h1>
            <Botao to='/NovoAtle' text="Cadastrar Atleta"></Botao>
            <img src={ajustes} alt='Banco'></img>
        </section>
    )
}

export default Home;
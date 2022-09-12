import styles from './css/NovoAtleta.module.css';
import AtletaForm from '../atletas/AtletaForm';

function NovoAtle(){
    return(
        <div className={styles.novoAtleta_container}>
            <h1>Cadastrar Atleta</h1>
            <p>Dados pessoais</p>
            <AtletaForm btnText="Cadastrar"></AtletaForm>
        </div>
    )
}

export default NovoAtle;
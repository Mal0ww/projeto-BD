import styles from './css/AtletaForm.module.css'
import Input from '../form/Input';
import BotaoSubmit from '../form/BotaoSubmi';
function AtletaForm({btnText}){
    return(
        <form className={styles.form}>
            <Input type="file" text='Foto' name="foto" placeholder="Inserir arquivo" accept="image/png, image/jpeg"></Input>
            <Input type="text" text="Nome" name="nome" placeholder="Nome e sobrenome..."></Input>
            <Input type="text" text="Esporte" name="Esporte" placeholder="Esporte..."></Input>
            <Input type="text" text="Universidade" name="universidade" placeholder="Universidade..."></Input>
            <Input type="text" text="Curso" name="curso" placeholder="Curso..."></Input>
            <Input type="text" text="Matricula" name="matricula" placeholder="matricula..."></Input>
            <Input type="number" text="Idade" name="idade" placeholder="Idade..."></Input>
            <Input type="date" text="Data de Nascimento" name="data_nasci"></Input>
            <BotaoSubmit text={btnText}></BotaoSubmit>
        </form>
    )
}

export default AtletaForm;
import styles from './css/Login.module.css';
import BotaoSubmit from '../form/BotaoSubmi';
function Login({btnText}){

    return(
        <div className={styles.login_container}>
            <h4>Faça login na sua conta.</h4>
            <hr></hr>
            <form>
                <label>Email:</label>
                <input
                    type="email"
                    name="email"
                    placeholder="Inserir email..."
                    required>
                </input>
                <label>Senha:</label>
                <input
                    type="password"
                    name="senha"
                    placeholder="Inserir email..."
                    required>
                </input>
                <BotaoSubmit text={"Logar"}></BotaoSubmit>
            </form>
                
        </div>
    )
}
export default Login;
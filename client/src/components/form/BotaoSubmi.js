import styles from './css/BotaoSubmit.module.css'
function BotaoSubmit({text, func}){
    
    return(
        <button onClick={func} className={styles.btn}>{text}</button>
    )
}

export default BotaoSubmit;
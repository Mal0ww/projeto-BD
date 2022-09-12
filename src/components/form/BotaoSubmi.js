import styles from './css/BotaoSubmit.module.css'
function BotaoSubmit({text}){
    return(
        <button className={styles.btn}>{text}</button>
    )
}

export default BotaoSubmit;
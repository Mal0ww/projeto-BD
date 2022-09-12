import styles from './css/Input.module.css';

function Input({type, text, name, placeholder, handleOnChange, value, accept}){
    return(
        <div className={styles.form_control}>
            <label htmlFor={name}>{text}:</label>
            <input 
                type={type} 
                id={name} 
                placeholder={placeholder}
                onChange={handleOnChange}
                value={value}
                accept={accept}
                />
        </div>
    )
}

export default Input;
import styles from './css/Input.module.css';


function Input({type, name, placeholder, handleOnChange, value ,accept}){
    return(
        <div className={styles.form_control}>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
            {/*<label htmlFor={name}>{text}:</label>*/}
            <input 
                type={type} 
                id={name} 
                placeholder={placeholder}
                onChange={handleOnChange}
                accept={accept}
                value={value}
            />
        </div>
    )
}

export default Input;
import React, {useState} from 'react';
import styles from './css/Cadastro.module.css';
import BotaoSubimit from '../form/BotaoSubmi';
import Axios from 'axios';

function Cadastro({dadosUsuario}){

    const [values, setValues] = useState(dadosUsuario || {});

    function handleChange(e) {
        setValues({...values, [e.target.name]: e.target.value});
        console.log(values);
    }

    const handleClickButton = (value) => {
        console.log(values);
        Axios.post("http://localhost:3001/cadastro", {
            cpf: values.cpf, 
            nome_usuario: values.nome_usuario, 
            senha: values.senha, 
            primeiro_nome: values.primeiro_nome, 
            sobrenome: values.sobrenome, 
            email: values.email, 
            data_nasci: values.data_nasci, 
            cidade: values.cidade, 
            uf: values.uf,
        }).then((response) =>{
            console.log(response);
        });
    }

    return(
        <div className={styles.cadastro_container}>
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
            <h4>Inscreva-se para ter acesso ao conteúdo.</h4>
            <hr></hr>
            <form>
                <label>Email: </label>
                <input 
                    type="email" 
                    name="email" 
                    placeholder="Inserir email..."  
                    onChange={handleChange}
                    required>
                </input>
                <label>Nome de Usuario: </label>
                <input 
                    type="text" 
                    name="nome_usuario" 
                    placeholder="Inserir nome de usuario..." 
                    onChange={handleChange}
                    required>
                </input>
                <label>Senha: </label>
                <input 
                    type="password" 
                    name="senha" 
                    placeholder="Inserir senha..." 
                    onChange={handleChange}
                    required>
                </input>
                <label>Primeiro Nome: </label>
                <input 
                    type="text" 
                    name="primeiro_nome" 
                    placeholder="Inserir primeiro nome..."  
                    onChange={handleChange}
                    required>
                </input>
                <label>Segundo Nome: </label>
                <input 
                    type="text" 
                    name="sobrenome" 
                    placeholder="Inserir sobrenome..."  
                    onChange={handleChange}
                    required>
                </input>
                <label>CPF: </label>
                <input 
                    type="text" 
                    name="cpf" 
                    placeholder="Inserir CPF..." 
                    onChange={handleChange}
                    required>
                </input>
                <label>Data de Nascimento: </label>
                <input 
                    type="date" 
                    name="data_nasci" 
                    placeholder="Inserir data de nascimento..."  
                    onChange={handleChange}
                    required>
                </input>
                <label>Cidade: </label>
                <input 
                    type="text" 
                    name="cidade" 
                    placeholder="Inserir cidade..."  
                    onChange={handleChange}
                    required>
                </input>
                <label>UF: </label>
                <input 
                    type="text" 
                    name="uf" 
                    placeholder="Inserir estado..."  
                    onChange={handleChange}
                    required>
                </input>
                <BotaoSubimit text={"Cadastrar"} func={handleClickButton}></BotaoSubimit>
            </form>
        </div>

    )
}

export default Cadastro;
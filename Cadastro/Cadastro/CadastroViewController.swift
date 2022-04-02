//
//  CadastroViewController.swift
//  Cadastro
//
//  Created by Edilson Schwanck Borges on 29/03/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class CadastroViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userrs: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var senhaConfirmacao: UITextField!
   
    @IBAction func CriarConta(_ sender: Any) {
        
        
        if let emailR = self.email.text{
            if let userrsR = self.userrs.text{
                if let senhaR = self.senha.text{
                    if let senhaConfirmacaoR = self.senhaConfirmacao.text{
                        
                        if senhaR == senhaConfirmacaoR{
                            
                            //validação de nome
                            if userrsR != ""{
                                
                                let autenticacao  = Auth.auth()
                                autenticacao.createUser(withEmail: emailR, password: senhaR) { usuario, erro in
                                    
                                    
                                    if erro == nil{
                                        
                                        
                                        if usuario == nil{
                                            let alerta = Alerta(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar autenticação tente novamente!")
                                            self.present(alerta.getAlerta(), animated: true, completion: nil)
                                            
                                            
                                        }else{
                                            
                                            let armazenamento = Database.database().reference()
                                            let usurios = armazenamento.child("usuarios")
                                            
                                            
                                            
                                            let usuarioDados = ["usuario": userrsR, "email": emailR]
                                            let _: Void = usurios.child(usuario!.user.uid).setValue(usuarioDados)
                                            
                                            //let usuarioFile = usurios.child(usuario!.user.uid).setValue(usuarioDados)
                                            
                                            
                                            
                                            //redireciondado usuario para tela principal
                                            self.performSegue(withIdentifier: "cadastroLoginSegue", sender: nil)
                                            
                                            
                                        }
                                        
                                    }else{
                                        let erroR = erro! as NSError
                                        if let codigoErro = erroR.code as? Int {
                                            
                                            let erroTexto = codigoErro
                                            
                                            var mensagemErro = ""
                                            
                                            switch erroTexto {
                                                
                                            case 17008 :
                                                mensagemErro = "E-mail invalido, Digite um E-mail válido!!!"
                                                break
                                                
                                            case 17026 :
                                                mensagemErro = "Senha precisa ter no mínimo 6 Caracteres, com letras e numeros!!!"
                                                break
                                                
                                            case 17007 :
                                                mensagemErro = "Esse e-mail já está cendo usado por outro usuario, digite outro e-mail!!!"
                                                break
                                                
                                            default:
                                                mensagemErro = "Dados digitados estão invalidos"
                                                
                                            }
                                            let alerta = Alerta(titulo: "Dados Invalidos", mensagem: mensagemErro)
                                            self.present(alerta.getAlerta(), animated: true, completion: nil)
                                            
                                        }
                                    }
                                }
                            }else{
                                let alerta = Alerta(titulo: "Dados incorretos", mensagem: "digite o usuario para prosseguir!")
                                self.present(alerta.getAlerta(), animated: true, completion: nil)
                            }
                        }else{
                            let alerta = Alerta(titulo: "Erro ao autenticar", mensagem: "As senhas não estão iguais, digite novamente!")
                            self.present(alerta.getAlerta(), animated: true, completion: nil)
                            
                        }//fim da validação da senha
                        
                        
                    }
                }
            }
        }
    }    //fechamento metodo criar conta

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

}

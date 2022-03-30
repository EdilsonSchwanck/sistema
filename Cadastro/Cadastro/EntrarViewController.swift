//
//  EntrarViewController.swift
//  Cadastro
//
//  Created by Edilson Schwanck Borges on 29/03/22.
//

import UIKit
import FirebaseAuth

class EntrarViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    @IBAction func entrar(_ sender: Any) {
        
        if let emailR = self.email.text{
            if let senhaR = self.senha.text{
                
                let autenticacao = Auth.auth()
                
                autenticacao.signIn(withEmail: emailR, password: senhaR) { usuario, erro in
                    if erro == nil{
                        
                        if usuario == nil{
                            
                            let alerta = Alerta(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar autenticação, tente novamente.")
                            self.present(alerta.getAlerta(), animated: true, completion: nil)
                            
                        
                        }else{
                            
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                            
                        }
                        
                    }else{
                        let alerta = Alerta(titulo: "Dados incorretos", mensagem: "Verifique os dados Digitatos")
                        self.present(alerta.getAlerta(), animated: true, completion: nil)
                    }
                }
                
                
            }
        }
        
        
    }//fim do botao
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  PagCadastroViewController.swift
//  Cadastro
//
//  Created by Edilson Schwanck Borges on 29/03/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase



class PagCadastroViewController: UIViewController {
    
    @IBOutlet weak var codigo: UITextField!
    @IBOutlet weak var nome: UITextField!
   
 
    @IBOutlet weak var cpf: UITextField!
    
    @IBOutlet weak var endereco: UITextField!
    
    @IBOutlet weak var telefone: UITextField!
    

    func limparCampos() {
        codigo.text = ""
        nome.text = ""
        cpf.text = ""
        endereco.text = ""
        telefone.text = ""
    }
    
    
    @IBAction func salvar(_ sender: Any) {
        
       
        guard let codigoR = codigo.text else { return }
        guard let nomeR = nome.text, !nomeR.isEmpty else{
            let alerta = Alerta(titulo: "Error", mensagem: "Campo nome não pode estar em branco")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return }
        guard let cpfR = cpf.text, !cpfR.isEmpty else {
            let alerta = Alerta(titulo: "Error", mensagem: "campo CPF esta em branco")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return
            
        }
        
        guard let enderecoR = endereco.text else { return }
        guard let telefoneR = telefone.text else { return }
        
        let armazenamento = Database.database().reference()
        let usurios = armazenamento.child("Sistema")
        
        let usuarioDados = ["codigo": codigoR, "nome": nomeR, "cpf": cpfR, "endereco": enderecoR, "telefone": telefoneR]
        let _: Void = usurios.setValue(usuarioDados)
        
        
        let alerta = Alerta(titulo: "Sucesso", mensagem: " Pessoa cadastrada com sucesso, código \(cpfR.prefix(4))")
        self.present(alerta.getAlerta(), animated: true, completion: nil)
        
       limparCampos()
        
}
    
    @IBAction func sair(_ sender: Any) {
        
        
        let autenticacao = Auth.auth()
        
        do{
             try autenticacao.signOut()
            dismiss(animated: true, completion: nil)
         } catch{
             print("Erro ao deslogar")
         }
    }
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

}

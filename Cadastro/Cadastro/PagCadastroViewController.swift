//
//  PagCadastroViewController.swift
//  Cadastro
//
//  Created by Edilson Schwanck Borges on 29/03/22.
//

import UIKit
import FirebaseAuth


class PagCadastroViewController: UIViewController {
    
    @IBOutlet weak var codigo: UITextField!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var endereco: UITextField!
    @IBOutlet weak var telefone: UITextField!
    
    
    @IBAction func salvar(_ sender: Any) {
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

        // Do any additional setup after loading the view.
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

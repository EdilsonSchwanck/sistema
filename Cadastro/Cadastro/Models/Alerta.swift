//
//  Alerta.swift
//  Cadastro
//
//  Created by Edilson Schwanck Borges on 29/03/22.
//

import UIKit

class Alerta {
     
    var titulo: String = ""
    var mensagem: String = ""
    
    init(titulo: String, mensagem: String){
        self.titulo = titulo
        self.mensagem = mensagem
    }
    
    func getAlerta() -> UIAlertController{
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        return alerta
    }
    
}

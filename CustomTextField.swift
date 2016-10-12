//
//  CustomTextField.swift
//  BountyHunter
//
//  Created by Posgrado en Letras 02 on 01/10/16.
//  Copyright © 2016 Luis Alfredo Silva. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    
    override func drawRect(rect: CGRect) {
        self.font = UIFont(name: "Champagne&Limousines", size: Constantes.FUENTE_CAMPOS)
        self.layer.backgroundColor = Constantes.COLOR_FONDO_CAMPOS.CGColor
        self.backgroundColor =  Constantes.COLOR_FONDO_CAMPOS
        self.layer.cornerRadius = rect.size.height / 4
        self.textColor = Constantes.COLOR_TEXTO_CAMPOS
        // Invoca el método de la super clase al final, para que cuando dibuje la etiqueta ya tenga todas las configuraciones
        super.drawRect(rect)
   
   }
}
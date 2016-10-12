//
//  CustomLabel.swift
//  BountyHunter
//
//  Created by Posgrado en Letras 02 on 01/10/16.
//  Copyright © 2016 Luis Alfredo Silva. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    var size:CGFloat?

    override func drawRect(rect: CGRect) {
        self.font = UIFont(name: "Champagne&Limousines-Bold", size: Constantes.FUENTE_CAMPOS)
        self.layer.backgroundColor = Constantes.COLOR_ETIQUETAS.CGColor
        self.layer.cornerRadius = rect.size.height / 3
        self.textColor = Constantes.COLOR_TEXTOS
        // Invoca el método de la super clase al final, para que cuando dibuje la etiqueta ya tenga todas las configuraciones
        super.drawRect(rect)
    }
    

}

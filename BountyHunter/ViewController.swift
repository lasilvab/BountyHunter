//
//  ViewController.swift
//  BountyHunter
//
//  Created by Posgrado en Letras 02 on 01/10/16.
//  Copyright © 2016 Luis Alfredo Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        //Este código es útil cuando no estamos seguros
        //de cual es el nombre de las fuentes
        
        for fontFamilyName in UIFont.familyNames(){
            print (fontFamilyName)
            
        }
        */
        
        let losFugados = DBManager.instance.encuentraTodosLos("Fugitive", "Captured")
        // Tenemos un arreglo de objetos de tipo NSManagedObject
        // que responden al método "valueForKey" para cada uno de
        // los campos /atributos) definidos en la entidad
        print(losFugados[1].valueForKey("name")!)
        print(losFugados[1].valueForKey("desc")!)
        print(losFugados[1].valueForKey("bounty")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  DBManager.swift
//  BountyHunter
//
//  Created by Posgrado en Letras 02 on 01/10/16.
//  Copyright © 2016 Luis Alfredo Silva. All rights reserved.
//

import Foundation
import CoreData

class DBManager {
    
    
    
    // Declaración del Singleton
    static let instance = DBManager()
    
    func encuentraTodosLos(nombreEntidad:String, filtradosPor:NSPredicate ) -> NSArray {
        let elQuery:NSFetchRequest = NSFetchRequest()
        let laEntidad:NSEntityDescription = NSEntityDescription.entityForName(nombreEntidad, inManagedObjectContext:self.managedObjectContext!)!
        elQuery.entity = laEntidad
        elQuery.predicate = filtradosPor
        do{
            let result = try self.managedObjectContext!.executeFetchRequest(elQuery)
            return result as NSArray
        }
        catch{
            print("Error al ejecutar requuest")
            return NSArray()
        }
    }
    
    
    // Si hasy dos o más argumentos, del segundo en adelante, el identificador del parámatro se debe usar como rtiqueta al invocar el método
    
    // Si no quiero que aparezcan los identificadores como etiquetas, se agregan los caracteres "_ " antes de cada identificador
    func encuentraTodosLos(nombreEntidad: String, _ ordenadosPor: String) -> NSArray {
        let elQuery:NSFetchRequest = NSFetchRequest()
        let laEntidad:NSEntityDescription = NSEntityDescription.entityForName(nombreEntidad, inManagedObjectContext:self.managedObjectContext!)!
        elQuery.entity = laEntidad
        do{
            let result = try self.managedObjectContext!.executeFetchRequest(elQuery)
            return result as NSArray
        }
        catch{
            print("Error al ejecutar requuest")
            return NSArray()
        }
        
    }
    lazy var managedObjectContext:NSManagedObjectContext? = {
        let persistence = self.persistentStore
        if persistence == nil { // Houston, tenemos un problema
            return nil
        }
        var moc = NSManagedObjectContext(concurrencyType:. PrivateQueueConcurrencyType)
        moc.persistentStoreCoordinator = persistence
        return moc
    
    }()
    lazy var managedObjectModel:NSManagedObjectModel? = {
        let modelURL = NSBundle.mainBundle().URLForResource("BountyHunter", withExtension: "momd")
        var model = NSManagedObjectModel(contentsOfURL: modelURL!)
        
        return model
        
    }()
    lazy var persistentStore: NSPersistentStoreCoordinator? = {
        let model = self.managedObjectModel
        if model == nil {
            return nil
        }
        let persist = NSPersistentStoreCoordinator(managedObjectModel: model!)
        // Encontrat la ubicación de la base de datos...
        let urlDeLaDB = self.directorioDocuments.URLByAppendingPathComponent("BountyHunter.sqlite")
        do {
            let opcionesDePersistencia = [NSMigratePersistentStoresAutomaticallyOption:true, NSInferMappingModelAutomaticallyOption: true]
            try persist.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:urlDeLaDB, options: opcionesDePersistencia)
        }
        catch {
            print ("No se puede abrir la base de datos")
            abort() // terminar la ejecución del app
            
        }
        return persist
        
    }()
    lazy var directorioDocuments:NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        //retur urls[0] //Devuelve el primero
        return urls[urls.count-1] // devuelve el último
    }()
    
}

//
//  MetasManager.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/21/20.
//

import UIKit
import CoreData

class MetasManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext?
    
    init() {
        let persistentContainer = appDelegate.persistentContainer
        context = persistentContainer.viewContext
    }
    
    func store(_ model: Meta) -> Metas? {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Metas", into: context!) as! Metas
        
        entity.setValue(model.currentPage, forKey: "currentPage")
        entity.setValue(model.lastPage, forKey: "lastPage")
        
        
        do {
            try context?.save()
            return entity
        } catch let error {
            print("Could not store \(error.localizedDescription)")
            return nil
        }
    }
    
    func retrieve() -> Meta? {
        let fetchRequest = NSFetchRequest<Metas>(entityName: "Metas")
        do {
            let results = try context?.fetch(fetchRequest)
            guard let data = results, !data.isEmpty else {
                return Meta()
            }
            return mapData(data)
        } catch let error {
            print("Could not retrieve \(error.localizedDescription)")
            return nil
        }
    }
    
    func mapData(_ entities: [Metas]) -> Meta {
        
        var model: Meta = Meta()
        for entity in entities {
            model.currentPage = Int(entity.currentPage)
            model.lastPage = Int(entity.lastPage)

        }
        return model
    }
    
    func deleteAllMetas() {
        if let result = try? context?.fetch(Metas.fetchRequest()) {
            for object in result as! [Metas] {
                context?.delete(object)
            }
        }
    }
}

//
//  CategoriesManager.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/17/20.
//

import UIKit
import CoreData

class CategoriesManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext?
    
    init() {
        let persistentContainer = appDelegate.persistentContainer
        context = persistentContainer.viewContext
    }
    
    func store(_ model: Category) -> Categories? {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: context!) as! Categories
        
        entity.setValue(model.id, forKey: "id")
        entity.setValue(model.titleAr, forKey: "titleAr")
        entity.setValue(model.titleEn, forKey: "titleEn")
        entity.setValue(model.current, forKey: "current")
        entity.setValue(model.last, forKey: "last")

        do {
            try context?.save()
            return entity
        } catch let error {
            print("Could not store \(error.localizedDescription)")
            return nil
        }
    }
    
    func retrieve(_ page: Int) -> [Category]? {
        let fetchRequest = NSFetchRequest<Categories>(entityName: "Categories")
        do {
            let results = try context?.fetch(fetchRequest)
            guard let data = results, !data.isEmpty else {
                return []
            }
            return mapData(page, data)
        } catch let error {
            print("Could not retrieve \(error.localizedDescription)")
            return nil
        }
    }
    
    func mapData(_ page: Int, _ entities: [Categories]) -> [Category] {
        var models: [Category] = []
        
        for entity in entities {
            let model: Category = Category()
            if entity.current == page {
                model.id = entity.id ?? ""
                model.titleAr = entity.titleAr ?? ""
                model.titleEn = entity.titleEn ?? ""
                models.append(model)
            }
        }
        return models
    }
    
    func deleteAllCarts() {
        if let result = try? context?.fetch(Categories.fetchRequest()) {
            for object in result as! [Categories] {
                context?.delete(object)
            }
        }
    }

}

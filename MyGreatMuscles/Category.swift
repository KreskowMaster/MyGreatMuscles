//
//  Category.swift
//  MyGreatMuscles
//
//  Created by Krystian Gontarek on 29.03.2016.
//  Copyright © 2016 KreskowDevCrew. All rights reserved.
//

import UIKit
import CoreData


class Category: NSManagedObject {
    
    static func createCategories() {
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        // Biceps Category
        let bicepsCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: context) as! Category
        bicepsCategory.title = "Biceps"
        bicepsCategory.tag = 0
        
        // Legs Category
        let legsCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: context) as! Category
        legsCategory.title = "Legs"
        legsCategory.tag = 1
        
        // Triceps Category
        let tricepsCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: context) as! Category
        tricepsCategory.title = "Triceps"
        tricepsCategory.tag = 2
        
        // Chest Category
        let chestCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: context) as! Category
        chestCategory.title = "Chest"
        chestCategory.tag = 3
        
        // Abdominals Category
        let abdominalsCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: context) as! Category
        abdominalsCategory.title = "Abdominals"
        abdominalsCategory.tag = 4
        
        // Back Category
        let backCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: context) as! Category
        backCategory.title = "Back"
        backCategory.tag = 5
        
        // Neck Category
        let neckCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: context) as! Category
        neckCategory.title = "Neck"
        neckCategory.tag = 6
        
        // Shoulders Category
        let shouldersCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: context) as! Category
        shouldersCategory.title = "Shoulders"
        shouldersCategory.tag = 7
            
        try! context.save()
        
    }
    
    static func hasCategories() -> Bool {
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Category")
        let results = try! context.executeFetchRequest(request)
        
        if results.count > 0 {
            return true
        } else {
            return false
        }

    }
    
    static func getCategory(tag : NSNumber) -> Category {
    
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let request = NSFetchRequest(entityName: "Category")
        let predicate = NSPredicate(format: "tag == \(tag)")
        request.predicate = predicate
        
        let requestedCategory = try! context.executeFetchRequest(request)
    
        return requestedCategory.first as! Category
    }
    
}

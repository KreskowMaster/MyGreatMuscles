//
//  Muscle.swift
//  MyGreatMuscles
//
//  Created by Krystian Gontarek on 29.03.2016.
//  Copyright © 2016 KreskowDevCrew. All rights reserved.
//

import UIKit
import CoreData


class Muscle: NSManagedObject {
    
    static func addMuscle(date : NSDate, photo : UIImage, category : Category) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let newMuscle = NSEntityDescription.insertNewObjectForEntityForName("Muscle", inManagedObjectContext: context) as! Muscle
        newMuscle.date = date
        newMuscle.photo = UIImageJPEGRepresentation(photo, 1.0)
        newMuscle.category = category
        try! context.save()
    }
    
}

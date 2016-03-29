//
//  Muscle+CoreDataProperties.swift
//  MyGreatMuscles
//
//  Created by Krystian Gontarek on 29.03.2016.
//  Copyright © 2016 KreskowDevCrew. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Muscle {

    @NSManaged var date: NSDate?
    @NSManaged var photo: NSData?
    @NSManaged var category: Category?

}

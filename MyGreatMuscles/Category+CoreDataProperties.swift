//
//  Category+CoreDataProperties.swift
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

extension Category {

    @NSManaged var title: String?
    @NSManaged var tag: NSNumber?
    @NSManaged var muscles: NSSet?

}

//
//  ViewController.swift
//  MyGreatMuscles
//
//  Created by Krystian Gontarek on 26.03.2016.
//  Copyright © 2016 KreskowDevCrew. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var musclesCategories : [UIImageView] = []
    var selectedCategory : Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !Category.hasCategories() {
            
            showAlertWithTitle("Happy Birthday", message: "Happy birthday dad, less mass, more muscles!") {
                delay(300000) {
                    self.showAlertWithTitle("Thank You", message: "Biggest thanks to Karrmarr for help with creating app!")
                }
            }
          
            print("Create categories")
            Category.createCategories()
            
        } else {
            
            print("Categories are created\n")
            
        }
        
    }
    
    @IBAction func categoryTapped(sender: UIButton) {
        
        let selectedTag = sender.tag
        selectedCategory = Category.getCategory(selectedTag)
        
        // MARK: - TEST | Printing Values
        print("CategoriesVC | Tag: \(selectedCategory!.tag!) Name: \(selectedCategory!.title!)")
        
        self.performSegueWithIdentifier("goToTimelineSegue", sender: self)
      
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToTimelineSegue" {
            let timelineVC = segue.destinationViewController as! TimelineViewController
            timelineVC.selectedCategory = self.selectedCategory
        }
    }
    
    
    
}


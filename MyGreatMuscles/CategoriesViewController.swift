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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - FUNCTION - categoryTapped
    func categoryTapped() {
        self.performSegueWithIdentifier("goToTimelineSegue", sender: self)
    }
    
    @IBAction func categoryTapped(sender: AnyObject) {
        
        self.performSegueWithIdentifier("goToTimelineSegue", sender: self)
    }
    
    
    
    
}


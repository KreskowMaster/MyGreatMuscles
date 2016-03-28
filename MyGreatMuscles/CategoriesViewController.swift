//
//  ViewController.swift
//  MyGreatMuscles
//
//  Created by Krystian Gontarek on 26.03.2016.
//  Copyright © 2016 KreskowDevCrew. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK: - Categories Outlets
    
    @IBOutlet weak var bicepsCategory: UIImageView!
    @IBOutlet weak var legsCategory: UIImageView!
    @IBOutlet weak var tricepsCategory: UIImageView!
    @IBOutlet weak var chestCategory: UIImageView!
    @IBOutlet weak var prellumCategory: UIImageView!
    @IBOutlet weak var backCategory: UIImageView!
    @IBOutlet weak var neckCategory: UIImageView!
    @IBOutlet weak var shouldersCategory: UIImageView!
    
    var musclesCategories : [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assigning all categories to array
        musclesCategories = [bicepsCategory, legsCategory, tricepsCategory, chestCategory, prellumCategory, backCategory, neckCategory, shouldersCategory]
        
        // MARK: - Recognizing Tap of Categories
        
        for muscleCategory in musclesCategories {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("categoryTapped"))
            muscleCategory.userInteractionEnabled = true
            muscleCategory.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    // MARK: - FUNCTION - categoryTapped
    func categoryTapped() {
        self.performSegueWithIdentifier("goToTimelineSegue", sender: self)
    }
    
    
    
}


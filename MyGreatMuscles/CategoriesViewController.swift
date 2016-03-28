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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegueWithIdentifier("test", sender: self)
    }
    


}


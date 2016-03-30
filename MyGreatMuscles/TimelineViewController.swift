//
//  TimelineViewController.swift
//  MyGreatMuscles
//
//  Created by Krystian Gontarek on 28.03.2016.
//  Copyright © 2016 KreskowDevCrew. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    // MARK: - UIComponents Outlets
    @IBOutlet weak var muscleImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var selectedCategory : Category?
    var timelineMuscles : [Muscle]?
    var currentMuscle : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        
        Muscle.addMuscle(NSDate(), photo: UIImage(), category: selectedCategory!)
        Muscle.addMuscle(NSDate(), photo: UIImage(), category: selectedCategory!)
        Muscle.addMuscle(NSDate(), photo: UIImage(), category: selectedCategory!)
        Muscle.addMuscle(NSDate(), photo: UIImage(), category: selectedCategory!)

        
        
        // MARK: - Get All Muscles For Timeline
        timelineMuscles = selectedCategory?.muscles?.allObjects as? [Muscle]
        
        // MARK: - Switching UIComponents Values to selectedCategory Values
        categoryLabel.text = selectedCategory?.title
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // MARK: - TEST | Printing Values
        print("TimelineVC | Tag: \(selectedCategory!.tag!) Name: \(selectedCategory!.title!)\n")
    }

    // MARK: - Timeline Navigation
    
    @IBAction func backTapped(sender: AnyObject) {
        if currentMuscle > 0 {
            currentMuscle -= 1
            categoryLabel.text = "\(currentMuscle)"
        }
    }
    
    @IBAction func nextTapped(sender: AnyObject) {
        if currentMuscle < timelineMuscles!.count - 1 {
            currentMuscle += 1
            categoryLabel.text = "\(currentMuscle)"
        }
    }
    
    // MARK: - Timeline Parts Adding
    
    @IBAction func addTapped(sender: AnyObject) {
        
    }
}

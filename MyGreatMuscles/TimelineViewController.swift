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
        
//        Muscle.addMuscle(NSDate(), photo: UIImage(named: "Muscles100%")!, category: selectedCategory!)
//        Muscle.addMuscle(NSDate(), photo: UIImage(named: "ultimate-pump-workout_d")!, category: selectedCategory!)
        
        // MARK: - Get All Muscles For Timeline
        timelineMuscles = selectedCategory?.sortedMusclesByDate
        
        // MARK: - Switch Start Up Values
        changeValues()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // MARK: - TEST | Printing Values
        print("TimelineVC | Tag: \(selectedCategory!.tag!) Name: \(selectedCategory!.title!)\n")
        
        selectedCategory = Category.getCategory(selectedCategory!.tag!)
        if selectedCategory?.muscles?.count > 0 {
            
        } else {
            self.performSegueWithIdentifier("goToAddScreenSegue", sender: self)
        }
    }

    // MARK: - Timeline Navigation
    
    @IBAction func backTapped(sender: AnyObject) {
        if currentMuscle > 0 {
            currentMuscle -= 1
            changeValues()
            print("Muscle: \(currentMuscle) Date: \(timelineMuscles![currentMuscle].date!)\n")

        }
    }
    
    @IBAction func nextTapped(sender: AnyObject) {
        if currentMuscle < timelineMuscles!.count - 1 {
            currentMuscle += 1
            changeValues()
            print("Muscle: \(currentMuscle) Date: \(timelineMuscles![currentMuscle].date!)\n")
        }
    }
    
    // MARK: - Timeline Parts Adding
    
    @IBAction func addTapped(sender: AnyObject) {
        
    }
    
    // MARK: - Switching UIComponents Values to selectedCategory Values
    
    func changeValues() {
        categoryLabel.text = selectedCategory?.title
        muscleImageView.image = UIImage(data: timelineMuscles![currentMuscle].photo!)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .NoStyle
        dateLabel.text = dateFormatter.stringFromDate(timelineMuscles![currentMuscle].date!)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToAddScreenSegue" {
            let addVC = segue.destinationViewController as! AddMuscleViewController
            addVC.selectedCategory = self.selectedCategory
        }
    }
}

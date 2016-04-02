//
//  EmptyTimelineViewController.swift
//  MyGreatMuscles
//
//  Created by Krystian Gontarek on 28.03.2016.
//  Copyright © 2016 KreskowDevCrew. All rights reserved.
//

import UIKit

class EmptyTimelineViewController: UIViewController {
    
    // MARK: - Properties
    
    var selectedCategory : Category?
    
    // MARK: - UIComponents Outlets

    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        selectedCategory = Category.getCategory(selectedCategory!.tag!)

        if selectedCategory?.muscles?.count > 0 {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    // MARK: - Switching to AddMuscleViewController
    @IBAction func goTapped(sender: AnyObject) {
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let addVC = segue.destinationViewController as! AddMuscleViewController
        addVC.selectedCategory = self.selectedCategory
    }
    

}

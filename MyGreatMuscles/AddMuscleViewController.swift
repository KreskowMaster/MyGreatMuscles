//
//  AddMuscleViewController.swift
//  MyGreatMuscles
//
//  Created by Krystian Gontarek on 28.03.2016.
//  Copyright © 2016 KreskowDevCrew. All rights reserved.
//

import UIKit

class AddMuscleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - UIImagePickerController
    
    let imagePicker = UIImagePickerController()
    
    // MARK: - UIComponents Outlets
    
    @IBOutlet weak var dateLabel: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    // MARK: - Adding Photo
    
    @IBAction func addPhotoTapped(sender: AnyObject) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    // MARK: - Choosing Date
    
    @IBAction func dateTapped(sender: AnyObject) {
        
    }
    
    // MARK: - Finishing & Saving
    
    @IBAction func doneTapped(sender: AnyObject) {
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

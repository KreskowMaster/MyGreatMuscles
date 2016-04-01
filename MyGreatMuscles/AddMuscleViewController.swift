//
//  AddMuscleViewController.swift
//  MyGreatMuscles
//
//  Created by Krystian Gontarek on 28.03.2016.
//  Copyright © 2016 KreskowDevCrew. All rights reserved.
//

import UIKit

class AddMuscleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Properties
    
    let imagePicker = UIImagePickerController()
    var selectedImage : UIImage?
    var selectedCategory : Category?
    
    // MARK: - UIComponents Outlets
    
    @IBOutlet weak var dateLabel: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    // MARK: - Adding Photo
    
    @IBAction func addPhotoTapped(sender: AnyObject) {
        
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = .Camera
//        
//        presentViewController(imagePicker, animated: true, completion: nil)
        
        selectPhotoSource()
        
    }
    
    // MARK: - Choosing Date
    
    @IBAction func dateTapped(sender: AnyObject) {
        
    }
    
    // MARK: - Finishing & Saving
    
    @IBAction func doneTapped(sender: AnyObject) {
        
        Muscle.addMuscle(NSDate(), photo: selectedImage!, category: selectedCategory!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func selectPhotoSource() {
        let actionSheetController : UIAlertController = UIAlertController(title: "Choose Source Type", message: "Select type of photo taking", preferredStyle: .ActionSheet)
        
        let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            action in
            
        }
        actionSheetController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let cameraAction : UIAlertAction = UIAlertAction(title: "Camera", style: .Default) {
                action in
                
            }
            actionSheetController.addAction(cameraAction)
        }
        
        let cameraRollAction : UIAlertAction = UIAlertAction(title: "Camera Roll", style: .Default) {
            action in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true
                , completion: nil)
        }
        actionSheetController.addAction(cameraRollAction)
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImage = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

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
        
        selectPhotoSource()
        
    }
    
    // MARK: - Choosing Date
    
    @IBAction func dateTapped(sender: AnyObject) {
        
    }
    
    // MARK: - Finishing & Saving
    
    @IBAction func doneTapped(sender: AnyObject) {
        
        if selectedImage != nil {
            print(datePicker.date)
            Muscle.addMuscle(datePicker.date, photo: selectedImage!, category: selectedCategory!)
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            showAlertWithTitle("Image Empty", message: "Please insert muscle image")
        }
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func selectPhotoSource() {
        let actionSheetController : UIAlertController = UIAlertController(title: "Choose Source Type", message: "Select type of photo taking", preferredStyle: .ActionSheet)
        
        let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            action in
        }
        actionSheetController.addAction(cancelAction)
        
//        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let cameraAction : UIAlertAction = UIAlertAction(title: "Camera", style: .Default) {
                action in
                self.imagePicker.allowsEditing = true
                self.imagePicker.sourceType = .Camera
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
            }
            actionSheetController.addAction(cameraAction)
//        }
        
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

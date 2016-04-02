
// Created By Thorsten Karrmarr Klusemann


import UIKit

extension UIViewController {
    
    func showAlertWithTitle(title: String, message: String, atDismiss: (() -> ())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in
            atDismiss?()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}

func delay(time: Int64, block: () -> ()) {
  let dispTime = dispatch_time(DISPATCH_TIME_NOW, time)
  dispatch_after(dispTime, dispatch_get_main_queue(), block)
}

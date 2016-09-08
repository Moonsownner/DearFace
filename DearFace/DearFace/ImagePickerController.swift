//
//  ImagePickerController.swift
//  DearFace
//
//  Created by J HD on 8/31/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import UIKit
import Photos

class ImagePickerController: UIImagePickerController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
    }
    
}

extension ImagePickerController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        ConfigVC.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        mainAct {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
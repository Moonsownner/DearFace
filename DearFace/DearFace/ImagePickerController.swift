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
    
    func makeUI(){
        
    }
    
}

extension ImagePickerController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print(info[UIImagePickerControllerOriginalImage])
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
    }
    
}

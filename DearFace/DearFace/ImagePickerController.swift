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
    
    var imageSelectClosure: ((UIImage) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
}

extension ImagePickerController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
	
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else{ return }
        imageSelectClosure?(image)
        GCD.mainAct {
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

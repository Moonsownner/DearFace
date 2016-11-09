//
//  Photo.swift
//  DearFace
//
//  Created by J HD on 16/9/22.
//  Copyright © 2016年 Joker. All rights reserved.
//

import Photos

class Photo {
    
    private init(){}
    
    static var assets = [PHAsset]()
    
    static func fetchImage(){
        let albums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        guard let album = albums.firstObject else{ return }
        
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "mediaType = %@", NSNumber(value: PHAssetMediaType.image.rawValue as Int))
        
        let result = PHAsset.fetchAssets(in: album, options: options)
        let count = result.count
        for i in 0..<count{
            self.assets.append(result[i])
        }
    }
	
	static func saveImage(image: UIImage, completionTarget target: Any? = nil, completionSelector selector: Selector? = nil){
		UIImageWriteToSavedPhotosAlbum(image, target, selector, nil)
	}
    
}

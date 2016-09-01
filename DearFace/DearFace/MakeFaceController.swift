//
//  MakeFaceController.swift
//  DearFace
//
//  Created by Lucky on 16/2/22.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit
import Photos

class MakeFaceController: UIViewController {
    
    private let cellId = "cell"
    
    let model: MakeFaceModel
    var backImg: UIImage?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = CGFloat.min
        let width = (screenWidth/4).rounded
        layout.itemSize = CGSize(width: width, height: width)
        layout.itemSize = CGSize.zero
        let collection = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        return collection
    }()
    
    init(model: MakeFaceModel, image: UIImage?){
        self.model = model
        self.backImg = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func makeUI(){
        view.backgroundColor = UIColor.whiteColor()
        
        collectionView.registerClass(MakeFaceCell.self, forCellWithReuseIdentifier: cellId)
        
        
        
        
    }
    
    func makeUI(image: UIImage){
        let size = image.size
        collectionView.contentSize = size
        
        
    }
    
}

extension MakeFaceController: UICollectionViewDataSource{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return model.rowNum.value
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.rowNum.value
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! MakeFaceCell
        return cell
    }
    
}

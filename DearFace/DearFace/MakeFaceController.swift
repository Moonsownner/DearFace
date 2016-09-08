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
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lo = UICollectionViewFlowLayout()
        lo.minimumLineSpacing = CGFloat.min
        lo.minimumInteritemSpacing = CGFloat.min
        lo.sectionInset = UIEdgeInsetsZero
        return lo
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRectZero, collectionViewLayout: self.layout)
        collection.registerClass(MakeFaceCell.self, forCellWithReuseIdentifier: self.cellId)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    init(model: MakeFaceModel, image: UIImage?){
        self.model = model
        self.backImg = image
        super.init(nibName: nil, bundle: nil)
        let width = (ScreenWidth/CGFloat(self.model.rowNum.value)).rounded
        self.layout.itemSize = CGSize(width: width, height: width)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func makeUI(){
        view.backgroundColor = UIColor.whiteColor()
        
        if let img = backImg{
            makeUI(img)
        }
        else{
            
        }
        
    }
    
    func makeUI(image: UIImage){
        let size = image.size
        collectionView.contentSize = size
        collectionView.backgroundView = UIImageView(image: image)
        view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

extension MakeFaceController: UICollectionViewDataSource{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return model.sectionNum.value
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.rowNum.value
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! MakeFaceCell
        return cell
    }
    
}

extension MakeFaceController: UICollectionViewDelegate{
    
}

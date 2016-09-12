//
//  MakeFaceController.swift
//  DearFace
//
//  Created by Lucky on 16/2/22.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit
import Photos

//TODO: 界面消失的时候，去除observer事件

class MakeFaceController: UIViewController {
    
    private let cellId = "cell"
    
    let model: MakeFaceModel
    
    lazy var layout = MakeFaceLayout()
    
    lazy var collectionViewBackView: UIImageView = {
        let imageV = UIImageView(image: self.model.image.value)
        imageV.alpha = 0.5
        return imageV
    }()
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRectZero, collectionViewLayout: self.layout)
        collection.registerClass(MakeFaceCell.self, forCellWithReuseIdentifier: self.cellId)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    lazy var imageSelectController = ImageSelectController()
    
    init(model: MakeFaceModel){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.model.image.observers[ObserverKey.SetBackImage] = { [unowned self] image in
            guard let img = image else{ return }
            self.collectionViewBackView.image = img
            self.collectionViewBackView.frame = CGRect(origin: CGPointZero, size: img.size)
            self.collectionView.contentSize = img.size
        }
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.sendSubviewToBack(collectionViewBackView)
    }
    
    func makeUI(){
        
        collectionView.backgroundColor = UIColor.lightGrayColor()
        
        if let img = self.model.image.value{
            makeUI(img)
        }
        else{
            
        }
        
        addChildViewController(imageSelectController)
        imageSelectController.view.frame = CGRectMake(0, ScreenHeight - ImageSelectItem.rowHeight, ScreenWidth, ImageSelectItem.rowHeight)
        view.addSubview(imageSelectController.view)
        imageSelectController.didMoveToParentViewController(self)
        
    }
    
    func makeUI(image: UIImage){
        
        collectionView.addSubview(collectionViewBackView)
        view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.top.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(view).inset(ImageSelectItem.rowHeight)
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

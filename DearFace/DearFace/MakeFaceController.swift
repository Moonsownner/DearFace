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

    internal let cellId = "cell"
    
    let model: MakeFaceModel
    
    lazy var layout = MakeFaceLayout()
    
    lazy var collectionViewBackView: UIImageView = {
        let imageV = UIImageView(image: self.model.image.value)
        imageV.alpha = 0.5
        return imageV
    }()
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.layout)
        collection.register(MakeFaceCell.self, forCellWithReuseIdentifier: self.cellId)
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
            self.collectionViewBackView.frame = CGRect(origin: CGPoint.zero, size: img.size)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.sendSubview(toBack: collectionViewBackView)
    }
    
    func makeUI(){
        
        collectionView.backgroundColor = UIColor.lightGray
        
        if let img = self.model.image.value{
            makeUI(img)
        }
        else{
            
        }
        
        addChildViewController(imageSelectController)
        imageSelectController.view.frame = CGRect(x: 0, y: ScreenHeight - ImageSelectItem.rowHeight, width: ScreenWidth, height: ImageSelectItem.rowHeight)
        view.addSubview(imageSelectController.view)
        imageSelectController.didMove(toParentViewController: self)
        
    }
    
    func makeUI(_ image: UIImage){
        
        collectionView.addSubview(collectionViewBackView)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(view).inset(ImageSelectItem.rowHeight)
        }
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
}

extension MakeFaceController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return model.sectionNum.value
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.rowNum.value
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MakeFaceCell
        return cell
    }
    
}

extension MakeFaceController: UICollectionViewDelegate{
    
}

//
//  ImageSelectController.swift
//  DearFace
//
//  Created by J HD on 16/9/9.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit
import Photos

class ImageSelectController: UICollectionViewController {
    
    fileprivate let cellId = "cell"
    
    lazy var longPress: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(ImageSelectController.longPress(gesture:)))
        return gesture
    }()
    
    weak var makeFaceDelegate: MakeFaceController?
    
    var images: [PHAsset]
    
    init(){
        self.images = Photo.assets
        let layout = ImageSelectLayout(assets: Photo.assets)
        super.init(collectionViewLayout: layout)
        layout.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.clipsToBounds = false
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ImageSelectCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.addGestureRecognizer(longPress)
    }
    
    ///保存动画indexPath
    var moveItemIndexPath: IndexPath?
    
    func longPress(gesture: UILongPressGestureRecognizer){
        switch gesture.state {
        case .began:
            guard let index = collectionView?.indexPathForItem(at: gesture.location(in: collectionView)) else{ return }
            collectionView?.beginInteractiveMovementForItem(at: index)
            moveItemIndexPath = index
        case .changed:
            collectionView?.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view))
        case .ended:
            collectionView?.endInteractiveMovement()
            guard let vc = makeFaceDelegate else{ return }
            setImage(indexPath: vc.collectionView.indexPathForItem(at: gesture.location(in: vc.collectionView)))
            moveItemIndexPath = nil
        default:
            collectionView?.cancelInteractiveMovement()
            moveItemIndexPath = nil
        }
    }
    
    func setImage(indexPath: IndexPath?){
        guard let makeFaceIndex = indexPath, let selfIndexPath = moveItemIndexPath else{ return }
        makeFaceDelegate?.images[makeFaceIndex] = images[selfIndexPath.item]
        makeFaceDelegate?.collectionView.reloadData()
    }
    
}

extension ImageSelectController{
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Photo.assets.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageSelectCell
        cell.setBackImage(images[indexPath.item])
        return cell
    }
    
}

extension ImageSelectController{
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        swap(&images[sourceIndexPath.item], &images[destinationIndexPath.item])
        self.collectionView?.reloadData()
    }
    
}

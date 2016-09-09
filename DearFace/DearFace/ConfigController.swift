//
//  ConfigController.swift
//  DearFace
//
//  Created by J HD on 9/1/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import UIKit
import SnapKit

class ConfigController: UIViewController {
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI(){
        view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton()
        button.setTitle("图片", forState: .Normal)
        button.setBackgroundImage(UIImage.fromColor(UIColor.cyanColor()), forState: .Normal)
        button.addTarget(self, action: #selector(ConfigController.chooseImg), forControlEvents: .TouchUpInside)
        view.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        let button2 = UIButton()
        button2.setTitle("测试", forState: .Normal)
        button2.setBackgroundImage(UIImage.fromColor(UIColor.brownColor()), forState: .Normal)
        button2.addTarget(self, action: #selector(ConfigController.goNext), forControlEvents: .TouchUpInside)
        view.addSubview(button2)
        button2.snp_makeConstraints { (make) in
            make.top.equalTo(button.snp_bottom)
            make.centerX.equalTo(button)
            make.width.equalTo(button)
            make.height.equalTo(button)
        }
    }
    
    ///选择图片按钮点击事件
    func chooseImg(){
        mainAct { 
            self.presentViewController(ImagePickerController(), animated: true, completion: nil)
        }
    }
    
    ///进入makeface
    func goNext(){
        let model = MakeFaceModel(sectionNum: Observable<Int>(value: 5), rowNum: Observable<Int>(value: 5))
        let vc = MakeFaceController(model: model, image: image)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

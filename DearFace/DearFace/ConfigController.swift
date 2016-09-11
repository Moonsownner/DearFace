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
    
    ///逻辑模型
    let model = MakeFaceModel()
    
    ///用于查看选取的图片(照片)
    lazy var imageViewer: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = UIColor.lightGrayColor()
        v.contentMode = .ScaleAspectFit
        v.layer.borderWidth = 8
        v.layer.borderColor = UIColor.brownColor().CGColor
        return v
    }()
    
    ///行数slider
    lazy var secSlider: UISlider = {
        let slider = UISlider()
        slider.tag = 0
        slider.addTarget(self, action: #selector(ConfigController.sliderChanges(_:)), forControlEvents: .ValueChanged)
        return slider
    }()
    ///行数计数label
    lazy var secLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.hint
        lbl.textColor = UIColor.grayText
        return lbl
    }()
    
    ///列数slider
    lazy var rowSlider: UISlider = {
        let slider = UISlider()
        slider.tag = 1
        slider.addTarget(self, action: #selector(ConfigController.sliderChanges(_:)), forControlEvents: .ValueChanged)
        return slider
    }()
    ///行数计数label
    lazy var rowLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.hint
        lbl.textColor = UIColor.grayText
        return lbl
    }()
    
    ///
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        makeLogic()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func makeUI(){
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(imageViewer)
        imageViewer.snp_makeConstraints { (make) in
            make.left.equalTo(view)
            make.top.equalTo(view)
            make.right.equalTo(view)
            make.height.equalTo(250)
        }
        
        view.addSubview(secSlider)
        secSlider.snp_makeConstraints { (make) in
            make.left.equalTo(view).inset(16)
            make.right.equalTo(view).inset(16)
            make.top.equalTo(imageViewer.snp_bottom).offset(20)
        }
        view.addSubview(secLabel)
        secLabel.snp_makeConstraints { (make) in
            make.right.equalTo(secSlider)
            make.top.equalTo(secSlider.snp_bottom)
            make.height.equalTo(20)
        }
        
        view.addSubview(rowSlider)
        rowSlider.snp_makeConstraints { (make) in
            make.left.equalTo(secSlider)
            make.right.equalTo(secSlider)
            make.top.equalTo(secLabel.snp_bottom).offset(10)
        }
        view.addSubview(rowLabel)
        rowLabel.snp_makeConstraints { (make) in
            make.right.equalTo(rowSlider)
            make.top.equalTo(rowSlider.snp_bottom)
            make.height.equalTo(20)
        }
        
        let button = UIButton()
        button.setTitle("图片", forState: .Normal)
        button.setBackgroundImage(UIImage.fromColor(UIColor.cyanColor()), forState: .Normal)
        button.addTarget(self, action: #selector(ConfigController.chooseImg), forControlEvents: .TouchUpInside)
        view.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.top.equalTo(rowLabel.snp_bottom).offset(40)
            make.centerX.equalTo(view)
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
    
    //TODO: 写好observer回调事件
    ///逻辑初始化
    func makeLogic(){
        let changeImage: UIImage?->Void = { [unowned self] image in
            self.imageViewer.image = image
        }
        model.image.observers.append(changeImage)
    }
    
    ///行数 列数改变
    func sliderChanges(slider: UISlider){
        let forString = (slider.tag == 0) ? "行数" : "列数"
        let lbl = (slider.tag == 0) ? secLabel : rowLabel
        if slider.value > 0.5{
            lbl.text = "\(forString): 8"
            slider.setValue(1, animated: true)
        }
        else{
            lbl.text = "\(forString): 4"
            slider.setValue(0, animated: true)
        }
    }
    
    ///选择图片按钮点击事件
    func chooseImg(){
        let picker = ImagePickerController()
        picker.imageSelectClosure = { [unowned self] image in
            self.model.image.value = image
        }
        mainAct {
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    ///进入makeface
    func goNext(){
//        let vc = MakeFaceController(model: model, image: image)
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

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
        v.backgroundColor = UIColor.lightGray
        v.contentMode = .scaleAspectFit
        v.layer.borderWidth = 8
        v.layer.borderColor = UIColor.brown.cgColor
        return v
    }()
    
    ///行数slider
    lazy var secSlider: UISlider = {
        let slider = UISlider()
        slider.tag = 0
        slider.addTarget(self, action: #selector(ConfigController.sliderChanges(_:)), for: .valueChanged)
        return slider
    }()
    ///行数计数label
    lazy var secLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.hint
        lbl.textColor = UIColor.grayText
        lbl.text = "行数: \(DefaultConfig.num)"
        return lbl
    }()
    
    ///列数slider
    lazy var rowSlider: UISlider = {
        let slider = UISlider()
        slider.tag = 1
        slider.addTarget(self, action: #selector(ConfigController.sliderChanges(_:)), for: .valueChanged)
        return slider
    }()
    ///行数计数label
    lazy var rowLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.hint
        lbl.textColor = UIColor.grayText
        lbl.text = "列数: \(DefaultConfig.num)"
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        makeLogic()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func makeUI(){
        view.backgroundColor = UIColor.white
        
        view.addSubview(imageViewer)
        imageViewer.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.top.equalTo(view)
            make.right.equalTo(view)
            make.height.equalTo(250)
        }
        
        view.addSubview(secSlider)
        secSlider.snp.makeConstraints { (make) in
            make.left.equalTo(view).inset(16)
            make.right.equalTo(view).inset(16)
            make.top.equalTo(imageViewer.snp.bottom).offset(20)
        }
        view.addSubview(secLabel)
        secLabel.snp.makeConstraints { (make) in
            make.right.equalTo(secSlider)
            make.top.equalTo(secSlider.snp.bottom)
            make.height.equalTo(20)
        }
        
        view.addSubview(rowSlider)
        rowSlider.snp.makeConstraints { (make) in
            make.left.equalTo(secSlider)
            make.right.equalTo(secSlider)
            make.top.equalTo(secLabel.snp.bottom).offset(10)
        }
        view.addSubview(rowLabel)
        rowLabel.snp.makeConstraints { (make) in
            make.right.equalTo(rowSlider)
            make.top.equalTo(rowSlider.snp.bottom)
            make.height.equalTo(20)
        }
        
        let button = UIButton()
        button.setTitle("图片", for: UIControlState())
        button.setBackgroundImage(UIImage.fromColor(UIColor.cyan), for: UIControlState())
        button.addTarget(self, action: #selector(ConfigController.chooseImg), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(rowLabel.snp.bottom).offset(40)
            make.centerX.equalTo(view)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        let button2 = UIButton()
        button2.setTitle("测试", for: UIControlState())
        button2.setBackgroundImage(UIImage.fromColor(UIColor.brown), for: UIControlState())
        button2.addTarget(self, action: #selector(ConfigController.goNext), for: .touchUpInside)
        view.addSubview(button2)
        button2.snp.makeConstraints { (make) in
            make.top.equalTo(button.snp.bottom)
            make.centerX.equalTo(button)
            make.width.equalTo(button)
            make.height.equalTo(button)
        }
    }
    
    //TODO: 写好observer回调事件
    ///逻辑初始化
    func makeLogic(){
        model.sectionNum.value = DefaultConfig.num
        model.rowNum.value = DefaultConfig.num
        
        let changeImage: (UIImage?)->Void = { [unowned self] image in
            self.imageViewer.image = image
        }
        model.image.observers[ObserverKey.ChangeConfigImage] = changeImage
    }
    
    ///行数 列数改变
    func sliderChanges(_ slider: UISlider){
        let value = round(slider.value*10)
        let forString = (slider.tag == 0) ? "行数" : "列数"
        let lbl = (slider.tag == 0) ? secLabel : rowLabel
        let result = Int(value)*4 + DefaultConfig.num
        lbl.text = "\(forString): \(result)"
        slider.setValue(value/10, animated: true)
        if slider.tag == 0{
            model.sectionNum.value = result
        }
        else{
            model.rowNum.value = result
        }
    }
    
    ///选择图片按钮点击事件
    func chooseImg(){
        let picker = ImagePickerController()
        picker.imageSelectClosure = { [unowned self] image in
            self.model.image.value = image
        }
        GCD.mainAct {
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    ///进入makeface
    func goNext(){
        navigationController?.pushViewController(MakeFaceController(model: model), animated: true)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}

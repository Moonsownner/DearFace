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
	
	/// main view
	lazy var configView = ConfigView()
	
	override func loadView() {
		view = configView
	}
    
    override func viewDidLoad() {
        super.viewDidLoad()
		makeUI()
        makeLogic()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
	
	func makeUI() {
		configView.imageViewer.addTarget(self, action: #selector(chooseImg), for: .touchUpInside)
		configView.secSlider.addTarget(self, action: #selector(sliderChanges(_:)), for: .valueChanged)
		configView.rowSlider.addTarget(self, action: #selector(sliderChanges(_:)), for: .valueChanged)
		configView.goButton.addTarget(self, action: #selector(goNext), for: .touchUpInside)
	}
    
    //TODO: 写好observer回调事件
    ///逻辑初始化
    func makeLogic(){
        model.sectionNum.value = DefaultConfig.num
        model.rowNum.value = DefaultConfig.num
        
        let changeImage: (UIImage?)->Void = { [unowned self] image in
			self.configView.imageViewer.setImage(image, for: .normal)
        }
        model.image.observers[ObserverKey.ChangeConfigImage] = changeImage
    }
    
    ///行数 列数改变
    func sliderChanges(_ slider: UISlider){
        let value = round(slider.value*10)
        let forString = (slider.tag == 0) ? "行数" : "列数"
        let lbl = (slider.tag == 0) ? configView.secLabel : configView.rowLabel
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
			if self.configView.imageViewer.title(for: .normal) != ""{
				self.configView.imageViewer.setTitle("", for: .normal)
			}
			if self.configView.sizeHintView.isHidden{
				self.configView.sizeHintView.isHidden = false
			}
			if !self.configView.goButton.isEnabled{
				self.configView.goButton.isEnabled = true
			}
			self.configView.sizeHintView.text = " \(image.size.width)x\(image.size.height) "
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

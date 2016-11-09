//
//  ConfigView.swift
//  DearFace
//
//  Created by J HD on 2016/11/9.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit

class ConfigView: UIView {
	
	/// a content to have a quick look at the image
	lazy var imageViewer: UIButton = {
		let imageViewer = UIButton()
		imageViewer.backgroundColor = UIColor.lightGray
		imageViewer.setTitle("Tap", for: .normal)
		imageViewer.titleLabel?.font = UIFont.Normal(20)
		imageViewer.setTitleColor(UIColor.white, for: .normal)
		return imageViewer
	}()
	
	/// a view used to hint the size of the image
	lazy var sizeHintView: UILabel = {
		let sizehint = UILabel()
		sizehint.textColor = UIColor.white
		sizehint.font = UIFont.Normal(12)
		sizehint.layer.cornerRadius = 6
		sizehint.clipsToBounds = true
		sizehint.backgroundColor = UIColor.blackBackCover
		sizehint.isHidden = true
		return sizehint
	}()
	
	///行数slider
	lazy var secSlider: UISlider = {
		let slider = UISlider()
		slider.tag = 0
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

	/// go button
	lazy var goButton: UIButton = {
		let button = UIButton()
		button.layer.cornerRadius = 30
		button.setTitle("Go", for: .normal)
		button.titleLabel?.font = UIFont.Normal(20)
		button.setBackgroundImage(UIImage.fromColor(UIColor.tint), for: .normal)
		button.setBackgroundImage(UIImage.fromColor(UIColor(139,142,149)), for: .disabled)
		button.backgroundColor = UIColor.tint
		button.setTitleColor(UIColor.white, for: .normal)
		button.isEnabled = false
		button.clipsToBounds = true
		return button
	}()
	
	init(){
		super.init(frame: CGRect.zero)
		makeUI()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		makeUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func makeUI() {
		backgroundColor = UIColor.white
		
		addSubview(imageViewer)
		imageViewer.snp.makeConstraints { (make) in
			make.left.equalTo(self)
			make.top.equalTo(self)
			make.right.equalTo(self)
			make.height.greaterThanOrEqualTo(200).priority(700)
			make.height.lessThanOrEqualTo(300).priority(1000)
		}
		
		addSubview(sizeHintView)
		sizeHintView.snp.makeConstraints { (make) in
			make.right.equalTo(imageViewer).inset(20)
			make.top.equalTo(imageViewer).inset(10)
		}
		
		self.addSubview(secSlider)
		secSlider.snp.makeConstraints { (make) in
			make.left.equalTo(self).inset(16)
			make.right.equalTo(self).inset(16)
			make.top.equalTo(imageViewer.snp.bottom).offset(20)
		}
		addSubview(secLabel)
		secLabel.snp.makeConstraints { (make) in
			make.right.equalTo(secSlider)
			make.top.equalTo(secSlider.snp.bottom)
			make.height.equalTo(20)
		}
		
		addSubview(rowSlider)
		rowSlider.snp.makeConstraints { (make) in
			make.left.equalTo(secSlider)
			make.right.equalTo(secSlider)
			make.top.equalTo(secLabel.snp.bottom).offset(10)
		}
		addSubview(rowLabel)
		rowLabel.snp.makeConstraints { (make) in
			make.right.equalTo(rowSlider)
			make.top.equalTo(rowSlider.snp.bottom)
			make.height.equalTo(20)
		}

		addSubview(goButton)
		goButton.snp.makeConstraints { (make) in
			make.top.greaterThanOrEqualTo(rowLabel.snp.bottom).offset(20).priority(999)
			make.centerX.equalTo(self)
			make.width.equalTo(60)
			make.height.equalTo(60)
			make.bottom.lessThanOrEqualTo(self).inset(60).priority(1000)
		}
	}
	
}

//
//  ViewController.swift
//  UncommonlyUsedControlProject
//
//  Created by zhifu360 on 2019/5/22.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    ///创建UISegmentControl
    lazy var segmentControl: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["1","2","3","4","5","6"])
        seg.frame = CGRect(x: 0, y: kTopHeight+10, width: ScreenSize.width-40, height: 40)
        seg.center.x = view.center.x
        seg.selectedSegmentIndex = 0
        seg.tintColor = RandomColor
        seg.addTarget(self, action: #selector(segmentControlValueChanged(_:)), for: UIControl.Event.valueChanged)
        return seg
    }()
    
    ///创建UISlider
    lazy var slider: UISlider = {
        let s = UISlider(frame: CGRect(x: 10, y: view.bounds.size.height-40, width: 100*SCALE_X, height: 40))
        s.minimumValue = 0.1
        s.maximumValue = 1
        s.value = 1
        s.isContinuous = true
        s.addTarget(self, action: #selector(sliderValueChanged(_:)), for: UIControl.Event.valueChanged)
        return s
    }()
    
    ///创建UIStepper
    lazy var stepper: UIStepper = {
        let ste = UIStepper(frame: CGRect(x: 0, y: self.slider.frame.origin.y, width: 80*SCALE_X, height: 40))
        ste.center.x = view.center.x
        ste.minimumValue = 0.1
        ste.maximumValue = 1
        //设置每次改变量
        ste.stepValue = 0.1
        ste.value = 1
        ste.autorepeat = true
        ste.isContinuous = true
        ste.addTarget(self, action: #selector(stepperValueChanged(_:)), for: UIControl.Event.valueChanged)
        return ste
    }()
    
    ///创建UISwitch
    lazy var switchControl: UISwitch = {
        let switchCtrl = UISwitch(frame: CGRect(x: view.bounds.size.width - 60*SCALE_X - 10, y: self.slider.frame.origin.y, width: 60*SCALE_X, height: 40))
        switchCtrl.isOn = false
        switchCtrl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        return switchCtrl
    }()
    
    ///创建图片
    lazy var centerImgView: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 200*SCALE_X, height: 200*SCALE_Y))
        img.center = view.center
        img.image = UIImage(named: "1.jpg")
        img.contentMode = UIView.ContentMode.scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 3
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPage()
    }

    func setPage() {
        title = "演示"
        view.addSubview(segmentControl)
        view.addSubview(slider)
        view.addSubview(stepper)
        view.addSubview(switchControl)
        view.addSubview(centerImgView)
    }
    
    @objc func segmentControlValueChanged(_ seg: UISegmentedControl) {
        let index = seg.selectedSegmentIndex+1
        centerImgView.image = UIImage(named: "\(index).jpg")
    }
    
    @objc func sliderValueChanged(_ slider: UISlider) {
        centerImgView.transform = CGAffineTransform(scaleX: CGFloat(slider.value), y: CGFloat(slider.value))
    }

    @objc func stepperValueChanged(_ stepper: UIStepper) {
        print(stepper.value)
        centerImgView.transform = CGAffineTransform(scaleX: CGFloat(stepper.value), y: CGFloat(stepper.value))
    }
    
    @objc func switchValueChanged(_ switchCtrl: UISwitch) {
        //修改背景色
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.view.backgroundColor = switchCtrl.isOn ? RandomColor : UIColor.white
        }) { (finish) in
            
        }
    }
    
}


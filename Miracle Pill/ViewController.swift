//
//  ViewController.swift
//  Miracle Pill
//
//  Created by Murat Kuran on 16/10/2017.
//  Copyright © 2017 Murat Kuran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var stateBtn: UIButton!
    
    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    @IBOutlet weak var countryTxt: UITextField!
    
    @IBOutlet weak var zipCodeLbl: UILabel!
    
    @IBOutlet weak var zipCodeTxt: UITextField!
    
    @IBOutlet weak var buyNowBtn: UIButton!
    
    @IBOutlet weak var successImg: UIImageView!
    
    @IBOutlet weak var miraclePillEmoj: UIImageView!
    
    @IBOutlet weak var dividerView: UIView!
    
    let stateArray = ["Istanbul", "Ankara", "Adana", "Izmir", "Antalya"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        //self.view.backgroundColor = UIColor.purple
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stateBtnPressed(_ sender: Any) {
        if !statePicker.isHidden{
            statePickerHidden(hiddenValue: true)
        }
        else{
            statePickerHidden(hiddenValue: false)
        }
        
    }
    
    @IBAction func buyNowBtnPressed(_ sender: Any) {
        for view in self.view.subviews as [UIView] {
            if let btn = view as? UIButton {
                btn.isHidden = true
            }
            if let lbl = view as? UILabel {
                lbl.isHidden = true
            }
            if let txt = view as? UITextField {
                txt.isHidden = true
            }
            if let pck = view as? UIPickerView {
                pck.isHidden = true
            }
        }
        miraclePillEmoj.isHidden = true
        dividerView.isHidden = true
        successImg.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stateArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stateArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateBtn.setTitle(stateArray[row], for: UIControlState.normal)
        statePickerHidden(hiddenValue: true)
    }
    
    func statePickerHidden(hiddenValue: Bool){
        if hiddenValue {
            statePicker.isHidden = true
            countryLbl.isHidden = false
            countryTxt.isHidden = false
            zipCodeLbl.isHidden = false
            zipCodeTxt.isHidden = false
        }
        else{
            statePicker.isHidden = false
            countryLbl.isHidden = true
            countryTxt.isHidden = true
            zipCodeLbl.isHidden = true
            zipCodeTxt.isHidden = true
        }
    }
}


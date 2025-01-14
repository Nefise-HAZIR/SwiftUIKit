//
//  ViewController.swift
//  WidgetsSwift
//
//  Created by Nefise Hazır on 19.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mSwitch: UISwitch!
    @IBOutlet weak var textFieldData: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    @IBOutlet weak var labelSlider: UILabel!
    
    @IBOutlet weak var labelStepper: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var stepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSlider.text=String(Int(slider.value))
        labelStepper.text=String(Int(stepper.value))
        indicator.isHidden=true
    }
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func buttonEnter(_ sender: Any) {
        if let alinanVeri=textFieldData.text{
            labelResult.text=alinanVeri
        }
    }
    @IBAction func buttonHappy(_ sender: Any) {
        imageView.image=UIImage(named: "pic1")
    }
    @IBAction func buttonSad(_ sender: Any) {
        imageView.image=UIImage(named: "pic2")
    }
    
    @IBAction func switchChanges(_ sender: UISwitch) {
        if sender.isOn {
            print("switch on")
        }else{
            print("switch off")
        }
    }
    
    @IBAction func segmentedChanges(_ sender: UISegmentedControl) {
        let index=sender.selectedSegmentIndex
        let catagory=sender.titleForSegment(at: index)
        print("seçim: \(catagory!)")
    }
    
    @IBAction func sliderChanges(_ sender: UISlider) {
        labelSlider.text=String(Int(sender.value))
    }
    
    @IBAction func stepperChanges(_ sender: UIStepper) {
        labelStepper.text=String(Int(sender.value))
    }
    
    @IBAction func buttonStart(_ sender: Any) {
        indicator.isHidden=false
        indicator.startAnimating()
    }
    
    @IBAction func buttonStop(_ sender: Any) {
        indicator.isHidden=true
        indicator.stopAnimating()
    }
    @IBAction func buttonShow(_ sender: Any) {
        print("switch state: \(mSwitch.isOn)")
        
        let index=segmentedController.selectedSegmentIndex
        let catagory=segmentedController.titleForSegment(at: index)
        print("seçimlen katagori: \(catagory!)")
        print("Slider durum:\(slider.value)")
        print("Stepper durum: \(stepper.value)")
    }
    
}


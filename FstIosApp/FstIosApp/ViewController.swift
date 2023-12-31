//
//  ViewController.swift
//  FstIosApp
//
//  Created by Seo on 2023/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var tryCountLabel : UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    var randomValue : Int = 0
    var tryCount : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb.png"), for: .normal)
        
        reset()
    }
    
    func reset(){
        print("reset!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0/5"
        
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
        
    }

    @IBAction func sliderValueChanged(_ sender : UISlider) {
        print(sender.value)
        let integerValue : Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(message : String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let OKaction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(OKaction)
        present(alert, animated: true,completion: nil)
    }

    @IBAction func touchUpHitButton(_ sender : UIButton){
        print(slider.value)
        let hitValue : Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount)/5"
        
        if randomValue == hitValue {
            showAlert(message: "You HIT!")
            reset()
            return
        }
        else if tryCount == 5 {
            showAlert(message: "You lose...")
            reset()
            return
        }
        else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        }
        else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
        
    }
    
    @IBAction func touchUpResetButton(_ sender : UIButton){
        print("touch up reset button")
        reset()
    }
}

//
//  ViewController.swift
//  BasicCalculator
//
//  Created by Ali Pempe on 23.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstText: UITextField!
    
    
    @IBOutlet weak var secondText: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var harfnotuLabel: UILabel!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hesaplaButton(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
             if let secondNumber = Int(secondText.text!){
                let result = (firstNumber * 4 / 10) + (secondNumber * 6 / 10)
                
                 resultLabel.text = String(result)
                 
             }
        }
        
        
        
        if Int(resultLabel.text!)! >= 90 {
            harfnotuLabel.text = "Harf Notunuz AA'dır."
        }

        else if (Int(resultLabel.text!)! >= 85){
            harfnotuLabel.text = "Harf Notunuz BA'dır."
        }

        else if (Int(resultLabel.text!)! >= 80){
            harfnotuLabel.text = "Harf Notunuz BB'dir."

        }

        else if (Int(resultLabel.text!)! >= 75){
            harfnotuLabel.text = "Harf Notunuz CB'dir."
        }

        else if (Int(resultLabel.text!)! >= 65){
            harfnotuLabel.text = "Harf Notunuz CC'dir."
        }

        else if (Int(resultLabel.text!)! >= 60){
            harfnotuLabel.text = "Harf Notunuz DC'dir."
        }

        else if (Int(resultLabel.text!)! >= 55){
            harfnotuLabel.text = "Harf Notunuz DD'dir."
        }

        else if (Int(resultLabel.text!)! >= 50){
            harfnotuLabel.text = "Harf Notunuz FD'dir."
        }

        else if (Int(resultLabel.text!)! < 50){
            harfnotuLabel.text = "Harf Notunuz FF'dir."
        }
             
    
    }
    
}


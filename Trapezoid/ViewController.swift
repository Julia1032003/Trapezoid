//
//  ViewController.swift
//  Trapezoid
//
//  Created by Julia Wang on 2019/8/31.
//  Copyright © 2019 Julia Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var valueTextField: UITextField!
    @IBOutlet var answerTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAnswerButton(_ sender: Any) {
        let squareText = valueTextField.text!
        let square = Double(squareText)
        if square != nil {
            let square = sqrt(square!)
            answerTextField.text = String(square)
            print(square)
        }
    }
    


}


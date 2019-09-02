//
//  TrapezoidViewController.swift
//  Trapezoid
//
//  Created by Julia Wang on 2019/9/1.
//  Copyright © 2019 Julia Wang. All rights reserved.
//

import UIKit

class TrapezoidViewController: UIViewController {
    
    
    @IBOutlet var upperTextField: UITextField!
    @IBOutlet var lowerTextField: UITextField!
    @IBOutlet var highTextField: UITextField!
    @IBOutlet var longTextField: UITextField!
    @IBOutlet var widthTextField: UITextField!
    @IBOutlet var radiusTextField: UITextField!
    @IBOutlet var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calButton(_ sender: Any) {
        Trapezoid()
    }
    
    @IBAction func triCalButton(_ sender: Any) {
        triangleArea()
          
    }
    
    @IBAction func recButton(_ sender: Any) {
        rectangleArea()
    }
    
    @IBAction func cirButton(_ sender: Any) {
        circularArea()
    }
    
    
    
   
    //梯形
    func Trapezoid(){
         let upperText = upperTextField.text!,lowerText = lowerTextField.text! , highText = highTextField.text!
         let upper = Int(upperText),lower = Int(lowerText),high = Int(highText)
         if upper != nil , lower != nil, high != nil{
            let TrapezoidValue = (upper!+lower!) * high!/2
            answerTextField.text = String(TrapezoidValue)
            print(TrapezoidValue)
        }
    }
    
    //三角型
    func triangleArea(){
         let highText = highTextField.text!,lowerText = lowerTextField.text!
         let high = Int(highText),lower = Int(lowerText)
         if high != nil , lower != nil{
            let triangleValue = (lower!*high!)/2
            answerTextField.text = String(triangleValue)
            print(triangleValue)
                    
        }
    }
    
    //矩形
    func rectangleArea(){
         let longText = longTextField.text!,widthText = widthTextField.text!
         let long = Int(longText), width = Int(widthText)
         if long != nil , width != nil{
            let rectangleValue = (long!*width!)
            answerTextField.text = String(rectangleValue)
            print(rectangleValue)
         }
        
    }
    
    //圓形
    func circularArea(){
        let radiusText = radiusTextField.text!
        let radius = Double(radiusText)
        if radius != nil {
            let radiusValue = (radius! + radius!) * 3.1415
            answerTextField.text = String(radiusValue)
            print(radiusValue)
        }
    
    }

}

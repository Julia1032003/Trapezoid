//
//  PropConversionViewController.swift
//  Trapezoid
//
//  Created by Julia Wang on 2019/9/2.
//  Copyright © 2019 Julia Wang. All rights reserved.
//

import UIKit

class PropConversionViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UITextFieldDelegate {
    

    @IBOutlet var chemistryNamePickerView: UIPickerView!
    @IBOutlet var kgTextField: UITextField!
    @IBOutlet var literTextField: UITextField!
    @IBOutlet var proportionLabel: UILabel!
    
    
    var chemistryName: [proportion] = []
    var chemistryIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        getchemistryName()
        updateProportion()
        
        let kiloTextField = kgTextField
        kiloTextField?.clearButtonMode = .whileEditing

        // Do any additional setup after loading the view.
    }
    
    func updateChemistrysPickerView(name:String){
        getchemistryName()
        for (i, chemistry)in chemistryName.enumerated(){
            if chemistry.chemistryname == name {
                updatePickerView(row: i)
                break
            }
            print("ok")
        }
    }
    
    func updatePickerView(row:Int){
        chemistryNamePickerView.selectRow(row, inComponent: 0, animated: true)
        chemistryIndex = row
    }
    
    
    //回傳顯示幾個類別的pikcer
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //回傳顯示化學原料名稱數量
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return chemistryName.count
    }

//顯示文字在Picker上，titleForRow為現在要顯示的文字是在Picker上的第幾個，如果剛剛的numberOfComponents()有設定超過1的話，這邊的第三個參數component就可以用來判斷每個component要顯示的文字。
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return chemistryName[row].chemistryname
    }
    
     //判斷現在選到的是第幾個，並依據選到的結果顯示對應化學原料的比重
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chemistryIndex = row
        updateProportion()
    }
    
    func getchemistryName(){
        if let url = Bundle.main.url(forResource:"chemistry", withExtension: "txt"),let content = try? String(contentsOf: url){
           let chemistryArray = content.components(separatedBy: "\n")
           for number in stride(from: 0, to: chemistryArray.count, by: 2) {
                let  chemistryname = chemistryArray[number]
                if chemistryname.count > 0 {
                if let proportionvalue = Double(chemistryArray[number+1]){
                    chemistryName.append(proportion(chemistryname: chemistryname, proportionvalue: Double(proportionvalue)))
                    }
                }
                     
          }
        }
    }
    
    /*func getchemistryName(){
        if let url = Bundle.main.url(forResource:"chemistry", withExtension: "txt"),let content = try? String(contentsOf: url){
            let chemistryArray = content.components(separatedBy: "\n")
            for number in 1 ..< chemistryArray.count{
                if number % 2 == 0{
                    let chemistryname = chemistryArray[number]
                    if let proportionvalue = Int(chemistryArray[number]){
                        chemistryName.append(proportion(chemistryname: chemistryname, proportionvalue: Double(proportionvalue)))

                    }else{
                        print("轉型失敗")
                    }
                }
            }
        }
    }*/
    
    func updateProportion(){
        proportionLabel.text = "\(chemistryName[chemistryIndex].proportionvalue)"
    }
    
    
    @IBAction func exchangeButton(_ sender: Any) {
        let kilogramText = kgTextField.text! , proportionText = proportionLabel.text!
        let kilogram = Double(kilogramText), proportion = Double(proportionText)
        if kilogram != nil , proportion != nil {
            let literValue = kilogram! * proportion!
            literTextField.text = String(literValue)
            print(literValue)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

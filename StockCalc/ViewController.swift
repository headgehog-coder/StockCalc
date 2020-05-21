//
//  ViewController.swift
//  StockCalc
//
//  Created by 岩元喜輝 on 2020/05/21.
//  Copyright © 2020 Yoshiki Iwamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    //アラート表示　宣言
    var alertController: UIAlertController!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var numberOfStuckTextField: UITextField!
    @IBOutlet weak var earningTextField: UITextField!
    @IBOutlet weak var assetTextField: UITextField!
    @IBOutlet weak var equityTextField: UITextField!
    
    @IBOutlet weak var resultButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        priceTextField.delegate = self
//        numberOfStuckTextField.delegate = self
//        earningTextField.delegate = self
//        assetTextField.delegate = self
        equityTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        priceTextField.text = ""
         numberOfStuckTextField.text = ""
         earningTextField.text = ""
         assetTextField.text = ""
         equityTextField.text = ""
    }
     

    //メソッド
     func alert(title:String, message:String) {
            alertController = UIAlertController(title: title,message: message,preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
            present(alertController, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resultButton.sendActions(for: .touchUpInside)
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "result"{
            guard priceTextField.text != "" && numberOfStuckTextField.text != "" && earningTextField.text != "" && assetTextField.text != "" && equityTextField.text != "" else{
                    alert(title: "エラー", message: "入力して下さい")
                return false
            }
             
        }
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifire = segue.identifier else{
            return
        }
        if identifire == "result"{
            let resultVC = segue.destination as! ResultViewController
            resultVC.price = Double(priceTextField.text!)!
            resultVC.stock = Double(numberOfStuckTextField.text!)!
            resultVC.earning = Double(earningTextField.text!)!
            resultVC.asset = Double(assetTextField.text!)!
            resultVC.equity = Double(equityTextField.text!)!
            self.priceTextField.resignFirstResponder()
             self.numberOfStuckTextField.resignFirstResponder()
             self.earningTextField.resignFirstResponder()
             self.assetTextField.resignFirstResponder()
             self.equityTextField.resignFirstResponder()
        }
    }

}


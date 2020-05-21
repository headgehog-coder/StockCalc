//
//  ResultViewController.swift
//  StockCalc
//
//  Created by 岩元喜輝 on 2020/05/21.
//  Copyright © 2020 Yoshiki Iwamoto. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    //アラート表示　宣言
    var alertController: UIAlertController!
    var price:Double = 0.0
    var stock:Double = 0.0
    var earning:Double = 0.0
    var asset:Double = 0.0
    var equity:Double = 0.0
    @IBOutlet weak var perLabel: UILabel!
    @IBOutlet weak var pbrLabel: UILabel!
    @IBOutlet weak var roaLabel: UILabel!
    @IBOutlet weak var roeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if price > 0 && stock > 0 && earning > 0 && asset > 0 && equity > 0{
             let intPer = Int(price / (earning / stock))
                   let intPbr = Int(price / (equity / stock))
                   let intRoa = Int(earning / asset * 100)
                   let intRoe = Int(earning / equity * 100)
            perLabel.text = String(intPer)
            pbrLabel.text = String(intPbr)
            roaLabel.text = String(intRoa)
            roeLabel.text = String(intRoe)
        }else{
            
               alert(title: "エラー", message: "前画面にて0以上の数字を入力して下さい")
             
        }
       // Do any additional setup after loading the view.
    }
    
     

    //メソッド
     func alert(title:String, message:String) {
            alertController = UIAlertController(title: title,message: message,preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
            present(alertController, animated: true)
    }

  @IBAction func backButton(_ sender: Any) {
                   self.dismiss(animated: true, completion: nil)
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

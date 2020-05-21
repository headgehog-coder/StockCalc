//
//  ResultViewController.swift
//  StockCalc
//
//  Created by 岩元喜輝 on 2020/05/21.
//  Copyright © 2020 Yoshiki Iwamoto. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    var alertController: UIAlertController!
    var price:Float = 0.0
    var stock:Float = 0.0
    var earning:Float = 0.0
    var asset:Float = 0.0
    var equity:Float = 0.0
    @IBOutlet weak var perLabel: UILabel!
    @IBOutlet weak var pbrLabel: UILabel!
    @IBOutlet weak var roaLabel: UILabel!
    @IBOutlet weak var roeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if price != 0 && stock != 0 && earning != 0 && asset != 0 && equity != 0{
            let numPer = price / ((earning * 1000000) / (stock * 1000))
            let numPbr = price / ((equity * 1000000) / (stock * 1000))
            let numRoa = (earning * 1000000) / (asset * 1000000) * 100
            let numRoe = (earning * 1000000) / (equity * 1000000) * 100
            
            let floorPer = floorf(numPer*100)/100
            let floorPbr = floorf(numPbr*100)/100
            let floorRoa = floorf(numRoa*100)/100
            let floorRoe = floorf(numRoe*100)/100
            
            perLabel.text = "\(String(floorPer))倍"
            pbrLabel.text = "\(String(floorPbr))倍"
            roaLabel.text = "\(String(floorRoa))%"
            roeLabel.text = "\(String(floorRoe))%"
        
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if price == 0 || stock == 0 || earning == 0 || asset == 0 || equity == 0{
              alert(title: "エラー", message: "前画面にて0以外の数字を入力して下さい")
        }
    }
     

    
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

//
//  ViewController.swift
//  calculator.testo
//
//  Created by 木下　侑大 on 2021/03/26.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0; // 画面上の数字
    var previousNumber:Double = 0; // 前回表示されていた数字
    var performingMath = false  // 計算してもいい？の判断値
    var operation = 0; //  + , - , × , ÷
    
    @IBOutlet weak var label: UILabel! //計算結果
    
    @IBAction func numbers(_ sender: UIButton) { //1〜9の数字ボタン
        if performingMath == true{  //演算子が入力された後に2番目の数字が入力されると、上書きされる形でlabelへ表示
        label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
                       performingMath = false
                   }
                   else{  //数字ボタンが押されると初めは何も入力されていないのでここからスタート↓
                       label.text = label.text! + String(sender.tag-1)  // String(sender.tag-1) 数字が代入
                    
                    guard let unwrapped = label.text else { return }
                    print (unwrapped)//[!]で強制unwrapではなくてguard-letでunwrapする
                    
                    //強制アンラップしてエラーになった例 → numberOnScreen = Double(label.text!)!
                    
                   }
    }
    
    @IBAction func button(_ sender: UIButton) {//記号のボタン
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16{//数字が表示されていた場合の処理
            
                    print(label.text)
            
                    previousNumber = Double(label.text!)!
            
                    //↓演算子がどれで入力されたか
                    if sender.tag == 12{ // ÷
                        label.text = "÷";
                    }
                    else if sender.tag == 13{  // ×
                        label.text = "×";
                    }
                    else if sender.tag == 14{  // -
                        label.text = "-";
                    }
                    else if sender.tag == 15{  // +
                        label.text = "+";
                    }
            
            
                    operation = sender.tag
                    performingMath = true;  //計算プロセスに進める場合は次へ
                }
        
        
                else if sender.tag == 16 // = が押された時の処理　2番目の数字が入力された後ココの処理で、previousNumber（1番目の数字） numberOnScreen（2番目の数字）が計算される
                {
                    if operation == 12{
                        label.text = String(previousNumber / numberOnScreen)
                    }
                    else if operation == 13{
                        label.text = String(previousNumber * numberOnScreen)
                    }
                    else if operation == 14{
                        label.text = String(previousNumber - numberOnScreen)
                    }
                    else if operation == 15{
                        label.text = String(previousNumber + numberOnScreen)
                    }
                }//その後またlabelに代入されて表示
                
                
                else if sender.tag == 11{ // C が押された時の処理
                    label.text = ""
                    previousNumber = 0;
                    numberOnScreen = 0;
                    operation = 0;
                }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//
//  ViewController.swift
//  482
//
//  Created by partTimeWorker on 13/4/2022.
//

import UIKit

class ViewController: UIViewController {


    var QuestionNumber = 0
    var ScorePoint:Int = 0
    var questions = [Question]()
    var rightAnswer = ""
    
    @IBOutlet var Questionoptions: [UIButton]!              //選項按鈕
    @IBOutlet weak var QuestionTextLabel: UILabel!      //選項問題顯示
    @IBOutlet weak var Numbercount: UILabel!            //選項題數
    @IBOutlet weak var GameScore: UILabel!              //選項問題顯示

    func UpdateLevelsText(){
        GameScore.text = String("分數: \(ScorePoint)分")
        Numbercount.text = "第 \(QuestionNumber + 1) 題"
    }
    func playGame() {
        if QuestionNumber == 10{
            alter_Controller()
        }
        else{
            UpdateLevelsText()
            let QuestionText = "\(question1[QuestionNumber].questions)"
            QuestionTextLabel.text = QuestionText
            rightAnswer = question1[QuestionNumber].answer
            question1[QuestionNumber].option.shuffle()
        for i in 0...2{
            Questionoptions[i].setTitle(question1[QuestionNumber].option[i], for: .normal)
            }
        }
    }
    
    @IBAction func optionPressBtn(_ sender: UIButton) {
        QuestionNumber = QuestionNumber + 1                         //if 按鈕上的文字等於 正確答案
        if sender.currentTitle == rightAnswer{
            ScorePoint = ScorePoint + 10
            GameScore.text = String("分數: \(ScorePoint)分")
        }
        playGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question1.shuffle()
        playGame()
        UpdateLevelsText()
    }
    func alter_Controller() {
            let alertController = UIAlertController(
            title: "遊戲結束",
            message: "獲得: \(ScorePoint)分",
            preferredStyle: .alert)
            //參數 preferredStyle 傳入 .alert 將顯示中間彈出視窗
            //利用 UIAlertAction 生成視窗上顯示的按鈕
            let okButton = UIAlertAction(title: "確定",style: .default){_ in
                self.ScorePoint = 0
                self.QuestionNumber = 0
                self.viewDidLoad()
            }
            alertController.addAction(okButton)
            present(alertController, animated: true)
    }
    /*func updateScoreAndNumber(){
     // buttonCounter += 1
        currentValue = lroundf(Float(numbers))
        targetValue = 1 + Int(arc4random_uniform(3))
        let message = "\(targetValue)"
        let count = "\(buttonCounter)"
        //let point = "\(Scorepoint)"
        tect.text = "\(message)"
        counter.text="目前第\(count)題"
        //Score.text="\(point)分"
        //counttotal()
    }*/
    
  /*  @IBAction func button(_ sender: Any) {
        updateScoreAndNumber()
         //   counttotal()
        if (buttonCounter != 0){
            button.isHidden=true
        }
    }*/
 /*   func counttotal(){
        count1()
        count2()
        count3()
    }
    func count1(){
        if (targetValue == 1){
            button1.setTitle("3-1=0", for: [])
            button2.setTitle("3-3=0", for: [])
            button3.setTitle("1+2=1", for: [])
            button.setTitle("skip", for: [])
            }
    }
    func count2 (){
        if (targetValue == 2){
            button1.setTitle("1111", for: [])
            button2.setTitle("2222", for: [])
            button3.setTitle("5869", for: [])
            button.setTitle("skip", for: [])
        }
    }
    func count3 (){
        if (targetValue == 3){
            button1.setTitle("appple", for: [])
            button2.setTitle("aple", for: [])
            button3.setTitle("apple", for: [])
            button.setTitle("skip", for: [])
        }
    }*/
  /*  @IBAction func button1touchdown(_ sender: Any) {
       // if(targetValue == 1){Scorepoint += 10}
        updateScoreAndNumber()
        return
    }
    @IBAction func button2touchdown(_ sender: Any) {
        if((targetValue == 1))
        { Scorepoint += 10}
        updateScoreAndNumber()
        return
    }
    @IBAction  func button3touchdown(_ sender: Any) {
        if((targetValue == 2)||(targetValue == 3)){Scorepoint += 10}
        updateScoreAndNumber()
        }*/
}
                



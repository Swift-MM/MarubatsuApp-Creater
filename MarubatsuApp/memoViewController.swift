//
//  memoViewController.swift
//  MarubatsuApp
//
//  Created by NOWALL on 2016/11/05.
//  Copyright © 2016年 NOWALL. All rights reserved.
//

import UIKit

class memoViewController: UIViewController {
    
    @IBOutlet weak var questionInputBox: UITextField!
    @IBOutlet weak var answerControl: UISegmentedControl!    
    
    // backボタンが押されたときの処理
    @IBAction func tappedBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // createボタンが押されたときの処理処理
    @IBAction func tappedCreateButton(_ sender: Any) {
        
        var answer: Bool = true
        
        if answerControl.selectedSegmentIndex == 0 {
            // choose false
            answer = false
        }
        else {
            // choose true
            answer = true
        }
        
        let questionText:String = questionInputBox.text!
        
        let ud = UserDefaults.standard
        var questions: [[String: Any]] = ud.object(forKey: "questions") as! [[String : Any]]
        
        questions.append( [
            "question": questionText,
            "answer": answer
        ])
        
        ud.setValue(questions, forKey: "questions")
    }
    
    // deleteボタンが押されたときの処理
    @IBAction func tappedDeleteAllQuestionButton(_ sender: UIButton) {
        let ud = UserDefaults.standard
        
        // 保存されている値を削除
        ud.removeObject(forKey: "questions")
        
        // 空のarrayをset(for エラー回避)
        ud.setValue([], forKey: "questions")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

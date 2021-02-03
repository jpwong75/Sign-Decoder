//
//  ViewController.swift
//  Sign Decoder
//
//  Created by JP Wong on 7/5/19.
//  Copyright © 2019 JP Wong. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    
    var sequence = [String()]
    var array = [[""],[""],[""],[""],[""]]
    var count = [Int(),Int(),Int()]
    var totalCount0 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCount1 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCount2 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCount3 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCount4 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCount5 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var strike0 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var strike1 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var strike2 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var ball0 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var ball1 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var ball2 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var ball3 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var out0 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var out1 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var out2 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        updateCount()
        // Do any additional setup after loading the view.
        
    }
    

    @IBOutlet weak var countLabel: UILabel!
    
    func updateCount(){
        countLabel.text = ("\(count[0]) - \(count[1]), \(count[2])")
    }
    
    
    
    @IBAction func addOut(_ sender: UIButton) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        if count[2] != 2{
            count[2] += 1
        } else {
            count [2] = 0
        }
        updateCount()
    }
    @IBAction func addStrike(_ sender: UIButton) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        if count[1] != 2{
            count[1] += 1
        } else {
            count [1] = 0
        }
        updateCount()
    }
   
    @IBAction func addBall(_ sender: UIButton) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        if count[0] != 3{
            count[0] += 1
        } else {
            count [0] = 0
        }
        updateCount()
    }
    
    
    @IBAction func dragLocation(_ sender: UIButton) {
        if sender.tag == 4{
            sequence.append("r")
            updateLabel()
        } else if sender.tag == 6{
            sequence.append ("c")
            updateLabel()
        }
    }
    
    @IBOutlet weak var sequenceLabel: UILabel!
    
    @IBAction func pressLocation(_ sender: UIButton) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        
        if sender.tag == 1{
            sequence.append("n")
            updateLabel()
        }else if sender.tag == 2{
            sequence.append("h")
            updateLabel()
        }else if sender.tag == 3{
            sequence.append("t")
            updateLabel()
        }else if sender.tag == 4{
            sequence.append("r")
            updateLabel()
        }else if sender.tag == 5{
            sequence.append("l")
            updateLabel()
        }else if sender.tag == 6{
            sequence.append("c")
            updateLabel()
        }else if sender.tag == 7{
            sequence.append("C")
            updateLabel()
        }else if sender.tag == 8{
            sequence.append("b")
            updateLabel()
        }else if sender.tag == 9{
            sequence.append("s")
            updateLabel()
        }else if sender.tag == 10{
            sequence.append("e")
            updateLabel()
        }else if sender.tag == 11{
            sequence.append("w")
            updateLabel()
        } else if sender.tag == 12{
            sequence.append("S")
            updateLabel()
        }else if sender.tag == 13{
            sequence.append("E")
            updateLabel()
        }else if sender.tag == 14{
            sequence.append("W")
            updateLabel()
        }else if sender.tag == 15{
            sequence.append("1")
            updateLabel()
        }else if sender.tag == 16{
            sequence.append("2")
            updateLabel()
        }else if sender.tag == 17{
            sequence.append("3")
            updateLabel()
        }
     
    }
    
    func updateLabel (){
        var letters = String()
        letters = ""
        for letter in sequence{
            letters += (letter)
        }
        sequenceLabel.text = ("Sequence: \(letters)")
    }
    
    @IBAction func goBack(_ sender: Any) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        
        if (!sequence.isEmpty){
            sequence.removeLast()
        }
        updateLabel()
        updateCount()
    }
    @IBAction func cancel(_ sender: Any) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        
        sequence = []
        updateLabel()
        updateCount()
    }
    
    @IBAction func next(_ sender: UIButton) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        
//       
        performSegue(withIdentifier: "moveToPitch", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToPitch"{
            array.insert(sequence, at : 0)
            let secondVC = segue.destination as! PitchViewController
  
            secondVC.arrayType = array
            secondVC.countType = count
            secondVC.strike0Type = strike0
            secondVC.strike1Type = strike1
            secondVC.strike2Type = strike2
            secondVC.ball0Type = ball0
            secondVC.ball1Type = ball1
            secondVC.ball2Type = ball2
            secondVC.ball3Type = ball3
            secondVC.out0Type = out0
            secondVC.out1Type = out1
            secondVC.out2Type = out2
            secondVC.sequenceType = sequence
            secondVC.totalCountType0 = totalCount0
            secondVC.totalCountType1 = totalCount1
            secondVC.totalCountType2 = totalCount2
            secondVC.totalCountType3 = totalCount3
            secondVC.totalCountType4 = totalCount4
            secondVC.totalCountType5 = totalCount5
           
        }
    }
    
    
 
    
   
}
    



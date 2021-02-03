//
//  DataViewController.swift
//  Sign Decoder
//
//  Created by JP Wong on 7/6/19.
//  Copyright © 2019 JP Wong. All rights reserved.
//

import UIKit



class DataViewController: UIViewController {

   
   
    var myArray = [[String()]]
    var myaaa = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var myPossibles = [String()]
    var myCount = [Int(),Int(),Int()]
    var myTotalCount0 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var myTotalCount1 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var myTotalCount2 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var myTotalCount3 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var myTotalCount4 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
   var myTotalCount5 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my0Strike = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my1Strike = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my2Strike = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my0Ball = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my1Ball = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my2Ball = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my3Ball = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my0out = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my1out = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var my2out = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let sequenceOutputs = [sequenceOutput, sequenceOutput2,sequenceOutput3,sequenceOutput4,sequenceOutput5 ]
        let pitchOutputs = [pitchOutput, pitchOutput2,pitchOutput3,pitchOutput4,pitchOutput5 ]
        let countArray = [count1,count2,count3,count4,count5,count6,count7,count8,count9,count10]
        let totalCountArray = [totalCount0,totalCount1,totalCount2,totalCount3,totalCount4,totalCount5]
      
        
        for i in 0...4{
            var letters = String()
            if myArray [i] == [""]{
                letters = ""
            } else {
                for j in 0...(myArray[i].count-1) {
                    letters.append (myArray [i][j])
                }
            }
            if myArray [i] != [""]{
            
                letters.removeLast(4)
                let p = letters.removeLast()
                sequenceOutputs[i]?.text = letters
                letters.append(p)
                if p == "f"{
                    pitchOutputs [i]?.text = "Fastball"
                } else if p == "c"{
                    pitchOutputs [i]?.text = "Curveball"
                } else if p == "s"{
                    pitchOutputs [i]?.text = "Slider"
                } else if p == "2"{
                    pitchOutputs [i]?.text = "2-seam"
                } else if p == "u"{
                    pitchOutputs [i]?.text = "Change-up"
                } else if p == "1"{
                    pitchOutputs [i]?.text = "Other 1"
                } else if p == "o"{
                    pitchOutputs [i]?.text = "Other 2"
                } else if p == "3"{
                    pitchOutputs [i]?.text = "Other 3"
                }
            } else {
                sequenceOutputs [i]?.text = ""
                pitchOutputs [i]?.text = ""
            }
        }
            
                
          print (myArray)
        
        
        
        for i in 0...7{
            if myaaa [i][0] == [""]{
                myaaa [i][0] = []
            }
        }
        for g in 0...(myArray.count-1) {
            if g <= myArray.count-1{
                if myArray[g].count == 3{
                    myArray.remove(at: g)
                }
                let endIndex = myArray[g][myArray[g].count-1]
                if endIndex == "fball"{
                    myaaa [0].append(myArray[g])
                } else if endIndex == "cball"{
                    myaaa [1].append(myArray[g])
                } else if endIndex == "uball"{
                    myaaa [2].append(myArray[g])
                } else if endIndex == "sball"{
                    myaaa [3].append(myArray[g])
                } else if endIndex == "2ball"{
                    myaaa [4].append(myArray[g])
                } else if endIndex == "11111"{
                    myaaa [5].append(myArray[g])
                } else if endIndex == "ooooo"{
                    myaaa [6].append(myArray[g])
                } else if endIndex == "33333"{
                    myaaa [7].append(myArray[g])
                }
            }
        }
    
        myPossibles = (findIndicator(aaa: myaaa, errorFactor : 0.8))
        for c in 0...4{
            if c < myPossibles.count{
                if c == 0{
                    indicator0.text = myPossibles [c]
                } else if c == 1 {
                    indicator1.text = myPossibles [c]
                } else if c == 2 {
                    indicator2.text = myPossibles [c]
                } else if c == 3 {
                    indicator3.text = myPossibles [c]
                } else if c == 4 {
                    indicator4.text = myPossibles [c]
                }
            }
        }
        var array = numberInSequence(aaa: myaaa, errorFactor: 0.8)
        for c in 0...array.count-1{
            if c == 0{
                first0.text = array [c]
            } else if c == 1 {
                first1.text = array [c]
            } else if c == 2 {
                first2.text = array [c]
            } else if c == 3 {
                first3.text = array [c]
            } else if c == 4 {
                first4.text = array [c]
            
            }
        }
        
        count.text = "\(myCount[0])-\(myCount[1]) \(myCount[2]) outs"
        
        
        let array1 = numberInSequence(aaa: my0Ball, errorFactor: 0.8)
        let array2 = numberInSequence(aaa: my1Ball, errorFactor: 0.8)
        let array3 = numberInSequence(aaa: my2Ball, errorFactor: 0.8)
        let array4 = numberInSequence(aaa: my3Ball, errorFactor: 0.8)
        let array5 = numberInSequence(aaa: my0Strike, errorFactor: 0.8)
        let array6 = numberInSequence(aaa: my1Strike, errorFactor: 0.8)
        let array7 = numberInSequence(aaa: my2Strike, errorFactor: 0.8)
        let array8 = numberInSequence(aaa: my0out, errorFactor: 0.8)
        let array9 = numberInSequence(aaa: my1out, errorFactor: 0.8)
        let array10 = numberInSequence(aaa: my2out, errorFactor: 0.8)
        var array11 = [String()]
        var countPossibles = [array1,array2,array3,array4,array5,array6,array7,array8,array9,array10,]
        for q in 0...9{
            if countPossibles[q].count > 1{
                for w in 1...countPossibles[q].count-1{
                    if q == 0{
                        array11.append("0 balls: \(countPossibles[q][w])")
                    } else if q == 1{
                        array11.append("1 ball: \(countPossibles[q][w])")
                    } else if q == 2{
                        array11.append("2 balls: \(countPossibles[q][w])")
                    } else if q == 3{
                        array11.append("3 balls: \(countPossibles[q][w])")
                    } else if q == 4{
                        array11.append("0 strikes: \(countPossibles[q][w])")
                    } else if q == 5{
                        array11.append("1 strike: \(countPossibles[q][w])")
                    } else if q == 6{
                        array11.append("2 strikes: \(countPossibles[q][w])")
                    }else if q == 7{
                        array11.append("0 outs: \(countPossibles[q][w])")
                    }else if q == 8{
                        array11.append("1 out: \(countPossibles[q][w])")
                    }else if q == 9{
                        array11.append("2 outs: \(countPossibles[q][w])")
                    }
                }
            }
        }
        let a1 = numberInSequence(aaa: myTotalCount0, errorFactor: 0.8)
        let a2 = numberInSequence(aaa: myTotalCount1, errorFactor: 0.8)
        let a3 = numberInSequence(aaa: myTotalCount2, errorFactor: 0.8)
        let a4 = numberInSequence(aaa: myTotalCount3, errorFactor: 0.8)
        let a5 = numberInSequence(aaa: myTotalCount4, errorFactor: 0.8)
        let a6 = numberInSequence(aaa: myTotalCount5, errorFactor: 0.8)
        var a7 = [String()]
        var cPossibles = [a1,a2,a3,a4,a5,a6]
        for q in 0...5{
            if cPossibles[q].count>1{
                for w in 1...cPossibles[q].count-1{
                    if q == 0{
                        a7.append("total 0: \(cPossibles[q][w])")
                    } else if q == 1{
                        a7.append("total 1: \(cPossibles[q][w])")
                    } else if q == 2{
                        a7.append("total 2: \(cPossibles[q][w])")
                    } else if q == 3{
                        a7.append("total 3: \(cPossibles[q][w])")
                    } else if q == 4{
                        a7.append("total 4: \(cPossibles[q][w])")
                    } else if q == 5{
                        a7.append("total 5: \(cPossibles[q][w])")
                    }
                }
            }
        }
        for e in 0...5{
            if e < a7.count{
                totalCountArray[e]?.text = a7[e]
            }
        }
        for e in 0...9{
            if e < array11.count{
                countArray[e]?.text = array11[e]
            }
        }
        
    }
    @IBOutlet weak var count1: UILabel!
    @IBOutlet weak var count2: UILabel!
    @IBOutlet weak var count3: UILabel!
    @IBOutlet weak var count4: UILabel!
    @IBOutlet weak var count5: UILabel!
    @IBOutlet weak var count6: UILabel!
    @IBOutlet weak var count7: UILabel!
    @IBOutlet weak var count8: UILabel!
    @IBOutlet weak var count9: UILabel!
    @IBOutlet weak var count10: UILabel!
    @IBOutlet weak var totalCount0: UILabel!
    @IBOutlet weak var totalCount1: UILabel!
    @IBOutlet weak var totalCount2: UILabel!
    @IBOutlet weak var totalCount3: UILabel!
    @IBOutlet weak var totalCount4: UILabel!
    @IBOutlet weak var totalCount5: UILabel!

    @IBAction func changePitch(_ sender: UIButton) {
        print (myArray)
        if sender.tag == 0 {
          
            let alert = UIAlertController(title: "What is the pitch?", message: "", preferredStyle: .alert)
            let fastball = UIAlertAction(title: "Fastball", style: .default, handler: { (UIAlertAction) in
                self.myArray[0][self.myArray[0].count-1] = "fball"
            })
            
            let curveball = UIAlertAction(title: "Curveball", style: .default, handler: { (UIAlertAction) in
                self.myArray[0][self.myArray[0].count-1] = "cball"
            })
           
            let changeUp = UIAlertAction(title: "Change-Up", style: .default, handler: { (UIAlertAction) in
                self.myArray[0][self.myArray[0].count-1] = "uball"
            })
            let slider = UIAlertAction(title: "Slider", style: .default, handler: { (UIAlertAction) in
                self.myArray[0][self.myArray[0].count-1] = "sball"
            })
            let seam = UIAlertAction(title: "2 Seam", style: .default, handler: { (UIAlertAction) in
                self.myArray[0][self.myArray[0].count-1] = "2ball"
            })
            let other1 = UIAlertAction(title: "Other 1", style: .default, handler: { (UIAlertAction) in
                self.myArray[0][self.myArray[0].count-1] = "11111"
            })
            let other2 = UIAlertAction(title: "Other 2", style: .default, handler: { (UIAlertAction) in
                self.myArray[0][self.myArray[0].count-1] = "ooooo"
            })
            let other3 = UIAlertAction(title: "Other 3", style: .default, handler: { (UIAlertAction) in
                self.myArray[0][self.myArray[0].count-1] = "33333"
            })
            alert.addAction(fastball)
            alert.addAction(curveball)
            alert.addAction(changeUp)
            alert.addAction(slider)
            alert.addAction(seam)
            alert.addAction(other1)
            alert.addAction(other2)
            alert.addAction(other3)
            present(alert, animated: true, completion: nil)
        } else if sender.tag == 1 {
            
            let alert = UIAlertController(title: "What is the pitch?", message: "", preferredStyle: .alert)
            let fastball = UIAlertAction(title: "Fastball", style: .default, handler: { (UIAlertAction) in
                self.myArray[1][self.myArray[1].count-1] = "fball"
            })
            
            let curveball = UIAlertAction(title: "Curveball", style: .default, handler: { (UIAlertAction) in
                self.myArray[1][self.myArray[1].count-1] = "cball"
            })
            
            let changeUp = UIAlertAction(title: "Change-Up", style: .default, handler: { (UIAlertAction) in
                self.myArray[1][self.myArray[1].count-1] = "uball"
            })
            let slider = UIAlertAction(title: "Slider", style: .default, handler: { (UIAlertAction) in
                self.myArray[1][self.myArray[1].count-1] = "sball"
            })
            let seam = UIAlertAction(title: "2 Seam", style: .default, handler: { (UIAlertAction) in
                self.myArray[1][self.myArray[1].count-1] = "2ball"
            })
            let other1 = UIAlertAction(title: "Other 1", style: .default, handler: { (UIAlertAction) in
                self.myArray[1][self.myArray[1].count-1] = "11111"
            })
            let other2 = UIAlertAction(title: "Other 2", style: .default, handler: { (UIAlertAction) in
                self.myArray[1][self.myArray[1].count-1] = "ooooo"
            })
            let other3 = UIAlertAction(title: "Other 3", style: .default, handler: { (UIAlertAction) in
                self.myArray[1][self.myArray[1].count-1] = "33333"
            })
            alert.addAction(fastball)
            alert.addAction(curveball)
            alert.addAction(changeUp)
            alert.addAction(slider)
            alert.addAction(seam)
            alert.addAction(other1)
            alert.addAction(other2)
            alert.addAction(other3)
            present(alert, animated: true, completion: nil)
        }  else if sender.tag == 2 {
            
            let alert = UIAlertController(title: "What is the pitch?", message: "", preferredStyle: .alert)
            let fastball = UIAlertAction(title: "Fastball", style: .default, handler: { (UIAlertAction) in
                self.myArray[2][self.myArray[2].count-1] = "fball"
            })
            let curveball = UIAlertAction(title: "Curveball", style: .default, handler: { (UIAlertAction) in
                self.myArray[2][self.myArray[2].count-1] = "cball"
            })
            let changeUp = UIAlertAction(title: "Change-Up", style: .default, handler: { (UIAlertAction) in
                self.myArray[2][self.myArray[2].count-1] = "uball"
            })
            let slider = UIAlertAction(title: "Slider", style: .default, handler: { (UIAlertAction) in
                self.myArray[2][self.myArray[2].count-1] = "sball"
            })
            let seam = UIAlertAction(title: "2 Seam", style: .default, handler: { (UIAlertAction) in
                self.myArray[2][self.myArray[2].count-1] = "2ball"
            })
            let other1 = UIAlertAction(title: "Other 1", style: .default, handler: { (UIAlertAction) in
                self.myArray[2][self.myArray[2].count-1] = "11111"
            })
            let other2 = UIAlertAction(title: "Other 2", style: .default, handler: { (UIAlertAction) in
                self.myArray[2][self.myArray[2].count-1] = "ooooo"
            })
            let other3 = UIAlertAction(title: "Other 3", style: .default, handler: { (UIAlertAction) in
                self.myArray[2][self.myArray[2].count-1] = "33333"
            })
            alert.addAction(fastball)
            alert.addAction(curveball)
            alert.addAction(changeUp)
            alert.addAction(slider)
            alert.addAction(seam)
            alert.addAction(other1)
            alert.addAction(other2)
            alert.addAction(other3)
            present(alert, animated: true, completion: nil)
        } else if sender.tag == 3 {
            
            let alert = UIAlertController(title: "What is the pitch?", message: "", preferredStyle: .alert)
            let fastball = UIAlertAction(title: "Fastball", style: .default, handler: { (UIAlertAction) in
                self.myArray[3][self.myArray[3].count-1] = "fball"
            })
            let curveball = UIAlertAction(title: "Curveball", style: .default, handler: { (UIAlertAction) in
                self.myArray[3][self.myArray[3].count-1] = "cball"
            })
            let changeUp = UIAlertAction(title: "Change-Up", style: .default, handler: { (UIAlertAction) in
                self.myArray[3][self.myArray[3].count-1] = "uball"
            })
            let slider = UIAlertAction(title: "Slider", style: .default, handler: { (UIAlertAction) in
                self.myArray[3][self.myArray[3].count-1] = "sball"
            })
            let seam = UIAlertAction(title: "2 Seam", style: .default, handler: { (UIAlertAction) in
                self.myArray[3][self.myArray[3].count-1] = "2ball"
            })
            let other1 = UIAlertAction(title: "Other 1", style: .default, handler: { (UIAlertAction) in
                self.myArray[3][self.myArray[3].count-1] = "11111"
            })
            let other2 = UIAlertAction(title: "Other 2", style: .default, handler: { (UIAlertAction) in
                self.myArray[3][self.myArray[3].count-1] = "ooooo"
            })
            let other3 = UIAlertAction(title: "Other 3", style: .default, handler: { (UIAlertAction) in
                self.myArray[3][self.myArray[3].count-1] = "33333"
            })
            alert.addAction(fastball)
            alert.addAction(curveball)
            alert.addAction(changeUp)
            alert.addAction(slider)
            alert.addAction(seam)
            alert.addAction(other1)
            alert.addAction(other2)
            alert.addAction(other3)
            present(alert, animated: true, completion: nil)
        } else if sender.tag == 4 {
            
            let alert = UIAlertController(title: "What is the pitch?", message: "", preferredStyle: .alert)
            let fastball = UIAlertAction(title: "Fastball", style: .default, handler: { (UIAlertAction) in
                self.myArray[4][self.myArray[4].count-1] = "fball"
            })
            let curveball = UIAlertAction(title: "Curveball", style: .default, handler: { (UIAlertAction) in
                self.myArray[4][self.myArray[4].count-1] = "cball"
            })
            let changeUp = UIAlertAction(title: "Change-Up", style: .default, handler: { (UIAlertAction) in
                self.myArray[4][self.myArray[4].count-1] = "uball"
            })
            let slider = UIAlertAction(title: "Slider", style: .default, handler: { (UIAlertAction) in
                self.myArray[4][self.myArray[4].count-1] = "sball"
            })
            let seam = UIAlertAction(title: "2 Seam", style: .default, handler: { (UIAlertAction) in
                self.myArray[4][self.myArray[4].count-1] = "2ball"
            })
            let other1 = UIAlertAction(title: "Other 1", style: .default, handler: { (UIAlertAction) in
                self.myArray[4][self.myArray[4].count-1] = "11111"
            })
            let other2 = UIAlertAction(title: "Other 2", style: .default, handler: { (UIAlertAction) in
                self.myArray[4][self.myArray[4].count-1] = "ooooo"
            })
            let other3 = UIAlertAction(title: "Other 3", style: .default, handler: { (UIAlertAction) in
                self.myArray[4][self.myArray[4].count-1] = "33333"
            })
            alert.addAction(fastball)
            alert.addAction(curveball)
            alert.addAction(changeUp)
            alert.addAction(slider)
            alert.addAction(seam)
            alert.addAction(other1)
            alert.addAction(other2)
            alert.addAction(other3)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
  
    
    
        
    
     
        
    
    
    @IBAction func delete0(_ sender: UIButton) {
        myArray.remove(at: 0)
        pitchOutput.text = ""
        sequenceOutput.text = ""
    }
    @IBAction func delete1(_ sender: UIButton) {
        myArray.remove(at: 1)
        pitchOutput2.text = ""
        sequenceOutput2.text = ""
    }
    @IBAction func delete2(_ sender: UIButton) {
        myArray.remove(at: 2)
        pitchOutput3.text = ""
        sequenceOutput3.text = ""
    }
    @IBAction func delete3(_ sender: UIButton) {
        myArray.remove(at: 3)
        pitchOutput4.text = ""
        sequenceOutput4.text = ""
    }
    @IBAction func delete4(_ sender: UIButton) {
        myArray.remove(at: 4)
        pitchOutput5.text = ""
        sequenceOutput5.text = ""
    }
    
    
    
    
    @IBOutlet weak var first0: UILabel!
    @IBOutlet weak var first1: UILabel!
    @IBOutlet weak var first2: UILabel!
    @IBOutlet weak var first3: UILabel!
    @IBOutlet weak var first4: UILabel!
    @IBOutlet weak var indicator0: UILabel!
    @IBOutlet weak var indicator1: UILabel!
    @IBOutlet weak var indicator2: UILabel!
    @IBOutlet weak var indicator3: UILabel!
    @IBOutlet weak var indicator4: UILabel!

    
    func numberInSequence (aaa: [[[String]]], errorFactor: Double) -> [String]{
        var output = [""]
        for i in 0...aaa.count-1 {
            if aaa[i].count != 1 {
                var timesArray = [0.0,0.0,0.0]
                    for j in 1...aaa[i].count-1 {
                        if aaa[i][j].count > 3 {
                            for k in 1...3{
                                let first = aaa[i][1][k]
                                if aaa[i][j][k] == first && j != 1{
                                    timesArray [k-1] += 1.0
                                }
                                
                            }
                        }
                    }
                let newCount = Double(aaa[i].count-1)
                for p in 0...2{
                    if p+1 < aaa[i][1].count - 1{
                    if (timesElsewhere2(spot: p+1, pitch: aaa[i][1][p+1], aaa: aaa, pitchIndex : i) < ((1.0-errorFactor) * newCount)) {
                        if (timesArray[p]+1.0 > (errorFactor * newCount)) {
                            if (i == 0){
                                output.append("pitch \(p+1): \(aaa[i][1][p+1]): fastball")
                            } else if (i == 1){
                                output.append("pitch \(p+1): \(aaa[i][1][p+1]): curveball")
                            } else if (i == 2){
                                output.append("pitch \(p+1): \(aaa[i][1][p+1]): change-up")
                            } else if (i == 3){
                                output.append("pitch \(p+1): \(aaa[i][1][p+1]): slider")
                            } else if (i == 4){
                                output.append("pitch \(p+1): \(aaa[i][1][p+1]): 2-seam")
                            } else if (i == 5){
                                output.append("pitch \(p+1): \(aaa[i][1][p+1]): other 1")
                            } else if (i == 6){
                                output.append("pitch \(p+1): \(aaa[i][1][p+1]): other 2")
                            } else if (i == 7){
                                output.append("pitch \(p+1): \(aaa[i][1][p+1]): other 3")
                            }

                        }
                    }
                    }
                }
            }
        }
        for q in 0...aaa.count - 1{
            var t = 0.0
            if aaa[q].count != 1{
                for w in 1...aaa[q].count - 1{
                    let last = aaa[q][1][(aaa[q][1].count-2)]
                    if aaa[q][w][aaa[q][w].count-2] == last{
                        t += 1.0
                    }
                }
            }
            let newCount = Double(aaa[q].count-1)
            if (t > newCount * errorFactor){

                    if (q == 0){
                        output.append("last sign \(aaa[q][1][aaa[q][1].count-2]): fastball")
                    } else if (q == 1){
                        output.append("last sign \(aaa[q][1][aaa[q][1].count-2]): curveball")
                    } else if (q == 2){
                        output.append("last sign \(aaa[q][1][aaa[q][1].count-2]): change-up")
                    } else if (q == 3){
                        output.append("last sign \(aaa[q][1][aaa[q][1].count-2]): slider")
                    } else if (q == 4){
                        output.append("last sign \(aaa[q][1][aaa[q][1].count-2]): 2-seam")
                    } else if (q == 5){
                        output.append("last sign \(aaa[q][1][aaa[q][1].count-2]): other 1")
                    } else if (q == 6){
                        output.append("last sign \(aaa[q][1][aaa[q][1].count-2]): other 2")
                    } else if (q == 7){
                        output.append("last sign \(aaa[q][1][aaa[q][1].count-2]): other 3")
                    }
            }
        }
        return output
    }
    
    func timesElsewhere2 (spot : Int, pitch : String, aaa: [[[String]]], pitchIndex: Int) -> Double{
        var num = 0.0
        for i in 0...aaa.count - 1{
            if aaa[i].count != 1 {
                for j in 1...aaa[i].count - 1{
                    if aaa[i][j].count > 3{
                    if aaa[i][j][spot] == pitch && i != pitchIndex {
                        num += 1.0
                    }
                }
                }
            }
        }
        return num
    }
    
    func timesElsewhere (first : String, second : String, aaa : [[[String]]], pitchIndex : Int) -> Double{
        var num = 0.0
        for i in 0...aaa.count - 1{
            if i != pitchIndex && aaa[i].count != 1 {
                for j in 1...aaa[i].count - 1{
                    if aaa[i][j].count > 3{
                        for k in 1...aaa[i][j].count-2 {
                            if aaa[i][j][k] == first && aaa[i][j][k+1] == second{
                                num += 1.0
                            }
                        }
                    }
                }
            }
        }
        return num
    }
    
    func findIndicator(aaa : [[[String]]], errorFactor : Double) -> [String]{
        print (aaa)
        var possibles = [""]
        for i in 0...aaa.count-1 {
            if aaa[i].count != 1 {
                for j in 1...aaa[i].count-1 {
                    if aaa[i][j].count > 3{
                    for k in 1...aaa[i][j].count-3 {
                        var timesRepeated = 0.0
                        let pointer = aaa[i][j][k]
                        let next = aaa[i][j][k+1]
                        for l in 1...aaa[i].count-1 {
                            for m in 0...aaa[i][l].count-3 {
                                if pointer == aaa[i][l][m] && next == aaa[i][l][m+1] && l != j {
                                    timesRepeated += 1.0
                                    var newCount = Double()
                                    newCount = Double(aaa[i].count-2)
                                    let times = timesElsewhere(first: pointer, second: next, aaa: aaa, pitchIndex: i)
                                    if (timesRepeated > (errorFactor * newCount)) && (timesRepeated+1 * (1-errorFactor) > times) {
                                        print (times)
                                        print (timesRepeated)
                                        let pitch = aaa[i][1][aaa[i][1].endIndex-1]
                                            if pitch == "fball" {
                                                if !possibles.contains("\(pointer)\(next): Fastball"){
                                                    possibles.append("\(pointer)\(next): Fastball")
                                                }
                                            } else if pitch == "cball"  {
                                                if !possibles.contains("\(pointer)\(next): Curveball"){
                                                    possibles.append("\(pointer)\(next): Curveball")
                                                }
                                            } else if pitch == "sball"  {
                                                if !possibles.contains("\(pointer)\(next): Slider"){
                                                    possibles.append("\(pointer)\(next): Slider")
                                                }
                                            } else if pitch == "uball"  {
                                                if !possibles.contains("\(pointer)\(next): Change-up"){
                                                    possibles.append("\(pointer)\(next): Change-up")
                                                }
                                            } else if pitch == "2ball"  {
                                                if !possibles.contains("\(pointer)\(next): 2-seam"){
                                                    possibles.append("\(pointer)\(next): 2-seam")
                                                }
                                            } else if pitch == "11111"  {
                                                if !possibles.contains("\(pointer)\(next): Other 1"){
                                                    possibles.append("\(pointer)\(next): Other 1")
                                                }
                                            } else if pitch == "ooooo"  {
                                                if !possibles.contains("\(pointer)\(next): Other 2"){
                                                    possibles.append("\(pointer)\(next): Other 2")
                                                }
                                            } else if pitch == "33333"  {
                                                if !possibles.contains("\(pointer)\(next): Other 3"){
                                                    possibles.append("\(pointer)\(next): Other 3")
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                    }
                }
            }
        }
        return (possibles)
    }
    
    
    
    
    
    
    @IBOutlet weak var count: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        
        if segue.identifier == "nextPitch" {            
            let firstVC = segue.destination as! ViewController
            firstVC.array = myArray
            firstVC.count = myCount
            firstVC.strike0 = my0Strike
            firstVC.strike1 = my1Strike
            firstVC.strike2 = my2Strike
            firstVC.ball0 = my0Ball
            firstVC.ball1 = my1Ball
            firstVC.ball2 = my2Ball
            firstVC.ball3 = my3Ball
            firstVC.out0 = my0out
            firstVC.out1 = my1out
            firstVC.out2 = my2out
            firstVC.totalCount0 = myTotalCount0
            firstVC.totalCount1 = myTotalCount1
            firstVC.totalCount2 = myTotalCount2
            firstVC.totalCount3 = myTotalCount3
            firstVC.totalCount4 = myTotalCount4
            firstVC.totalCount5 = myTotalCount5
        }
    }

    @IBAction func clearAll(_ sender: UIButton) {
        let sequenceOutputs = [sequenceOutput, sequenceOutput2,sequenceOutput3,sequenceOutput4,sequenceOutput5 ]
        let pitchOutputs = [pitchOutput, pitchOutput2,pitchOutput3,pitchOutput4,pitchOutput5 ]
        let indicatorOutputs = [indicator0,indicator1,indicator2,indicator3,indicator4]
        let firstOutputs = [first0, first1, first2, first3, first4]
        let countArray = [count1,count2,count3,count4,count5,count6,count7,count8,count9,count10]
        let totalCountArray = [totalCount0,totalCount1,totalCount2,totalCount3,totalCount4,totalCount5]
        let alert = UIAlertController(title: "Are you sure you would like to clear all?", message: "", preferredStyle: .alert)
        
        let clear = UIAlertAction(title: "Clear All", style: .default, handler: { (UIAlertAction) in
                self.myArray = [[""],[""],[""],[""],[""]]
            for i in 0...4{
                sequenceOutputs [i]?.text = ""
                pitchOutputs [i]?.text = ""
                firstOutputs[i]?.text = ""
                totalCountArray[i]?.text = ""
                indicatorOutputs[i]?.text = ""
            }
            for j in 0...9{
                countArray[j]?.text = ""
            }
            self.myCount = [0,0,0]
            self.count.text = ""
            })
        
        alert.addAction(clear)
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (UIAlertAction) in
            
        })
        alert.addAction (cancel)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var pitchOutput: UILabel!
    @IBOutlet weak var pitchOutput2: UILabel!
    @IBOutlet weak var pitchOutput3: UILabel!
    @IBOutlet weak var pitchOutput4: UILabel!
    @IBOutlet weak var pitchOutput5: UILabel!
    @IBOutlet weak var sequenceOutput: UILabel!
    @IBOutlet weak var sequenceOutput2: UILabel!
    @IBOutlet weak var sequenceOutput3: UILabel!
    @IBOutlet weak var sequenceOutput4: UILabel!
    @IBOutlet weak var sequenceOutput5: UILabel!
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

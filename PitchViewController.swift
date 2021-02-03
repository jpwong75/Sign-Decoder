//
//  PitchViewController.swift
//  Sign Decoder
//
//  Created by JP Wong on 7/6/19.
//  Copyright © 2019 JP Wong. All rights reserved.
//

import UIKit


class PitchViewController: UIViewController {

   
    var sequenceType = [String()]
    var arrayType = [[String()]]
    var pitchType = String()
    var countType = [Int(),Int(),Int()]
    var totalCountType0 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCountType1 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCountType2 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCountType3 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCountType4 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var totalCountType5 = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var strike0Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var strike1Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var strike2Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var ball0Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var ball1Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var ball2Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var ball3Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var out0Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var out1Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
    var out2Type = [[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]],[[String()]]]
   
    @IBOutlet weak var count: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        count.text = ("\(countType[0])-\(countType[1]) \(countType[2]) outs")

        // Do any additional setup after loading the view.
    }
    @IBAction func pressPitch(_ sender: UIButton) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        
        if sender.tag == 1{
            if countType [0] < 3{
                countType [0] += 1
            } else {
                countType [0] = 0
                countType [1] = 0
            }
        } else if sender.tag == 2{
            if countType [1] < 2{
                countType[1] += 1
            } else {
                countType [1] = 0
                countType [0] = 0
                if countType[2] < 2{
                    countType [2] += 1
                } else {
                    countType [2] = 0
                }
            }
        } else if sender.tag == 3{
            if countType[1] < 2 {
                countType[1] += 1
            }
            }else if sender.tag == 4{
            let alert = UIAlertController(title: "How many outs are there?", message: "", preferredStyle: .alert)
            
            let opt0 = UIAlertAction(title: "0", style: .default) { (UIAlertAction) in
                self.countType[2] = 0
            }
            let opt1 = UIAlertAction(title: "1", style: .default) { (UIAlertAction) in
                self.countType[2] = 1
            }
            let opt2 = UIAlertAction(title: "2", style: .default) { (UIAlertAction) in
                self.countType[2] = 2
            }
            let opt3 = UIAlertAction(title: "New Inning", style: .default) { (UIAlertAction) in
                self.countType[2] = 0
            }
            alert.addAction(opt0)
            alert.addAction(opt1)
            alert.addAction(opt2)
            alert.addAction(opt3)
            
            present(alert, animated: true, completion: nil)
            countType[0] = 0
            countType[1] = 0
        }
        count.text = ("\(countType[0])-\(countType[1]) \(countType[2]) outs")
    }
    
    func addToCount(spot: Int){
        sequenceType.append(pitchType)
        let total = countType[0] + countType[1]
        if total == 0{
            totalCountType0[spot].append(sequenceType)
        } else if total == 1 {
            totalCountType1[spot].append(sequenceType)
        } else if total == 2 {
            totalCountType2[spot].append(sequenceType)
        } else if total == 3 {
            totalCountType3[spot].append(sequenceType)
        } else if total == 4 {
            totalCountType4[spot].append(sequenceType)
        } else if total == 5 {
            totalCountType5[spot].append(sequenceType)
        }
        
        
        if countType[0] == 0{
            ball0Type[spot].append(sequenceType)
        } else if countType [0] == 1{
            ball1Type[spot].append(sequenceType)
        } else if countType [0] == 2{
            ball2Type[spot].append(sequenceType)
        }else if countType [0] == 3{
            ball3Type[spot].append(sequenceType)
        }
        if countType[1] == 0{
           strike0Type[spot].append(sequenceType)
        } else if countType [1] == 1{
            strike1Type[spot].append(sequenceType)
        } else if countType [1] == 2{
            strike2Type[spot].append(sequenceType)
        }
        if countType[2] == 0{
            out0Type[spot].append(sequenceType)
        } else if countType [2] == 1{
            out1Type[spot].append(sequenceType)
        } else if countType [2] == 2{
            out2Type[spot].append(sequenceType)
        }
    }
    
    
    @IBAction func pressPitchType(_ sender: UIButton) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        
        if sender.tag == 1 {
            pitchType = ("fball")
            pitchLabel.text = ("Fastball")
            addToCount(spot: 0)
        } else if sender.tag == 2 {
            pitchType = ("cball")
            pitchLabel.text = ("Curveball")
            addToCount(spot: 1)
        } else if sender.tag == 3 {
            pitchType = ("uball")
            pitchLabel.text = ("Change-up")
            addToCount(spot: 2)
        } else if sender.tag == 4 {
            pitchType = ("sball")
            pitchLabel.text = ("Slider")
            addToCount(spot: 3)
        } else if sender.tag == 5 {
            pitchType = ("2ball")
            pitchLabel.text = ("2-seam")
            addToCount(spot: 4)
        } else if sender.tag == 6 {
            pitchType = ("11111")
            pitchLabel.text = ("Other 1")
            addToCount(spot: 5)
        } else if sender.tag == 7 {
            pitchType = ("ooooo")
            pitchLabel.text = ("Other 2")
            addToCount(spot: 6)
        } else if sender.tag == 8 {
            pitchType = ("33333")
            pitchLabel.text = ("Other 3")
            addToCount(spot: 7)
        }
        
        
    }
    
   
    @IBAction func deletePitch(_ sender: UIButton) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        
        pitchType = ""
        pitchLabel.text = "Pitch"
    }
    
    @IBOutlet weak var pitchLabel: UILabel!
    
    @IBAction func next(_ sender: UIButton) {
        let gen = UIImpactFeedbackGenerator()
        gen.impactOccurred()
        if pitchType != ""{
            performSegue(withIdentifier: "moveToData", sender: self)
        } else {
            let alert = UIAlertController(title: "What is the pitch?", message: "", preferredStyle: .alert)
            let fastball = UIAlertAction(title: "Fastball", style: .default, handler: { (UIAlertAction) in
                self.pitchType = ("fball")
                self.pitchLabel.text = ("Fastball")
                self.addToCount(spot: 0)
            })
            
            let curveball = UIAlertAction(title: "Curveball", style: .default, handler: { (UIAlertAction) in
                self.pitchType = ("cball")
                self.pitchLabel.text = ("Curveball")
                self.addToCount(spot: 1)
            })
            
            let changeUp = UIAlertAction(title: "Change-Up", style: .default, handler: { (UIAlertAction) in
                self.pitchType = ("uball")
                self.pitchLabel.text = ("Change-up")
                self.addToCount(spot: 2)
            })
            let slider = UIAlertAction(title: "Slider", style: .default, handler: { (UIAlertAction) in
                self.pitchType = ("sball")
                self.pitchLabel.text = ("Slider")
                self.addToCount(spot: 3)
            })
            let seam = UIAlertAction(title: "2 Seam", style: .default, handler: { (UIAlertAction) in
                self.pitchType = ("2ball")
                self.pitchLabel.text = ("2-seam")
                self.addToCount(spot: 4)
                
            })
            let other1 = UIAlertAction(title: "Other 1", style: .default, handler: { (UIAlertAction) in
                self.pitchType = ("11111")
                self.pitchLabel.text = ("Other 1")
                self.addToCount(spot: 5)
                
            })
            let other2 = UIAlertAction(title: "Other 2", style: .default, handler: { (UIAlertAction) in
                self.pitchType = ("ooooo")
                self.pitchLabel.text = ("Other 2")
                self.addToCount(spot: 6)
                
            })
            let other3 = UIAlertAction(title: "Other 3", style: .default, handler: { (UIAlertAction) in
                self.pitchType = ("33333")
                self.pitchLabel.text = ("Other 3")
                self.addToCount(spot: 7)
                
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToData" {
            
            
            
            arrayType[0].append(pitchType)
            
            let thirdVC = segue.destination as! DataViewController
            thirdVC.myArray = arrayType
            thirdVC.myCount = countType
            thirdVC.my0Strike = strike0Type
            thirdVC.my1Strike = strike1Type
            thirdVC.my2Strike = strike2Type
            thirdVC.my0Ball = ball0Type
            thirdVC.my1Ball = ball1Type
            thirdVC.my2Ball = ball2Type
            thirdVC.my3Ball = ball3Type
            thirdVC.my0out  = out0Type
            thirdVC.my1out  = out1Type
            thirdVC.my2out  = out2Type
            thirdVC.myTotalCount0 = totalCountType0
            thirdVC.myTotalCount1 = totalCountType1
            thirdVC.myTotalCount2 = totalCountType2
            thirdVC.myTotalCount3 = totalCountType3
            thirdVC.myTotalCount4 = totalCountType4
            thirdVC.myTotalCount5 = totalCountType5
            
            
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

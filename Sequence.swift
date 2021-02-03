//
//  Sequence.swift
//  Sign Decoder
//
//  Created by JP Wong on 7/5/19.
//  Copyright © 2019 JP Wong. All rights reserved.
//

import Foundation
class Sequence{
    var signs = [String]()
    var pitch = String()

    init(mySigns : [String], myType : String){
        pitch = myType
        signs = mySigns
    }
}

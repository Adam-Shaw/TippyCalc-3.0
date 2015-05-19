//
//  Tipper.swift
//  TippyCalc 3.0
//
//  Created by Adam Shaw on 5/19/15.
//  Copyright (c) 2015 Adam Shaw. All rights reserved.
//

import Cocoa

class Tipper {
    let subtotal: Double
    let taxRate: Double
    let preTip: Double
    let service: Int
    var tipRate: Double
    
    init (subtotal:Double,taxRate:Double,service:Int) {
        self.subtotal=subtotal
        self.taxRate=taxRate
        self.preTip=subtotal/(1+taxRate)
        self.service=service
        self.tipRate=0.0
    }
    
    func findOptimumTipRate() {
        switch self.service {
        case 0:
            self.tipRate=0.05
        case 1:
            self.tipRate=0.1
        case 2:
            self.tipRate=0.15
        case 3:
            self.tipRate=0.18
        case 4:
            self.tipRate=0.2
        default: break
        }
    }
    
    func findTipRate() -> String {
        self.findOptimumTipRate()
        let tipCost: Double = self.tipRate*self.preTip
        let tipString: NSString = NSString(format: "%.2f", tipCost)
        let newTotalString: NSString = NSString(format: "%.2f", self.subtotal+tipCost)
        var tipCalcResults: String = "Tip Rate of \(self.tipRate): $\(tipString) \n" + "Your new Total is $\(newTotalString)"
        return tipCalcResults
    }
    
}

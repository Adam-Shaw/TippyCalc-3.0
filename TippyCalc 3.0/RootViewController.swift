//
//  RootViewController.swift
//  TippyCalc 3.0
//
//  Created by Adam Shaw on 5/19/15.
//  Copyright (c) 2015 Adam Shaw. All rights reserved.
//

import Cocoa

class RootViewController: NSViewController {
   
    @IBOutlet weak var subTotalTextLabel: NSTextField!
    @IBOutlet weak var subTotalTextField: NSTextField!
    
    @IBOutlet weak var taxRateTextLabel: NSTextField!
    @IBOutlet weak var taxRateTextField: NSTextField!
    
    @IBOutlet weak var serviceTextLabel: NSTextField!
    @IBOutlet weak var servicePopUpButton: NSPopUpButton!
    
    @IBOutlet weak var programExecutionButton: NSButton!
    @IBAction func executeTipperProgram(sender: AnyObject) {
        var subtotal: Double=subTotalTextField.stringValue.toDouble()
        var taxRate: Double=taxRateTextField.stringValue.toDouble()
        let maxIndex: Int=serviceIndicators.count-1
        let service: Int=maxIndex-servicePopUpButton.indexOfSelectedItem
        let newTipCalc: Tipper = Tipper(subtotal: subtotal ,taxRate: taxRate, service: service)
        resultsTextField.stringValue = newTipCalc.findTipRate()
    }
    
    @IBOutlet weak var resultsTextField: NSTextField!
    
    var serviceIndicators = ["Excellent","Good","Fair","Poor","Terrible"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func awakeFromNib() {
        subTotalTextField.stringValue = "20.00"
        taxRateTextField.stringValue = "0.10"
        serviceTextLabel.textColor=NSColor.yellowColor()
        subTotalTextLabel.textColor=NSColor.yellowColor()
        taxRateTextLabel.textColor=NSColor.yellowColor()
        servicePopUpButton.removeAllItems()
        servicePopUpButton.addItemsWithTitles(serviceIndicators)

    }
    
}

extension String {
    func toDouble() -> Double {
        return NSString(string: self).doubleValue
    }
    
}


//
//  InterfaceController.swift
//  Activity2 WatchKit Extension
//
//  Created by Manpreet Kaur Gill on 2019-06-28.
//  Copyright © 2019 Manpreet Kaur Gill. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    // MARK:  Outlets
    
    @IBOutlet weak var outputLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("--- WATCH APP IS LOADED!")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    
    // Exercise #2: Change the label
    var labelSaysHello = true
    
    @IBAction func watchButtonPressed() {
        
        // 1. output to console
        print("-- WATCH: Button Pressed")
        
        if (labelSaysHello == true) {
            // change to GOODBYE
            self.outputLabel.setText("GOODBYE")
            self.labelSaysHello = false;
        }
        else if (labelSaysHello == false) {
            // change to GOODBYE
            self.outputLabel.setText("HELLO")
            self.labelSaysHello = true
        }
        
    }
    
    
    
}

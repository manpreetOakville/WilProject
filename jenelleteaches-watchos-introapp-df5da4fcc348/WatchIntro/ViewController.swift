//
//  ViewController.swift
//  WatchIntro
//
//  Created by MacStudent on 2019-06-18.
//  Copyright © 2019 rabbit. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    
    
    // MARK: WCSessionDelegate Functions
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    

    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if the phone supports WCSession
        // Need WCSession to communicate with a watch
        if (WCSession.isSupported()) {
            print("PHONE: Yes phone supports SESSION!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            print("PHONE: Phone does NOT support SESSION")
        }
    }


    @IBAction func buttonPressed(_ sender: Any) {
        // 1. output to console
        print("+HELLO! YOU PUSHED THE BUTTON!")
        // 2. output to label
        self.outputLabel.text = "Button pressed!"
        
        // -------
        // check if the watch is paired / accessible
        if (WCSession.default.isReachable) {
            print("PHONE: Phone found the watch")
            // construct the message you want to send
            // the message is in dictionary
            let message = [
                "name": "jenelle"
            ]
            
            /* Same as doing this in Javascript
            var person = {
                "name":"jenelle",
                "program":"madt"
            }
            */
 
            // send the message to the watch
            WCSession.default.sendMessage(message, replyHandler: nil)
            
            print("PHONE: Sent the data!")
            self.outputLabel.text = "Message Sent"
        }
        else {
            print("PHONE: Cannot find the watch")
            self.outputLabel.text = "ERROR: Cannot find watch"
        }
        
    }
}


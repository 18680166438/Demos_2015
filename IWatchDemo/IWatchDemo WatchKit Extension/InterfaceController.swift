//
//  InterfaceController.swift
//  IWatchDemo WatchKit Extension
//
//  Created by wanshaofa on 15/3/12.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var sl: WKInterfaceSlider!
    @IBOutlet weak var sw: WKInterfaceSwitch!
    @IBOutlet weak var imgView: WKInterfaceImage!
    @IBOutlet weak var de: WKInterfaceDate!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

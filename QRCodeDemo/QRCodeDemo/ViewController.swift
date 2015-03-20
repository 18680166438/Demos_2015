//
//  ViewController.swift
//  QRCodeDemo
//
//  Created by wanshaofa on 15/2/4.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


    @IBAction func buttonAction(sender: UIButton) {
        var qr:QRViewController = QRViewController()
        self.presentViewController(qr, animated: true, completion: nil)
    }
}


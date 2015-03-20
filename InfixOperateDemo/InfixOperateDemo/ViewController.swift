//
//  ViewController.swift
//  InfixOperateDemo
//
//  Created by wanshaofa on 15/2/4.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let firstVector = 2
        let secondVector = 3
        let plusMinusVector = firstVector +*- secondVector
        
        NSLog("%d", plusMinusVector)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
//    infix operator + { associativity left precedence 140 }
//    func + (left:Int,right:Int){
//    
//    }

}


infix operator +*- { associativity left precedence 140 }
func +*- (left: Int, right: Int) -> Int {
    return (left + right ) * (left - right)
}
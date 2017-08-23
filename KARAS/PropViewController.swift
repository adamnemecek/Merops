//
//  PropViewController.swift
//  KARAS
//
//  Created by sumioka-air on 2017/05/03.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import Cocoa

private extension Selector {
    static let buttonTapped = #selector(PropViewController.hideView)
}

class PropViewController: SuperViewController {
    
    @IBOutlet weak var v : PropView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func scninit() {
        let btn = NSButton(checkboxWithTitle: "btn", target: self, action: Selector.buttonTapped)
        v.addSubview(btn)
    }
    
    func hideView() {
        v.isHidden = true
    }
}

//
//  ConsoleViewController.swift
//  KARAS
//
//  Created by sumioka-air on 2017/05/03.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import Cocoa

class ConsoleViewController: NSViewController {

    @IBOutlet weak var v: NSView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tf = NSTextView()
        tf.string = "hello"
        self.view.addSubview(tf)

        let iv = NSImageView()
//        iv.image = NSImage(contentsOf: URL(""))
        self.view.addSubview(iv)
    }

}

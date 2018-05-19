//
//  GameViewMixin.swift
//  KARAS
//
//  Created by sumioka-air on 2018/01/06.
//  Copyright © 2018年 sho sumioka. All rights reserved.
//

import Cocoa

class ExportDialog: View {

}

class SettingDialog: View {

}

final class ConsoleView: View {
    let textview = NSTextField()
    
    init () {
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textview.frame = frame
        setup()
//        var setting = Settings()
//        setting.double = 1
    }
    
    func pipe() {}
    
    func show() {}
    
    private func setup() {
        textview.backgroundColor = Color.black.withAlphaComponent(0.1)
        self.addSubview(textview)
//        textview.insertText("AAA")
    }
    
    private func drawRect(dirtyRect: NSRect) {
//        [[NSColor colorWithDeviceWhite:0.0 alpha:0.75] set];
//        NSRectFillUsingOperation(dirtyRect, NSCompositeSourceOver);
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameViewController : NSTextViewDelegate {
    
    func textDidChange(notification: NSNotification) {
        // ここで変更された NSTextView を受け取れます。
        let textView = notification.object as! NSTextView
    }
}

//
//  USDcmd.swift
//  KARAS
//
//  Created by sumioka-air on 2017/08/12.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import Cocoa

func stdOutOfCommand(cmd: String, arguments args: [String], currentDirPath currentDir: String? = nil) -> String {
    let task: Process = Process()
    task.launchPath = cmd
    task.arguments = args
    if currentDir != nil {
        task.currentDirectoryPath = currentDir!
    }
    let pipe: Pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    let out: NSData = pipe.fileHandleForReading.readDataToEndOfFile() as NSData
    let outStr: String? = NSString(data: out as Data, encoding: String.Encoding.utf8.rawValue) as? String
    return outStr == nil ? "" : outStr!
}

//var ret = stdOutOfCommand(cmd: "/USD/bin/usdcat", arguments: ["/Users/sumioka_air/Documents/ModelIO-Export/model.usd"])


//xcrun scntool --convert cube.usda --format scn --output cube.scn

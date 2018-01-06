//
//  USDcmd.swift
//  KARAS
//
//  Created by sumioka-air on 2017/08/12.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import Cocoa

let rpath = NSHomeDirectory()


private func stdOutOfCommand(cmd: String, arguments args: [String],
                     currentDirPath currentDir: String? = nil) -> String
{
    print(rpath)
    let task: Process = Process()
    task.environment = [
        "PATH" : rpath + "/USD/bin;/Users/sumioka_air/Documents/KARAS/USD/lib;",
        "PYTHONPATH" : rpath + "/USD/lib/python"
    ]
    task.launchPath = cmd
    task.arguments = args
    if currentDir != nil {
        task.currentDirectoryPath = currentDir!
    }
    let pipe: Pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    let out: NSData = pipe.fileHandleForReading.readDataToEndOfFile() as NSData
    let outStr: String? = NSString(data: out as Data, encoding: String.Encoding.utf8.rawValue) as String?
    return outStr == nil ? "" : outStr!
}

func USDCat(infile : String, outfile : String) {
    let ret = stdOutOfCommand(
        cmd: rpath + "/USD/bin/usdcat", arguments: [infile, outfile]
    )
    print (ret)
}

func USDEdit(infile : String) {
    let ret = stdOutOfCommand(
        cmd: rpath + "/USD/bin/usdedit", arguments: [infile]
    )
    print(ret)
}

//xcrun scntool --convert cube.usda --format scn --output cube.scn

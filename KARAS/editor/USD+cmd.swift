//
//  USD+cmd.swift
//  KARAS
//
//  Created by sumioka-air on 2017/08/12.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import Cocoa

private let rpath = "/Users/sumioka_air/Documents/KARAS" //NSHomeDirectory()

func USDStitch(out: String, files: String...) {
    if FileManager.default.fileExists(atPath: out) {
        do {
            try FileManager.default.removeItem(atPath: out)
        } catch {

        }
    }

    let ret = stdOutOfCommand(
            cmd: rpath + "/USD/bin/usdstitch",
            arguments: ["--out", out, files.joined(separator: " ")]
    )
    print(ret)
}

func USDDiff(file1: String, file2: String) {
    let ret = stdOutOfCommand(
            cmd: rpath + "/USD/bin/usddiff", arguments: [file1, file2]
    )
    print(ret)
}

func USDCat(infile: String, outfile: String) {
    let ret = stdOutOfCommand(
            cmd: rpath + "/USD/bin/usdcat", arguments: [
        infile, "--out", outfile, "-f", "--usdFormat", "usda"
    ]
    )
    print(ret)
}

func USDEdit(infile: String) {
    do {
        let text = try String(contentsOfFile: infile, encoding: String.Encoding.utf8)
        print(text)

    } catch {
        //エラー処理
    }

//    let ret = stdOutOfCommand(
//        cmd: rpath + "/USD/bin/usdedit", arguments: [infile]
//    )
//    print(ret)
}

private func stdOutOfCommand(cmd: String, arguments args: [String],
                             currentDirPath currentDir: String? = nil) -> String {
    let task: Process = Process()
    task.environment = [
        "PATH": rpath + "/USD/bin;/USD/lib;",
        "PYTHONPATH": rpath + "/USD/lib/python"
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
    let outStr = NSString(data: out as Data, encoding: String.Encoding.utf8.rawValue)
    return outStr == nil
            ? ""
            : cmd + " " + args.joined(separator: " ") + "\n" + (outStr! as String)
}

//xcrun scntool --convert cube.usda --format scn --output cube.scn

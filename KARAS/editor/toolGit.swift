//
//  GITobject.swift
//  TUBAME
//
//  Created by sumioka-air on 2017/03/26.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//
import Cocoa
import ObjectiveGit

func gitInit(url: String) {
    let _url = "/Users/sumioka_air/Documents/_res/KARASExport"
    do {
        let g = try GTRepository.init(url: URL(fileURLWithPath: _url))
    } catch {
        print("error")
    }
}

func gitClone(url: String) {
    do {
        try GTRepository.clone(from: URL(fileURLWithPath: url), toWorkingDirectory: URL(fileURLWithPath:""), options: nil, transferProgressBlock: nil)
    } catch {
        
    }
}

func gitCommit(url: URL) {
    
}

func gitRevert() {
    
}

func gitMerge() {
    
}

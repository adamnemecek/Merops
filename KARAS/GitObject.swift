//
//  GITobject.swift
//  TUBAME
//
//  Created by sumioka-air on 2017/03/26.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import Cocoa

import SwiftGit2
import Result


func gitInit(url: URL) {
    let URL: NSURL = NSURL(string: url.absoluteString)!
    let repo = Repository.at(URL as URL)
    if let repo = repo.value {
        let latestCommit: Result<Commit, NSError> = repo
                .HEAD()
                .flatMap {
                    repo.commit($0.oid)
                }
        if let commit = latestCommit.value {
            print("Latest Commit: \(commit.message) by \(commit.author.name)")
        } else {
            print("Could not get commit: \(String(describing: latestCommit.error))")
        }
    } else {
        print("Could not repository: \(String(describing: repo.error))")
    }
}

func gitClone(url: URL) {
    Repository.clone(from: url as URL, to: "/".url!)
}

func gitCommit(url: URL) {
    
}

func gitRevert() {

}

func gitMerge() {
    
}

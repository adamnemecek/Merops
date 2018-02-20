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
    do {
        try GTRepository.initializeEmpty(atFileURL: URL(fileURLWithPath: url), options: nil)
    } catch {
        print(error)
    }
}

func gitClone(url: String, dir: String ) {
    do {
        try GTRepository.clone(from: URL(string: url)!,
                               toWorkingDirectory: URL(fileURLWithPath: dir),
                               options: nil, transferProgressBlock: nil)
    } catch {
        print(error)
    }
}

func anyClone(url: String, dir: String) {
    gitInit(url: dir)
//    URL(string: url)
}

func gitStatus(url: String) {
    do {
        let manager = FileManager.default
        let list = try manager.contentsOfDirectory(atPath: url)
        try list.forEach {
            if ($0.hasPrefix(".git") == false) {
                let status = try GTRepository(url: URL(fileURLWithPath: url))
                    .status(forFile: $0, success: nil, error: nil)
                print(status)
            }
        }
    } catch {
        print(error)
    }
}

func gitBranch(url: String) {
    do {
        let repo = try GTRepository(url: URL(fileURLWithPath: url))
        try print (repo.currentBranch())
        try repo.branches().forEach {
            print($0.name!, $0.shortName!, $0.repository)
        }
    } catch {
        print(error)
    }
}

func gitCommit(url: String, msg: String = "update") {
    let _url = URL(fileURLWithPath: url).deletingLastPathComponent()
    do {
        let repo = try GTRepository.init(url: _url, flags: 0, ceilingDirs: [])
        let index = try repo.index()
//        let parents = [targetCommit, fromCommit].flatMap{
//            GTCommit(obj: $0.commit, in: repo)
//        }
        let tree = try index.writeTree()
//        try repo.createCommit(with: tree, message: msg, parents: parents, updatingReferenceNamed: "HEAD")
        
    } catch {
        print(error)
    }
}

func gitDiff(url: String) {
    do {
        let repo = try GTRepository(url: URL(fileURLWithPath: url))
        let diff = try GTDiff(workingDirectoryToHEADIn: repo, options: nil)
        diff.enumerateDeltas({ delta, _ in
            print(delta.oldFile.path, delta.newFile.path)
        })
    } catch {
        print (error)
    }
}

func gitRevert(url: String) {
    do {
        let repo = try GTRepository(url: URL(fileURLWithPath: url))
        let commits = try repo.localCommitsRelative(toRemoteBranch: repo.currentBranch())
        for com in commits {
            git_revert(repo.git_repository(), com.git_commit(), nil)
        }
    } catch {
        print (error)
    }
    
}

func gitMerge(url: String) {
    do {
        let repo = try GTRepository(url: URL(fileURLWithPath: url))
        try repo.mergeBranch(intoCurrentBranch: repo.currentBranch())
    } catch {
        print (error)
    }
}

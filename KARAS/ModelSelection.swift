//
//  ModelSelection.swift
//  KARAS
//
//  Created by sumioka-air on 2017/05/03.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import SceneKit

class Selection : SCNNode {
    
    static let sharedManager = Selection()
    private override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var _items: [String] = [""]
    
    var items : [String] {
        
        get{
            return self._items
        }
        
        set(p){
            self._items.append(contentsOf: p)
        }
    }
    
    func clear(){
        self._items.removeAll()
    }
}

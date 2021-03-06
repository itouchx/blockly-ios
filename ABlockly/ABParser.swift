//
//  Actor.swift
//  XMLParser
//
//  Created by WG on 2017/8/23.
//  Copyright © 2017年 WG. All rights reserved.
//

import Foundation
public class ABParser: NSObject {
    let funtions:[XMLNode]
    let trunk:XMLNode
    let branches:[XMLNode]
    init?(_ xml:String) {
        guard let root = XMLNode.node(xml) else{return nil}
        root.forEach{
            if $0.name == "shadow"{
                $0.name = "block"
            }else if $0.attributes["type"] == "procedures_callnoreturn"{
                let n = XMLNode()
                n.name = "field"
                n.attributes["name"] = "NAME"
                n.value = $0["mutation[name]"]?.attributes["name"] ?? ""
                n.parent = $0
                $0.children.append(n)
            }
        }
        
        var f = [XMLNode]()
        var t:XMLNode? = nil
        var b = [XMLNode]()
        root.children.forEach{
            switch $0.attributes["type"] ?? ""{
            case "start":
                t = $0
            case "procedures_defnoreturn":
                f.append($0)
            case let x where x.hasPrefix("start"):
                b.append($0)
            default:
                Void()
            }
        }
        guard let tt = t else{ return nil }
        trunk = tt
        funtions = f
        branches = b
        super.init()
    }
}

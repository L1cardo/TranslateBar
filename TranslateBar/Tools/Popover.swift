//
//  Popover.swift
//  OneClick
//
//  Created by Licardo on 2019/12/20.
//  Copyright © 2019 Licardo. All rights reserved.
//

import Cocoa

class Popover {
    fileprivate class var appDelegate: AppDelegate {
        return NSApplication.shared.delegate as! AppDelegate
    }
    
    class func toggle() {
        if appDelegate.popover.isShown {
            close()
        } else {
            show()
        }
    }
    
    class func close() {
        guard appDelegate.popover.isShown else { return }
        appDelegate.popover.close()
    }
    
    class func show() {
        guard let button = appDelegate.statusBarItem.button else { return }
        appDelegate.popover.show(relativeTo: button.frame, of: button, preferredEdge: .minY)
    }
}

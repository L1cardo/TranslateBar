//
//  PreferencesWindowController.swift
//  TranslateBar
//
//  Created by Licardo on 2019/12/21.
//  Copyright © 2019 Licardo. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
}

extension PreferencesWindowController: NSWindowDelegate {
    
    func windowWillBeginSheet(_ notification: Notification) {
    }
    
    func windowWillClose(_ notification: Notification) {
        // 关闭偏好设置时在去掉 Dock 栏显示应用图标
        NSApp.setActivationPolicy(.accessory)
    }
}

//
//  AppDelegate.swift
//  TranslateBar
//
//  Created by Licardo on 2019/12/21.
//  Copyright © 2019 Licardo. All rights reserved.
//

import Cocoa
import MASShortcut
import Defaults

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var statusBarMenu: NSMenu!
    
    let statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let popover = NSPopover()
    var eventMonitor: EventMonitor?
    lazy var preferencesWindowController: PreferencesWindowController = {
        let storyboard = NSStoryboard(name: "Preferences", bundle: nil)
        return storyboard.instantiateInitialController() as! PreferencesWindowController
    }()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        // status bar menu
        setUpStatusBarItem()
        
        setUpPopoverEvent()
        
        setUpStatusBarMenu()
        
        MASShortcutBinder.shared()?.bindShortcut(withDefaultsKey: "TranslateBarShortcut", toAction: Popover.toggle)
        
        Defaults[.TranslateSourceChanged] = true

    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func setUpStatusBarMenu() {
        let mainViewController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "popover") as! TranslateViewController
        popover.contentViewController = mainViewController
    }
    
    // set up status item
    func setUpStatusBarItem() {
        guard let button = statusBarItem.button else { return }
        button.image = NSImage(named: "StatusBarIcon")
        button.action = #selector(statusBarMenuClicked)
        button.sendAction(on: [.leftMouseUp, .rightMouseUp])
    }
    
    @objc func statusBarMenuClicked() {
        let event = NSApp.currentEvent!
        if event.type == .leftMouseUp {
            Popover.toggle()
        } else if event.type == .rightMouseUp {
            statusBarItem.menu = statusBarMenu
            statusBarItem.button?.performClick(self)
            statusBarItem.menu = nil
        }
    }
    
    func setUpPopoverEvent() {
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            if let popover = self?.popover {
                if popover.isShown {
                    Popover.close()
                }
            }
        }
        eventMonitor?.start()
    }
    
    @IBAction func didClickMenuItem(_ sender: NSMenuItem) {
        switch sender.tag {
        case 0:
            let preferencesWindowController = (NSApplication.shared.delegate as? AppDelegate)?.preferencesWindowController
            preferencesWindowController?.showWindow(sender)
            // 将应用界面浮到最上层
            NSApp.activate(ignoringOtherApps: true)
            preferencesWindowController?.window?.makeKeyAndOrderFront(preferencesWindowController)
        case 1:
            NSApplication.shared.terminate(self)
        default:
            return
        }
    }
    
}


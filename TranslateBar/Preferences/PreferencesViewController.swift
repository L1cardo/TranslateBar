//
//  PreferencesViewController.swift
//  TranslateBar
//
//  Created by Licardo on 2019/12/21.
//  Copyright © 2019 Licardo. All rights reserved.
//

import Cocoa
import MASShortcut
import LoginServiceKit

class PreferencesViewController: NSViewController {
    
    static let shared = PreferencesViewController()
    
    @IBOutlet weak var versionLabel: NSTextField!
    @IBOutlet weak var loginServerCheckbox: NSButton!
    @IBOutlet weak var shortcut: MASShortcutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let versionObject = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        versionLabel.stringValue = versionObject as! String
        
        shortcut.associatedUserDefaultsKey = "TranslateBarShortcut"
    }
    
    override func viewWillAppear() {
        updateCheckboxState()
    }
    
    @IBAction func didChangeloginServer(_ sender: NSButton) {
        switch sender.state {
        case .on:
            LoginServiceKit.addLoginItems()
        case .off:
            LoginServiceKit.removeLoginItems()
        default:
            return
        }
    }
    
    func updateCheckboxState() {
        if LoginServiceKit.isExistLoginItems() {
            loginServerCheckbox.state = .on
        } else {
            loginServerCheckbox.state = .off
        }
    }
    
    @IBAction func didClickLicardo(_ sender: NSButton) {
        let url = URL(string: "https://github.com/L1cardo")
        NSWorkspace.shared.open(url!)
    }
}

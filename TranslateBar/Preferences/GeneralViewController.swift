//
//  GeneralViewController.swift
//  TranslateBar
//
//  Created by Licardo on 2019/12/21.
//  Copyright © 2019 Licardo. All rights reserved.
//

import Cocoa
import MASShortcut
import LoginServiceKit
import Defaults

class GeneralViewController: PreferencesViewController {
    
    @IBOutlet weak var loginServerCheckbox: NSButton!
    @IBOutlet weak var shortcut: MASShortcutView!
    @IBOutlet weak var tranlateSource: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
        shortcut.associatedUserDefaultsKey = "TranslateBarShortcut"

    }
    

    override func viewWillAppear() {
        super.viewWillAppear()
        
        //updateCheckboxState()
        updateCheckboxState()
        setTranslateSourceDefaultValue()
    }
    
    func updateCheckboxState() {
        if LoginServiceKit.isExistLoginItems() {
            loginServerCheckbox.state = .on
        } else {
            loginServerCheckbox.state = .off
        }
    }
    
    func setTranslateSourceDefaultValue() {
        switch Defaults[.translateSource] {
        case 0:
            tranlateSource.selectItem(withTag: 0)
        case 1:
            tranlateSource.selectItem(withTag: 1)
        case 2:
            tranlateSource.selectItem(withTag: 2)
        case 3:
            tranlateSource.selectItem(withTag: 3)
        case 4:
            tranlateSource.selectItem(withTag: 4)
        case 5:
            tranlateSource.selectItem(withTag: 5)
        default:
            return
        }
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
    
    @IBAction func didChangeTranslateSource(_ sender: NSPopUpButton) {
        Popover.close()
        Defaults[.TranslateSourceChanged] = true
        switch sender.indexOfSelectedItem {
        case 0:
            Defaults[.translateSource] = 0
        case 1:
            Defaults[.translateSource] = 1
        case 2:
            Defaults[.translateSource] = 2
        case 3:
            Defaults[.translateSource] = 3
        case 4:
            Defaults[.translateSource] = 4
        case 5:
            Defaults[.translateSource] = 5
        default:
            return
        }
    }
}

extension Defaults.Keys {
    static let translateSource = Key<Int>("translateSource", default: 0)
    static let TranslateSourceChanged = Key<Bool>("TranslateSourceChanged", default: true)
}

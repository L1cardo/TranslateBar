//
//  AboutViewController.swift
//  TranslateBar
//
//  Created by Licardo on 2020/3/7.
//  Copyright © 2020 Licardo. All rights reserved.
//

import Cocoa

class AboutViewController: PreferencesViewController {

    @IBOutlet weak var versionLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let versionObject = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        versionLabel.stringValue = versionObject as! String
    }
    
    @IBAction func didClickURL(_ sender: NSButton) {
        let url: String
        switch sender.tag {
        case 1:
            url = "https://github.com/L1cardo"
        case 2:
            url = "https://licardo.cn"
        case 3:
            url = "https://twitter.com/AlbertAbdilim"
        case 41:
            url = "https://paypal.me/mrlicardo"
        case 42:
            url = "https://raw.githubusercontent.com/L1cardo/Image-Hosting/master/donate/alipay.jpg"
        case 43:
            url = "https://raw.githubusercontent.com/L1cardo/Image-Hosting/master/donate/wechat.jpg"
        case 5:
            url = "mailto:albert.abdilim@foxmail.com"
        default:
            return
        }
        NSWorkspace.shared.open(URL(string: url)!)
    }
}

class LinkButton: NSButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func resetCursorRects() {
        addCursorRect(self.bounds, cursor: .pointingHand)
    }
}

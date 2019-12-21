//
//  TranslateViewController.swift
//  TranslateBar
//
//  Created by Licardo on 2019/12/21.
//  Copyright © 2019 Licardo. All rights reserved.
//

import Cocoa
import WebKit

class TranslateViewController: NSViewController {
    
    @IBOutlet var translateView: WKWebView!
    
    var urlLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        if (!urlLoaded) {
            urlLoaded = true
            let url = URL(string: "https://translate.google.cn/")
            let urlRequest = URLRequest(url: url!)
            translateView.load(urlRequest)
        }
    }
    
}

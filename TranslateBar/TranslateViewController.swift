//
//  TranslateViewController.swift
//  TranslateBar
//
//  Created by Licardo on 2019/12/21.
//  Copyright © 2019 Licardo. All rights reserved.
//

import Cocoa
import WebKit
import Defaults

class TranslateViewController: NSViewController {
    
    @IBOutlet var translateView: WKWebView!
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        if Defaults[.TranslateSourceChanged] == true {
            Defaults[.TranslateSourceChanged] = false
            
            switch Defaults[.translateSource] {
            case 0:
                url = URL(string: "https://translate.google.cn/")
            case 1:
                url = URL(string: "https://translate.google.com/")
            case 2:
                url = URL(string: "http://fanyi.youdao.com/")
            case 3:
                url = URL(string: "https://fanyi.qq.com")
            case 4:
                url = URL(string: "https://fanyi.baidu.com")
            default:
                return
            }
            
            let urlRequest = URLRequest(url: url!)
            translateView.load(urlRequest)
        }
    }
}

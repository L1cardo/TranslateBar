//
//  PreferencesViewController.swift
//  TranslateBar
//
//  Created by Licardo on 2020/3/7.
//  Copyright © 2020 Licardo. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {

    let isKeepingWindowCentered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.

        self.preferredContentSize = NSMakeSize(self.view.frame.size.width, self.view.frame.size.height)

    }

    override func viewDidAppear() {
        super.viewDidAppear()
        // 打开偏好设置时在 Dock 栏显示应用图标，方便用户再次返回设置界面
        if NSApp.activationPolicy() == .accessory {
            NSApp.setActivationPolicy(.regular)
        }

        // MARK: 偏好设置tab切换动画
        self.setWindowFrame()
    }
    

    func setWindowFrame() {
        if let window = self.view.window {
            NSAnimationContext.runAnimationGroup({ context in
                context.allowsImplicitAnimation = true
                context.duration = 0.25
                context.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)


                let contentSize = self.view.fittingSize

                let newWindowSize = window.frameRect(forContentRect: CGRect(origin: .zero, size: contentSize)).size

                var frame = window.frame
                frame.origin.y += frame.height - newWindowSize.height
                frame.size = newWindowSize

                if isKeepingWindowCentered {
                    let horizontalDiff = (window.frame.width - newWindowSize.width) / 2
                    frame.origin.x += horizontalDiff
                }

                window.animator().setFrame(frame, display: false)

            }, completionHandler: nil)

        }
    }

}


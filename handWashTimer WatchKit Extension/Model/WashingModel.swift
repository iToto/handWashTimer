//
//  washingModel.swift
//  handWashTimer WatchKit Extension
//
//  Created by Salvatore D'Agostino on 2020-04-12.
//  Copyright © 2020 Salvatore D'Agostino. All rights reserved.
//

import SwiftUI
import Combine

class WashingModel: ObservableObject  {
    @Published var currentTimer: Int
    
    var isWashing: Bool
    var timer: Timer?
    let device: WKInterfaceDevice
    static var WASHING_TIME = 5
    
    init() {
        self.isWashing = true
        self.currentTimer = WashingModel.WASHING_TIME
        self.device = WKInterfaceDevice.init()
        self.startWashing()
    }
    
    func startWashing() -> Void {
        self.isWashing = true
        self.currentTimer = WashingModel.WASHING_TIME
        self.timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(fire),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stopWashing() -> Void {
        // Timer done, play haptic
        self.isWashing = false
        self.currentTimer = 0
        self.device.play(WKHapticType.success)
    }
    
    func countDown() -> Void {
        self.currentTimer -= 1
    }
    
    @objc func fire() {
        if self.isWashing {
            // Counting Down
            if self.currentTimer > 0 {
                self.countDown()
                // Time's Up!
            } else if self.currentTimer == 0 {
                self.stopWashing()
                self.timer?.invalidate()
            }
        }
    }

}
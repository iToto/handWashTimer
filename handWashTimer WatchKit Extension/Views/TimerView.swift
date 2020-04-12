//
//  TimerView.swift
//  handWashTimer WatchKit Extension
//
//  Created by Salvatore D'Agostino on 2020-04-11.
//  Copyright © 2020 Salvatore D'Agostino. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @State var timeRemaining = 20
    let device = WKInterfaceDevice.init()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(timeRemaining)")
            .font(.title)
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.device.play(WKHapticType.stop)
                }
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

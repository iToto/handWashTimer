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
        ZStack{
            ProgressCircle(time: self.timeRemaining)
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
}

struct ProgressCircle : View {
    var time: Int
    
    var body: some View {
        var circleCol: Color
        
        if time > 10 {
            circleCol = Color.red
        } else if time > 1 {
            circleCol = Color.orange
        } else {
            circleCol = Color.green
        }
        
        return Circle().stroke().foregroundColor(circleCol)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

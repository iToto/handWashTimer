//
//  TimerView.swift
//  handWashTimer WatchKit Extension
//
//  Created by Salvatore D'Agostino on 2020-04-11.
//  Copyright © 2020 Salvatore D'Agostino. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var washingModel: WashingModel
    
    var body: some View {
        VStack{
            StartButton()
            ZStack{
                ProgressCircle()
                Text("\(self.washingModel.currentTimer)")
                .font(.title)
            }
            StopButton()
        }
    }
}

struct ProgressCircle : View {
    @EnvironmentObject var washingModel: WashingModel
    
    var body: some View {
        var circleCol: Color
        
        if self.washingModel.currentTimer > 10 {
            circleCol = Color.red
        } else if self.washingModel.currentTimer >= 1 {
            circleCol = Color.orange
        } else {
            circleCol = Color.green
        }
        
        return Circle().stroke().foregroundColor(circleCol)
    }
}

struct StopButton : View {
    @EnvironmentObject var washingModel: WashingModel
    
    var body: some View {
        Button(action: {
            self.washingModel.stopWashing()
        }) {
            Text("Stop")
        }
    }
}

struct StartButton : View {
    @EnvironmentObject var washingModel: WashingModel
    
    var body: some View {
        Button(action: {
            self.washingModel.startWashing()
        }) {
            Text("Start")
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

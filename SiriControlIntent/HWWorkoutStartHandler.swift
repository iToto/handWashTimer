//
//  HWWorkoutStartHandler.swift
//  SiriControlIntent
//
//  Created by Salvatore D'Agostino on 2020-04-19.
//  Copyright © 2020 Salvatore D'Agostino. All rights reserved.
//

import Foundation
import Intents

class HWWorkoutStartHandler: NSObject, INStartWorkoutIntentHandling {
    func handle(intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        print("Handing Workout Start Here")
    }
    
}

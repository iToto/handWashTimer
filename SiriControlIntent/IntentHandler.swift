//
//  IntentHandler.swift
//  SiriControlIntent
//
//  Created by Salvatore D'Agostino on 2020-04-19.
//  Copyright © 2020 Salvatore D'Agostino. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any? {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        if intent is INStartWorkoutIntent {
            print("Hello World")
            return HWWorkoutStartHandler()
        }
        
        return nil
    }
    
}

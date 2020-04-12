//
//  HostingController.swift
//  handWashTimer WatchKit Extension
//
//  Created by Salvatore D'Agostino on 2020-04-11.
//  Copyright © 2020 Salvatore D'Agostino. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<TimerView> {
    override var body: TimerView {
        return TimerView()
    }
}

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

class HostingController: WKHostingController<AnyView> {
    override var body: AnyView {
        return AnyView(TimerView().environmentObject(WashingModel()))
    }
}

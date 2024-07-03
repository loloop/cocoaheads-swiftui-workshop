//
//  Item.swift
//  cocoaheads-swiftui-workshop
//
//  Created by Mauricio Cardozo on 03/07/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

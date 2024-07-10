//
//  ScrollOffsetKey.swift
//  NavBar
//
//  Created by Lyndon Cruz on 7/10/24.
//

import Foundation
import SwiftUI

struct ScrollOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}



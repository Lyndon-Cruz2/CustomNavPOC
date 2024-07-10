//
//  Color+Extensions.swift
//  NavBar
//
//  Created by Lyndon Cruz on 7/10/24.
//

import SwiftUI

extension Color {
    init?(hex: String) {
        let r, g, b, a: Double
        var hexColor = hex

        if hexColor.hasPrefix("#") {
            hexColor.remove(at: hexColor.startIndex)
        }

        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        guard scanner.scanHexInt64(&hexNumber) else {
            return nil
        }

        if hexColor.count == 6 {
            r = Double((hexNumber & 0xFF0000) >> 16) / 255.0
            g = Double((hexNumber & 0x00FF00) >> 8) / 255.0
            b = Double(hexNumber & 0x0000FF) / 255.0
            a = 1.0
        } else if hexColor.count == 8 {
            r = Double((hexNumber & 0xFF000000) >> 24) / 255.0
            g = Double((hexNumber & 0x00FF0000) >> 16) / 255.0
            b = Double((hexNumber & 0x0000FF00) >> 8) / 255.0
            a = Double(hexNumber & 0x000000FF) / 255.0
        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }
}


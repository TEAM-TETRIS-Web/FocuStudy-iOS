//
//  ColorManager.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/23.
//

import SwiftUI

extension Color {
    static let gray80 = Color(hex: "666666")
    static let gray60 = Color(hex: "999999")
    static let gray40 = Color(hex: "CCCCCC")
    static let gray20 = Color(hex: "DEDEDE")
    static let gray10 = Color(hex: "#F3F3F3")
    static let gray0 = Color(hex: "FDFDFD")

    static let symbolBlue = Color(hex: "0075FF")
    static let lightBlue = Color(hex: "E8F2FF")

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

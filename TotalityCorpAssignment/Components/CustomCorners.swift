//
//  CustomCorners.swift
//  TotalityCorpAssignment
//
//  Created by rahul kaushik on 01/08/23.
//

import SwiftUI
struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath( roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

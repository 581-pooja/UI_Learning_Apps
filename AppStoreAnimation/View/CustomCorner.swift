//
//  CustomCorner.swift
//  AppStoreAnimation
//
//  Created by Pooja4 Bhagat on 20/12/24.
//

import SwiftUI

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    CustomCorner(corners: [.topLeft, .topRight], radius: 15)
}

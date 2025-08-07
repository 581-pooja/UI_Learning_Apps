//
//  AFButton.swift
//  Custom_Apple_Framework
//
//  Created by Pooja4 Bhagat on 21/06/25.
//

import SwiftUI

struct AFButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 300, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}

#Preview {
    AFButton(title: "Test Title")
}

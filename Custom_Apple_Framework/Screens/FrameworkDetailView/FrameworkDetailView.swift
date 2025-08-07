//
//  FrameworkDetailView.swift
//  Custom_Apple_Framework
//
//  Created by Pooja4 Bhagat on 21/06/25.
//

import Foundation
import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false // restricted to one screen so privte
    
    var body: some View {
        VStack {
            // cross Button
            HStack{
                Spacer()
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
                .padding()
            }
            Spacer()
            // Title & App Icon
            FrameworkTitleView(framework: framework)
            // App Description
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            // Learn More Button: User leaves the app
            Link(destination: URL(string: framework.urlString) ?? URL(string: "https://www.apple.com")!) {
                AFButton(title: "Learn More on Apps")
            }
            // Learn More Button: in app (fullscreen modal)
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
           
        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "https://www.apple.com")!)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}

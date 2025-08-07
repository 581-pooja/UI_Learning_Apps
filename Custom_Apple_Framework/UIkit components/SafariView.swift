//
//  SafariView.swift
//  Custom_Apple_Framework
//
//  Created by Pooja4 Bhagat on 22/06/25.
//

import Foundation
import SwiftUI
import SafariServices

// You're creating a SwiftUI-compatible wrapper around SFSafariViewController, which is a UIKit view controller.
// UIViewControllerRepresentable allows you to embed UIKit views in SwiftUI.
struct SafariView: UIViewControllerRepresentable {
   let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    // SwiftUI calls this when creating the Safari view.
    // You return a new SFSafariViewController initialized with the URL you passed.
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context:  UIViewControllerRepresentableContext<SafariView>) {}
    // This is required by the protocol.
    // You leave it empty here because there's nothing to update once the Safari view is shown.
}

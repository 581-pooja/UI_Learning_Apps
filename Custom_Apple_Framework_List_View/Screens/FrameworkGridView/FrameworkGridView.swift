//
//  FrameworkGridView.swift
//  Custom_Apple_Framework
//
//  Created by Pooja4 Bhagat on 21/06/25.
//  Declarative: Update source the source of Truth & Ui reacts accordingly
//  Model - View - View Model (Ios Architecture) (SwiftUi)

import SwiftUI

struct FrameworkGridView: View {
    // When u r initializing Brand New VM then use StateObject
    // when injecting it from previews view then Observed object
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailView(framework: framework,
                                    isShowingDetailView: $viewModel.isShowingDetailView)) {
                        FrameworkTitleView(framework: framework)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
    }
    
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}

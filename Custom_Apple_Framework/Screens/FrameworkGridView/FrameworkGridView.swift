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
    @StateObject var viewModel = FrameworkGridViewModel()  // 2.55
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns){
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                // Changing source of truth so ui updates
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            // Binding so $ => show the sheet when isShowingDetailView changes
            .sheet(isPresented: $viewModel.isShowingDetailView){
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
    }
    
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
                    .preferredColorScheme(.dark)
    }
}

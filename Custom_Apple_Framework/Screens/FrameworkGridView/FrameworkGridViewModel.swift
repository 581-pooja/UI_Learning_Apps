//
//  FrameworkGridViewModel.swift
//  Custom_Apple_Framework
//
//  Created by Pooja4 Bhagat on 21/06/25.
//  ObservableObject: so Object to Publish or broadcast the information like I changed so views listening can change accordingly

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework?{
        didSet{
            isShowingDetailView = true
        }
    }
    // means whenever Framework is changed then accordingly isShowingDetailView
    // isShowingDetailView will change and changes will be published
    
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
}

/*
 @State – For Local View State:
 - Used for local, private state in a single view.
 - SwiftUI owns it, and when it changes, the view re-renders automatically.
 Usecase - Toggle on/off, count button taps, local switches, etc.
 Key points: Only for simple, value-type data (like Int, String, Bool).
            Should not be shared across views.
 
 @StateObject – For Owning a Reference Type (ObservableObject)
 - Use when a view owns a reference-type model (ObservableObject).
 - SwiftUI creates and owns the object once.
 Use case:
 - Long-lived objects like view models, timers, or network managers.
 - Avoids creating a new instance on every view update.
 
 @ObservableObject – To Make a Class Observable
 What it is:
 - A protocol for a reference type (class) to allow SwiftUI to observe its @Published properties.
 - Combine framework notifies views of updates.
 Use case: Your custom view model or data manager class.
 
 @Binding – Share State Between Parent ↔ Child Views
 What it is: Used to allow child view to update parent state.
 Use case: Toggle in child view affects parent, or child modifies parent's count, text, etc.
 
 @ObservedObject:
 @EnvironmentObject:
 */

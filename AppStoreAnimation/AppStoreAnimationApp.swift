//
//  AppStoreAnimationApp.swift
//  AppStoreAnimation
//
//  Created by Pooja4 Bhagat on 20/12/24.
//

import SwiftUI
import JdsUI

@main
struct AppStoreAnimationApp: App {
    @Environment(\.scenePhase) private var scenePhase // Tracks app's scene phase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { newPhase in
                    switch newPhase {
                    case .active:
                        JDS.shared.initialize()
                    case .inactive:
                        print("App is inactive")
                    case .background:
                        print("App is in the background")
                    @unknown default:
                        break
                    }
                }
        }
    }
}

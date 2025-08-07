//
//  Today.swift
//  AppStoreAnimation
//
//  Created by Pooja4 Bhagat on 20/12/24.
//

import SwiftUI

// Mark: Data Model and Sample Data
struct Today: Identifiable{
    var id = UUID().uuidString
    var appName: String
    var appDescription: String
    var appLogo: String
    var bannerTitle: String
    var platformTitle: String
    var artwork: String
}

var todayItems: [Today] = [
//    Today(appName: "Kung Fu Panda", appDescription: "Battle between Panda and Devil", appLogo: "cartoon4", bannerTitle: "Smash your rivals in Kung Fu Panda", platformTitle: "Apple Arcade", artwork: "cartoon4"),
    Today(appName: "Kung Fu Panda", appDescription: "Battle between Panda and Snake", appLogo: "cartoon3", bannerTitle: "Smash your rivals in Kung Fu Panda", platformTitle: "Apple Arcade", artwork: "cartoon3"),
    Today(appName: "Dargon Balls", appDescription: "Epic battles and transformations await in the Dragon Ball universe.", appLogo: "cartoon2", bannerTitle: "Dragon Ball Super - Ultra Instinct", platformTitle: "Apple Arcade", artwork: "cartoon2"),
    Today(appName: "Minions", appDescription: "Fun with Minnons", appLogo: "cartoon1", bannerTitle: "Fun with Mininons", platformTitle: "Apple Arcade", artwork: "cartoon1"),

]


var dummyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

//
//  MeditationLApp.swift
//  MeditationL
//
//  Created by Andrew  on 4/22/23.
//

import SwiftUI

@main
struct MeditationLApp: App {
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}

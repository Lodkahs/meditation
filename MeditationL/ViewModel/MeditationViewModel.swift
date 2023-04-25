//
//  MeditationViewModel.swift
//  MeditationL
//
//  Created by Andrew  on 4/25/23.
//

import Foundation


final class MeditationViewModel : ObservableObject {
    private(set) var meditation : Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}

struct Meditation {
    let id = UUID()
    let title : String
    let description : String
    let duratrion : TimeInterval
    let track : String
    let image : String
    
    static let data = Meditation(title: "1 Minute Relaxing Meditation", description: "Clear your mind and slumber into nothingless. Allocate only a few moments for a quick breather.", duratrion: 70, track: "meditation1", image: "image-stones")
}

//
//  PlayerView.swift
//  MeditationL
//
//  Created by Andrew  on 4/23/23.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager : AudioManager
    var meditationVM : MeditationViewModel
    var isPreview : Bool = false
    @State private var value : Double = 0.0
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            //MARK: - blur view
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            
            VStack(spacing: 32) {
                //MARK: - dissmiss buttom
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                //MARK: - title
                Text(meditationVM.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                if let player = audioManager.player {
                    
                    VStack(spacing: 5) {
                        //MARK: - playback timeline
                        Slider(value: $value, in: 0...player.duration)
                            .tint(Color.white)
                        
                        //MARK: - playback time
                        HStack {
                            Text()
                            Spacer()
                            Text("1:00")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                    }
                    
                    //MARK: - playback control
                    HStack {
                        //MARK: - repeat button
                        PlaybackControlButton(systemName: "repeat") {
                            
                        }
                        
                        Spacer()
                        
                        //MARK: - backward button
                        PlaybackControlButton(systemName: "gobackward.10") {
                            
                        }
                        
                        Spacer()
                        
                        //MARK: - play/pause button
                        PlaybackControlButton(systemName: "play.circle.fill", fontSize: 44) {
                            
                        }
                        
                        Spacer()
                        
                        //MARK: - forward button
                        PlaybackControlButton(systemName: "goforward.10") {
                            
                        }
                        
                        Spacer()
                        
                        //MARK: - stop button
                        PlaybackControlButton(systemName: "stop.fill") {
                            
                        }
                    }
                }
                
            }
            .padding(20)
        }
        .onAppear {
            //            AudioManager.shared.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
            audioManager.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player else {
                return
            }
            value = player.currentTime
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        PlayerView(meditationVM: meditationVM, isPreview: true)
            .environmentObject(AudioManager())
    }
}

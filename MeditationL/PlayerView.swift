//
//  PlayerView.swift
//  MeditationL
//
//  Created by Andrew  on 4/23/23.
//

import SwiftUI

struct PlayerView: View {
    @State private var value : Double = 0.0
    var body: some View {
        ZStack {
            Image("image-stones")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                //MARK: - dissmiss buttom
                HStack {
                    Button {
                        //
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                //MARK: - title
                Text("1 Minute Relaxing Meditation")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 5) {
                    //MARK: - playback timeline
                    Slider(value: $value, in: 0...60)
                        .tint(Color.white)
                    
                    //MARK: - playback time
                    HStack {
                        Text("0:00")
                        Spacer()
                        Text("1:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }


            }
            .padding(20)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}

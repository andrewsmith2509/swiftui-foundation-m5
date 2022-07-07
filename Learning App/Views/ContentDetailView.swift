//
//  ContentDetailView.swift
//  Learning App
//
//  Created by Andrew Smith on 7/5/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}

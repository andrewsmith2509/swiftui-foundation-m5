//
//  ContentViewRow.swift
//  Learning App
//
//  Created by Andrew Smith on 7/4/22.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            HStack(spacing: 30) {
                
                Text(String(index+1))
                    .bold()
                    .padding(.leading, 30)
                
                VStack(alignment: .leading){
                    Text(lesson.title)
                        .bold()
                    
                    Text(lesson.duration)
                    
                    
                }
            }
        }
    }
}



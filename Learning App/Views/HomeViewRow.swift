//
//  HomeViewRow.swift
//  Learning App
//
//  Created by Andrew Smith on 7/4/22.
//

import SwiftUI

struct HomeViewRow: View {
   
    @EnvironmentObject var model: ContentModel
    @State var image:String
    @State var title:String
    @State var description:String
    @State var lessons:String
    @State var time:String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                
            
            HStack(spacing: 40) {
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(title)
                        .bold()
                    
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                    
                    HStack{
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        Text(lessons)
                            .font(Font.system(size: 10))
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        Text(time)
                            .font(Font.system(size: 10))

                    }
                }
                    
                    
                    
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "learn Swift", description: "Information", lessons: "20 Lessons", time: "3 Hours")
            
    }
}

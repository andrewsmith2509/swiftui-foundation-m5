//
//  ContentView.swift
//  Learning App
//
//  Created by Andrew Smith on 7/3/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(model.modules) { module in
                            
                            NavigationLink(destination: {
                                ContentView()
                                    .padding()
                                    .onAppear {
                                        model.beginModule(moduleId: module.id)
                                    }
                            }, label: { // Learning Card
                                           HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, lessons: "\(module.content.lessons.count) Lessons", time: module.content.time)
                            })
                            
                            


                            
                            
                            // Test Card
                            HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, lessons: "\(module.test.questions.count) Questions", time: module.test.time)
                            
                        }
                    }
                    .tint(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}

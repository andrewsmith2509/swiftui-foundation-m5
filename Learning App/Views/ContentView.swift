//
//  ContentView.swift
//  Learning App
//
//  Created by Andrew Smith on 7/4/22.
//

import SwiftUI

struct ContentView: View {
   
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
               
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count, id:\.self) { index in
                        
                       ContentViewRow(index: index)
                        
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}

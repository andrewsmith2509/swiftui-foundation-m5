//
//  TestView.swift
//  Learning App
//
//  Created by Andrew Smith on 7/14/22.
//

import SwiftUI

struct TestView: View {
   
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack{
                // question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                // question
                CodeTextView()
                // answers
                
                // button
                
            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

//
//  TestResultView.swift
//  Learning App
//
//  Created by Andrew Smith on 7/15/22.
//

import SwiftUI

struct TestResultView: View {
   
    @EnvironmentObject var model : ContentModel
    var numQuestionCorrect:Int
    
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            return ""
        }
            
            let pct = Double(numQuestionCorrect)/Double(model.currentModule!.test.questions.count)
            
            if pct == 1 {
                return "Perfect!"
            }
            else if pct >= 0.5 {
                return "Great job!"
            }
            else if pct > 0 {
                return "Good effort, try again to score better!"
            }
            else if pct == 0 {
                return "Did you even watch the lesson?"
            }
            else {
                return "Fail"
            }
        }
        
    
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(resultHeading)
                .font(.headline)
                .padding()
            
            Text("You got \(numQuestionCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions correct")
            
            Spacer()
            
            Button {
                // Send user to homeview
                model.currentTestSelected = nil
                
            } label: {
                ZStack {
                    RectangleCard(color: .green)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .padding()
            Spacer()
        }
        
    }
    
}


//
//  TestView.swift
//  Learning App
//
//  Created by Andrew Smith on 7/14/22.
//

import SwiftUI

struct TestView: View {
   
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack(alignment: .leading){
                // question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                // question
                CodeTextView()
                    .padding(.horizontal, 20)
                // answers
                ScrollView{
                    VStack{
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                                Button {
                                    // Track selected index
                                    selectedAnswerIndex = index
                                    
                                } label: {
                                    ZStack{
                                        
                                        if submitted == false {
                                            RectangleCard(color: index == selectedAnswerIndex ? Color.gray : Color.white)
                                        }
                                        else {
                                            if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex {
                                                RectangleCard(color: .green)
                                                
                                            }
                                            else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                                RectangleCard(color: .red)
                                            }
                                            else if index == model.currentQuestion!.correctIndex {
                                                RectangleCard(color: .green)
                                            }
                                            else {
                                                RectangleCard(color: Color.white)
                                            }
                                        }
                                        
                                        Text(model.currentQuestion!.answers[index])
                                            .tint(.black)
                                    }
                                }
                                .disabled(submitted)
                        }
                    }
                    .padding()
                }
                Spacer()
                // button
                Button {
                    
                    if submitted == true {
                        selectedAnswerIndex = nil
                        submitted = false
                        model.nextQuestion()
                    }
                    else {
                        // change submitted to true
                        submitted = true
                        
                        // Check Answer, if correct increment counter
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }
                    }
                    
                    
                } label: {
                    ZStack {
                        RectangleCard(color: .green)
                        Text(buttonText)
                            .bold()
                    }
                    .padding()
                    .tint(.white)
                }
                .disabled(selectedAnswerIndex == nil)
            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            ProgressView()
        }
    }
    
    var buttonText:String {
        if submitted == true {
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                return "Finish"
            }
            else {
                return "Next"
            }
        }
        else {
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

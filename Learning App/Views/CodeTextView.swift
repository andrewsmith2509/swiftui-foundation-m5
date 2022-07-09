//
//  CodeTextView.swift
//  Learning App
//
//  Created by Andrew Smith on 7/8/22.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
  
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ textView: UIViewType, context: Context) {
        
        // Set the attributed text for the lesson
        textView.attributedText = model.lessonDescription
        
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}


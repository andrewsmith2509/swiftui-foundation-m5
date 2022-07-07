//
//  ContentFile.swift
//  Learning App
//
//  Created by Andrew Smith on 7/3/22.
//

import Foundation

class ContentModel: ObservableObject {
    // List of Modules
    @Published var modules = [Module]()
    
    // Current Modules
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // Current Lessons
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    // MARK: Data methods
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            // Log error
            print("Couldn't parse style data")
        }
        
    }
    
    // MARK: Module navigation methods
    
    func beginModule(moduleId:Int) {
        
        // Find index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
        
    }
    
    func beginLesson(lessonIndex: Int) {
        
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func nextLesson() {
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count {
            
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else {
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    func hasNextLesson() -> Bool {
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
}

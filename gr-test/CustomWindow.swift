//
//  CustomWindow.swift
//  gr-test
//
//  Created by Oleksandr Savchenko on 08.10.24.
//

import Foundation
import UIKit

class CustomWindow: UIWindow {
    
    override init(windowScene: UIWindowScene) {
        super.init(windowScene: windowScene)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touches BEGAN on \(CustomWindow.self)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touches MOVED on \(CustomWindow.self)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touches ENDED on \(CustomWindow.self)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("Touches CANCELED on \(CustomWindow.self)")
    }
    
    override func sendEvent(_ event: UIEvent) {
        
        //Here we can get all Gesture Recognizers related to our Touch
        let _ = event.allTouches?.first?.gestureRecognizers
        //Same thing with Views
        let _ = event.allTouches?.first?.view
        //So the iOS had already define all components potentially related to current Touch
        
        
        //But here you can see that it already can define that
        //Touch already know, that it is related to our custom GR
        if let gr = (self.rootViewController as? ViewController)?.gestureRecognizer,
           let touches = event.touches(for: gr) {
            var touchDesciption = ""
            for touch in touches {
                touchDesciption += """
                                    \t\(type(of: touch)), \(touch.phase.self)
                                    \tTapCount: \(touch.tapCount), Timestamp: \(touch.timestamp)
                                    """
            }
            print("New Touch detected for \(type(of: gr)): \n\(touchDesciption)")
        }
        
        super.sendEvent(event)
    }
}

//
//  UIViewWithRecognizer.swift
//  gr-test
//
//  Created by Oleksandr Savchenko on 08.10.24.
//

import Foundation
import UIKit

///UIView which you can interact with
///in order to see how GR influencing UITouch dispatching
class UIViewWithRecognizer: UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touches BEGAN on \(UIViewWithRecognizer.self)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touches MOVED on \(UIViewWithRecognizer.self)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touches ENDED on \(UIViewWithRecognizer.self)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("Touches CANCELED on \(UIViewWithRecognizer.self)")
    }
    
    //setting gesture recognizer from storyboard, in case with storyboard
    //addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) NOT getting called
    override var gestureRecognizers: [UIGestureRecognizer]? {
        get {
            //Getting called after user touches,
            //to determine if View has any Gesture Recognizer
            return super.gestureRecognizers
        }
        set {
            if let gestureRecognizers = newValue {
                for recognizer in gestureRecognizers {
                    print("current view: of \(type(of:recognizer)) is \(String(describing: recognizer.view))")
                }
            }
            
            super.gestureRecognizers = newValue
            
            if let gestureRecognizers = super.gestureRecognizers {
                for recognizer in gestureRecognizers {
                    guard let recognizerView = recognizer.view else { continue }
                    print("current view: of \(type(of:recognizer)) is \(type(of: recognizerView))")
                }
            }
        }
    }
}

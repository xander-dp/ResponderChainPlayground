//
//  UIViewWrapper.swift
//  gr-test
//
//  Created by Oleksandr Savchenko on 08.10.24.
//

import Foundation
import UIKit

///Just a regular UIView.
///Use to check Responder Chain without GR
class UIViewWrapper: UIView {
   
    override var gestureRecognizers: [UIGestureRecognizer]? {
        get {
            return super.gestureRecognizers
        }
        set {
            super.gestureRecognizers = newValue
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touches BEGAN on \(UIViewWrapper.self)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touches MOVED on \(UIViewWrapper.self)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touches ENDED on \(UIViewWrapper.self)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("Touches CANCELED on \(UIViewWrapper.self)")
    }
}

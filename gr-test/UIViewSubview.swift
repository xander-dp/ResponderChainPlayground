//
//  UIViewSubview.swift
//  gr-test
//
//  Created by Oleksandr Savchenko on 08.10.24.
//

import Foundation
import UIKit

///UIView whis is a Subview of UIViewWithRecognizer
///it is also affected by GR
class UIViewSubview: UIView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touches BEGAN on \(UIViewSubview.self)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touches MOVED on \(UIViewSubview.self)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touches ENDED on \(UIViewSubview.self)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("Touches CANCELED on \(UIViewSubview.self)")
    }
}

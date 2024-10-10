//
//  CustomGestureRecognizer.swift
//  gr-test
//
//  Created by Oleksandr Savchenko on 08.10.24.
//

import Foundation
import UIKit

//try subclassing different GestureRecognizers
class CustomGestureRecognizer: UIPinchGestureRecognizer {
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        
        print("""
                GestureRecognizer (\(super.self)) default state:
                                delaysTouchesBegan: \(self.delaysTouchesBegan)
                                delaysTouchesEnded: \(self.delaysTouchesEnded)
                                cancelsTouchesInView: \(self.cancelsTouchesInView)
                """)
    }
    
    override var view: UIView? {
        get {
            return super.view
        }
    }
    
    override func shouldReceive(_ event: UIEvent) -> Bool {
        //MARK: Check Callstack. After collection, suitable GRs going to be notified about upcomming Event
        
        super.shouldReceive(event)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        print("Touches BEGAN on \(CustomGestureRecognizer.self)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        print("Touches MOVED on \(CustomGestureRecognizer.self)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        print("Touches ENDED on \(CustomGestureRecognizer.self)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        print("Touches CANCELED on \(CustomGestureRecognizer.self)")
    }
}

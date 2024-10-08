//
//  CustomApplication.swift
//  gr-test
//
//  Created by Oleksandr Savchenko on 08.10.24.
//

import Foundation
import UIKit

class CustomApplication: UIApplication {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touches BEGAN on \(CustomApplication.self)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touches MOVED on \(CustomApplication.self)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touches ENDED on \(CustomApplication.self)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("Touches CANCELED on \(CustomApplication.self)")
    }
    
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
    }
}

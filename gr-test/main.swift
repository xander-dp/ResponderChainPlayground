//
//  main.swift
//  gr-test
//
//  Created by Oleksandr Savchenko on 08.10.24.
//

import UIKit

//Just an override instead of @main in AppDelegate to exclude storyboard
UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(CustomApplication.self),
    NSStringFromClass(AppDelegate.self)
)

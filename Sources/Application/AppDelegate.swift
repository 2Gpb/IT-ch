//
//  AppDelegate.swift
//  IT-ch
//
//  Created by Peter on 06.02.2025.
//

import UIKit
import IQKeyboardManagerSwift
import IQKeyboardToolbarManager
import IQKeyboardToolbar

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setUpKeyboardManager()
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
    
    // MARK: - Private methods
    private func setUpKeyboardManager() {
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardToolbarManager.shared.isEnabled = true
        IQKeyboardToolbarManager.shared.toolbarConfiguration.doneBarButtonConfiguration = IQBarButtonItemConfiguration(title: "Готово")
        IQKeyboardToolbarManager.shared.toolbarConfiguration.previousNextDisplayMode = .alwaysShow
        IQKeyboardToolbarManager.shared.toolbarConfiguration.placeholderConfiguration.showPlaceholder = false
        IQKeyboardToolbarManager.shared.deepResponderAllowedContainerClasses.append(UIScrollView.self)
    }
}

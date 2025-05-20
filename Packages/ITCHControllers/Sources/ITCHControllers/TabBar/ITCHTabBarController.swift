//
//  TabBar.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 12.03.2025.
//

import UIKit
import ITCHUIComponents
import ITCHCourses
import ITCHSchedule
import ITCHNotifications
import ITCHProfile

public final class ITCHTabBarController: UITabBarController {
    // MARK: - Constants
    private enum Constant {
        enum TabBar {
            static let backgroundColor = ITCHColor.tabBar.color
            static let barTintColor = ITCHColor.tabBar.color
            static let unselectedItemTintColor = ITCHColor.base40.color
            static let isTranslucent = false
        }
        
        enum MyCourses {
            static let title: String = ""
            static let image: UIImage = ITCHImage.courses28.image
            static let selectedImage: UIImage = ITCHImage.courses48.image
        }
        
        enum Schedule {
            static let title: String = ""
            static let image: UIImage = ITCHImage.calendar28.image
            static let selectedImage: UIImage = ITCHImage.calendar48.image
        }
        
        enum Notifications {
            static let title: String = ""
            static let image: UIImage = ITCHImage.notification28.image
            static let selectedImage: UIImage = ITCHImage.notification48.image
        }
        
        enum Profile {
            static let title: String = ""
            static let image: UIImage = ITCHImage.account28.image
            static let selectedImage: UIImage = ITCHImage.account48.image
        }
        
        enum Border {
            static let origin: CGPoint = .zero
            static let height: CGFloat = 1
            static let backgroundColor: CGColor = ITCHColor.base80.color.cgColor
        }
    }
    
    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpAppearance()
        setUpControllers()
    }
    
    private func setUpAppearance() {
        tabBar.backgroundColor = Constant.TabBar.backgroundColor
        tabBar.barTintColor = Constant.TabBar.barTintColor
        tabBar.unselectedItemTintColor = Constant.TabBar.unselectedItemTintColor
        tabBar.isTranslucent = Constant.TabBar.isTranslucent
        
        addTabBarTopBorder()
    }
    
    private func setUpControllers() {
        let myCourses = createNavController(
            rootViewController: ITCHMyCoursesAssembly.build(),
            title: Constant.MyCourses.title,
            image: Constant.MyCourses.image,
            selectedImage: Constant.MyCourses.selectedImage
        )
        
        let calendar = createNavController(
            rootViewController: ITCHCalendarAssembly.build(),
            title: Constant.Schedule.title,
            image: Constant.Schedule.image,
            selectedImage: Constant.Schedule.selectedImage
        )
        
        let notifications = createNavController(
            rootViewController: ITCHNotificationsAssembly.build(),
            title: Constant.Notifications.title,
            image: Constant.Notifications.image,
            selectedImage: Constant.Notifications.selectedImage
        )
        
        let profile = createNavController(
            rootViewController: ITCHProfileAssembly.build(),
            title: Constant.Profile.title,
            image: Constant.Profile.image,
            selectedImage: Constant.Profile.selectedImage
        )
        
        setViewControllers([myCourses, calendar, notifications, profile], animated: false)
    }
    
    private func createNavController(
        rootViewController: UIViewController,
        title: String,
        image: UIImage,
        selectedImage: UIImage
    ) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem = UITabBarItem(
            title: title,
            image: image,
            selectedImage: selectedImage.withRenderingMode(.alwaysOriginal)
        )
        
        return navController
    }
    
    private func addTabBarTopBorder() {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(
            origin: Constant.Border.origin,
            size: CGSize(width: tabBar.frame.width, height: Constant.Border.height)
        )
        
        borderLayer.backgroundColor = Constant.Border.backgroundColor
        tabBar.layer.addSublayer(borderLayer)
    }
}

import UIKit
import Domain
import NetworkPlatform

final class Application {
  
  static let shared = Application()
  private let useCaseProvider: Domain.UseCaseProvider
  
  private init() {
    self.useCaseProvider = NetworkPlatform.UseCaseProvider()
    UIFont.registerCustomFonts()
  }
  
  func configure(in window: UIWindow) {
    let homeNavigator = DefaultHomeNavigator(
      services: useCaseProvider,
      navigationController: NavigationController()
    )
    
    let optionsNavigator = DefaultOptionsNavigator(
      services: useCaseProvider,
      navigationController: NavigationController()
    )
    
    let navigators: [Navigator] = [
      homeNavigator,
      optionsNavigator
    ]
    window.rootViewController = TabBarController(navigators: navigators)
    //window.rootViewController = ViewController()
    window.makeKeyAndVisible()
  }
}

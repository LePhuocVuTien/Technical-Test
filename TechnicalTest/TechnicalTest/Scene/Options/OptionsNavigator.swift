import UIKit
import Domain

protocol OptionsNavigator: Navigator {
}

class DefaultOptionsNavigator: OptionsNavigator {
  private let services: Domain.UseCaseProvider
  let navigationController: NavigationController
  
  init(services: Domain.UseCaseProvider, navigationController: NavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toScene() {
    let viewModel = OptionsViewModel(navigator: self)
    let controller = OptionsController()
    controller.viewModel = viewModel
    navigationController.pushViewController(controller, animated: true)
  }
}

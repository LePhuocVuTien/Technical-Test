import UIKit
import Domain

protocol HomeNavigator: Navigator {
}

class DefaultHomeNavigator: HomeNavigator {
  private let services: Domain.UseCaseProvider
  let navigationController: NavigationController
  
  init(services: Domain.UseCaseProvider, navigationController: NavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toScene() {
    let viewModel = HomeViewModel(navigator: self, useCase: services.makeSearchUseCase())
    let controller = HomeController()
    controller.viewModel = viewModel
    navigationController.pushViewController(controller, animated: true)
  }
}

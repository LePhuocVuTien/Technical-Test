import UIKit

class TabBarController: UITabBarController {
  
  let navigators: [Navigator]
  var items: [TabBarItem] = TabBarItem.allCases
  
  init(navigators: [Navigator]) {
    self.navigators = navigators
    super.init(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setting()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setting() {
    UITabBarItem.appearance().setTitleTextAttributes(
      [NSAttributedString.Key.font: R.font.openSansSemiBold(size: 12.0)!],
      for: .normal
    )
    UITabBar.appearance().backgroundColor = R.color.white()
    setValue(CustomUITabBar(), forKey: "tabBar")
    setPositionAdjustment()
    
    viewControllers = navigators.map { $0.navigationController }
    for i in 0..<navigators.count {
      navigators[i].navigationController.tabBarItem = UITabBarItem(
        title: items[i].name,
        image: items[i].icon,
        selectedImage: nil)
      navigators[i].toScene()
    }
  }
}

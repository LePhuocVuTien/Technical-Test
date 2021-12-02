import UIKit

extension TabBarController {
  class CustomUITabBar : UITabBar {
    
    let HEIGHT: CGFloat = 54.0
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
      var sizeThatFits = super.sizeThatFits(size)
      var safeBottom: CGFloat = 0
      if #available(iOS 11, *){
        safeBottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
      }
      sizeThatFits.height = HEIGHT + safeBottom
      return sizeThatFits
    }
  }
  
  func setPositionAdjustment() {
    var vertical: CGFloat = 0.0
    if #available(iOS 13.0, *) {
      vertical = -5
    }
    UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: vertical)
  }
}

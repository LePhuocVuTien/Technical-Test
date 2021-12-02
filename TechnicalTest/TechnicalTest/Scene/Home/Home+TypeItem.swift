import UIKit

public enum TypeItem: CaseIterable {
  case hue
  case danang
  case quangnam
  
  public var name: String {
    switch self {
      case .hue:
        return "Hue"
      case .danang:
        return "Da Nang"
      case .quangnam:
        return "Quang Nam"
    }
  }
  
  public var icon: UIImage? {
    switch self {
      case .hue:
        return R.image.home()
      case .danang:
        return R.image.home()
      case .quangnam:
        return R.image.home()
    }
  }
}

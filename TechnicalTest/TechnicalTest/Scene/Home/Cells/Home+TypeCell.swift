import Foundation
import UIKit
import RxSwift


class TypeCell: UICollectionViewCell {
  
  private lazy var button: UIButton = {
    let button = UIButton()
    button.isUserInteractionEnabled = false
    button.backgroundColor = R.color.white()
    button.layer.shadowColor = R.color.black()?.cgColor
    button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
    button.layer.shadowRadius = 3.0
    button.layer.shadowOpacity = 0.3
    button.layer.cornerRadius = 16.0
    button.titleLabel?.font = R.font.robotoMedium(size: 14.0)
    button.setTitleColor(R.color.black(), for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 12.0)
    return button
  }()
  
  private override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setConstraint()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func configure(_ item: TypeItem) {
    button.setImage(item.icon, for: .normal)
    button.setTitle("  \(item.name)", for: .normal)
  }
  
  private func setupViews() {
    contentView.addSubview(button)
  }
  
  private func setConstraint() {
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    button.snp.makeConstraints {
      $0.left.right.equalToSuperview()
      $0.centerY.equalToSuperview()
      $0.height.equalTo(32.0)
    }
  }
}

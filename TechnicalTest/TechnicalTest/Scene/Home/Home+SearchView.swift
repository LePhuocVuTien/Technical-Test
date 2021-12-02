import UIKit
import RxSwift

extension HomeController {
  
  class SearchView: UIView {
    
    private let disposeBag = DisposeBag()
    
    lazy var textField: UITextField = {
      let textField = UITextField()
      textField.becomeFirstResponder()
      textField.font = R.font.robotoRegular(size: 18.0)
      textField.attributedPlaceholder = NSAttributedString(
        string: "Search",
        attributes: [NSAttributedString.Key.foregroundColor : R.color.placeholder() as Any]
      )
      textField.returnKeyType = .search
      textField.enablesReturnKeyAutomatically = true
      return textField
    }()
    
    lazy var delete: UIButton = {
      let button = UIButton()
      button.setImage(R.image.delete(), for: .normal)
      button.layer.cornerRadius = 24.0
      button.contentEdgeInsets = UIEdgeInsets(top: 14.0, left: 14.0, bottom: 14.0, right: 14.0)
      button.backgroundColor = R.color.white()
      button.isHidden = true
      return button
    }()
    
    private override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = R.color.white()
      layer.borderWidth = 1.0
      layer.borderColor = R.color.line()?.cgColor
      layer.cornerRadius = 24.0
      setupViews()
      bindView()
      setConstraint()
     
    }
    
    public required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    private func bindView() {
      textField.rx
        .controlEvent([.editingDidBegin, .editingChanged])
        .bind(onNext: { [weak self] _ in
          self?.delete.rx.isHidden.onNext(self?.textField.text?.isEmpty ?? true)
        })
        .disposed(by: disposeBag)
      
      delete.rx
        .tap
        .bind(onNext: { [weak self] _ in
          self?.textField.rx.text.onNext(nil)
          self?.delete.rx.isHidden.onNext(true)
        })
        .disposed(by: disposeBag)
    }
    
    private func setupViews() {
      addSubview(textField)
      addSubview(delete)
    }
    
    private func setConstraint() {
      textField.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.left.equalToSuperview().inset(24.0)
        $0.right.equalToSuperview().inset(60.0)
        $0.height.equalTo(48.0)
      }

      delete.snp.makeConstraints {
        $0.size.equalTo(48.0)
        $0.right.equalToSuperview()
        $0.centerY.equalToSuperview()
      }
    }
  }
}

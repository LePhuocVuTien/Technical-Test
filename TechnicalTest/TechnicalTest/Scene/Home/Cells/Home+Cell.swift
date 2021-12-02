import UIKit
import Domain

extension HomeController {
  
  class Cell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
      let view = UIImageView()
      view.image = R.image.flag()
      return view
    }()
    
    private lazy var title: UILabel = {
      let label = UILabel()
      label.numberOfLines = 0
      label.font = R.font.robotoRegular(size: 16.0)
      label.textColor = R.color.black()
      return label
    }()
    
    private lazy var line: UIView = {
      let view = UIView()
      view.backgroundColor = R.color.line()
      return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      selectionStyle = .none
      setupViews()
      setConstraints()
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
      addSubview(icon)
      addSubview(title)
      addSubview(line)
    }
    
    private func setConstraints() {
      icon.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.left.equalToSuperview().inset(24.0)
        $0.height.width.equalTo(24.0)
      }
      
      title.snp.makeConstraints {
        $0.top.bottom.equalToSuperview().inset(20.0)
        $0.left.equalTo(icon.snp.right).offset(12.0)
        $0.right.equalToSuperview().inset(12.0)
        $0.bottom.equalToSuperview().inset(20.0)
      }
      
      line.snp.makeConstraints {
        $0.left.equalTo(icon)
        $0.right.bottom.equalToSuperview()
        $0.height.equalTo(1.0)
      }
    }
    
    func configure(_ item: Domain.Detail) {
      title.rx.text.onNext(item.name)
    }
  }
  
}

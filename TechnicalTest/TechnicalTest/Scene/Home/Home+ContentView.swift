import UIKit

extension HomeController {
  
  class ContentView: UIView {
    
    lazy var searchBar = SearchView()
    
    lazy var tableView: UITableView = {
      let tableView = UITableView(frame: .zero)
      tableView.separatorStyle = .none
      tableView.showsVerticalScrollIndicator = false
      tableView.keyboardDismissMode = .onDrag
      //tableView.register(Cell.self)
      tableView.register(Cell.self)
      return tableView
    }()
    
    lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
      layout.scrollDirection = .horizontal
      layout.minimumLineSpacing = 6.0
      layout.minimumInteritemSpacing = 6.0
      let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
      collectionView.register(TypeCell.self)
      collectionView.backgroundColor = .clear
      collectionView.showsHorizontalScrollIndicator = false
      return collectionView
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
      setConstraint()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
      addSubview(searchBar)
      addSubview(tableView)
      addSubview(collectionView)
    }
    
    private func setConstraint() {
      searchBar.snp.makeConstraints {
        $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20.0)
        $0.left.right.equalToSuperview().inset(16.0)
        $0.height.equalTo(48)
      }
      
      collectionView.snp.makeConstraints {
        $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(80)
        $0.height.equalTo(50.0)
        $0.right.left.equalToSuperview().inset(12.0)
      }
      
      tableView.snp.makeConstraints {
        $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(150)
        $0.width.equalToSuperview()
        $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        $0.centerX.equalToSuperview()
      }
    }
  }
}

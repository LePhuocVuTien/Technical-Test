import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Domain
import RxDataSources

class HomeController: UIViewController {
  
  let disposeBag = DisposeBag()
  var viewModel: HomeViewModel!
  lazy var content = ContentView(frame: .zero)
  
  private lazy var dataSource: RxTableDataSource<SectionModel<String, Domain.Detail>> = {
      return createDataSource()
    }()
  
  private lazy var typeDataSource: RxCollectionDataSource = {
    return createTypeDataSource()
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }
  
  override func loadView() {
    super.loadView()
    bindViewModel()
    setupViews()
    setConstaint()
  }
  
  private func bindViewModel() {
    let viewDidLoadTrigger = rx
      .sentMessage(#selector(Self.viewDidLoad))
      .mapToVoid()
      .asDriverOnErrorJustComplete()
    
    let query = content.searchBar.textField.rx
      .text
      .orEmpty
      .debounce(.milliseconds(200), scheduler: MainScheduler.instance)
      .asDriverOnErrorJustComplete()
    
    let input = HomeViewModel.Input(
      viewDidLoad: viewDidLoadTrigger,
      query: query
    )
    
    let output = viewModel.transform(input: input)
    
    output.viewDidLoad
      .drive()
      .disposed(by: disposeBag)
    
    output.items
      .drive(content.tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
    
    output.types
      .drive(content.collectionView.rx.items(dataSource: typeDataSource))
      .disposed(by: disposeBag)
  }
  
  private func setConstaint() {
    content.snp.makeConstraints {
      $0.top.left.right.equalToSuperview()
      $0.height.equalTo(UIScreen.main.bounds.height)
    }
  }
  
  private func setupViews() {
    view.addSubview(content)
  }
}


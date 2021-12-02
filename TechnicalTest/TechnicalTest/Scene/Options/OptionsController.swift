import UIKit
import SnapKit
import RxCocoa
import RxSwift
import RxDataSources

class OptionsController: UIViewController {
  
  let disposeBag = DisposeBag()
  var viewModel: OptionsViewModel!
  lazy var content = ContentView(frame: .zero)
  
//  private lazy var dataSource:
//    RxTableDataSource<SectionModel<String, OptionsItem>> = {
//      return createDataSource()
//    }()
  
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
    
    
    let input = OptionsViewModel.Input(
      viewDidLoad: viewDidLoadTrigger
    )
    
    let output = viewModel.transform(input: input)
    
    output.viewDidLoad
      .drive()
      .disposed(by: disposeBag)
  }
  
  private func setConstaint() {
    
  }
  
  private func setupViews() {
    view.addSubview(content)
  }
}


import Domain
import RxSwift
import RxCocoa
import RxDataSources

final class OptionsViewModel: ViewModelType {
  private let navigator: OptionsNavigator
  
  init(navigator: OptionsNavigator) {
    self.navigator = navigator
  }
  
  struct Input {
    let viewDidLoad: Driver<Void>
  }
  
  struct Output {
    let viewDidLoad: Driver<Void>
  }
  
  func transform(input: Input) -> Output {
    let viewDidLoad = input.viewDidLoad
    
    return Output(
      viewDidLoad: viewDidLoad
    )
  }
}

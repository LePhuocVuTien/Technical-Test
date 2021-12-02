import Domain
import RxSwift
import RxCocoa
import RxDataSources

final class HomeViewModel: ViewModelType {
  private let navigator: HomeNavigator
  private let useCase: Domain.SearchUseCase
  
  init(navigator: HomeNavigator, useCase: Domain.SearchUseCase) {
    self.navigator = navigator
    self.useCase = useCase
  }
  
  struct Input {
    let viewDidLoad: Driver<Void>
    let query: Driver<String>
  }
  
  struct Output {
    let viewDidLoad: Driver<Void>
    let items: Driver<[SectionModel<String, Domain.Detail>]>
    let types: Driver<[SectionModel<String, TypeItem>]>
  }
  
  func transform(input: Input) -> Output {
    
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    
    let viewDidLoad = input.viewDidLoad
    
    let items = input.query
      .flatMapLatest { [weak self] text -> Driver<[Domain.Detail]> in
        guard let self = self else {return .empty()}
        if text.isEmpty {
          return Driver.of([])
        }
        return self.fetch(text: text)
          .trackError(errorTracker)
          .trackActivity(activityIndicator)
          .asDriverOnErrorJustComplete()
      }
      .map {return [SectionModel(model: "", items: $0)]}
    
    let types = input.viewDidLoad
      .flatMapLatest { [weak self] _ -> Driver<[TypeItem]> in
        guard let self = self else {return .empty()}
        return Driver.of(self.makeType())
      }
      .map {return [SectionModel(model: "", items: $0)]}
    
    return Output(
      viewDidLoad: viewDidLoad,
      items: items,
      types: types
    )
  }
  
  private func fetch(text: String) -> Observable<[Domain.Detail]> {
    let params: [String: String] = ["text": text]
    return self.useCase.fetch(params: params)
      .flatMapLatest({ response -> Observable<[Domain.Detail]> in
        guard response.code == "ok", let result = response.result else {
          return Observable.of([])
        }
        return Observable.of(result)
      })
  }
  
  func makeType() -> [TypeItem] {
    let items: [TypeItem] = TypeItem.allCases
    return items
  }
}

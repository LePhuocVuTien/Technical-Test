import RxSwift

public protocol SearchUseCase {
  func fetch(params: [String: String]) -> Observable<Response<[Domain.Detail]>>
}


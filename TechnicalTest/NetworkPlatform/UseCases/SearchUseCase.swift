import Domain
import RxSwift

final class SearchUseCase: Domain.SearchUseCase {
  private let network: DetailNetwork<[Domain.Detail]>
  
  init(network: DetailNetwork<[Domain.Detail]>) {
    self.network = network
  }
  
  func fetch(params: [String : String]) -> Observable<Response<[Domain.Detail]>> {
    return network.fetch(params: params)
  }
}

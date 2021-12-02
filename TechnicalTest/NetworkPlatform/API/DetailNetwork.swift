import Domain
import RxSwift

public final class DetailNetwork<T: Decodable> {
  private let network: Network<Response<T>>
  
  init(network: Network<Response<T>>) {
    self.network = network
  }
  
  func fetch(params: [String: Any]) -> Observable<Response<T>> {
    return network.getItem("map/autosuggest", params: params)
  }
  
  func create(params: [String: Any]) -> Observable<Response<T>> {
    return network.pushItem("map/place-edit", params: params)
  }
}


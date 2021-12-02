import Domain

final class NetworkProvider {
  private let apiEndpoint: String
  
  public init() {
    #if DEBUG
    apiEndpoint = "https://api-app-dev.map4d.vn"
    #else
    apiEndpoint = "https://api-app.map4d.vn"
    #endif
  }
  
  public func makeSearchNetwork() -> DetailNetwork<[Domain.Detail]> {
    let network = Network<Response<[Domain.Detail]>>(apiEndpoint)
    return DetailNetwork(network: network)
  }
  
//  public func makeHomeNetwork() -> DetailNetwork<Domain.Detail> {
//    let network = Network<Response<Domain.Detail>>(apiEndpoint)
//    return DetailNetwork(network: network)
//  }
}

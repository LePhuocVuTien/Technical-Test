public struct Response<T: Decodable>: Decodable {
  public let code: String
  public var message: String
  public var result: T?

  enum CodingKeys: String, CodingKey {
    case code
    case message
    case result
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    code = try container.decode(String.self, forKey: .code)
    message = (try? container.decode(String.self, forKey: .message)) ?? ""
    if code == "ok" {
      result = try container.decode(T.self, forKey: .result)
    }
  }
}

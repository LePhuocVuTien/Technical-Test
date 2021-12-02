public struct Metadata: Codable {
  public var id: String
  public var type: String
  public var name: String
  public var content: String
  
  public init(
    id: String,
    type: String,
    name: String,
    content: String
  ){
    self.id = id
    self.type = type
    self.name = name
    self.content = content
  }
  
  private enum CodingKeys: String, CodingKey {
    case id
    case type
    case name
    case content
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = (try? container.decode(String.self, forKey: .id)) ?? ""
    type = (try? container.decode(String.self, forKey: .type)) ?? ""
    name = (try? container.decode(String.self, forKey: .name)) ?? ""
    content = (try? container.decode(String.self, forKey: .content)) ?? ""
  }
}

extension Metadata: Equatable {
  public static func == (lhs: Metadata, rhs: Metadata) -> Bool {
    lhs.id == rhs.id &&
      lhs.type == rhs.type &&
      lhs.name == rhs.name &&
      lhs.content == rhs.content
  }
}

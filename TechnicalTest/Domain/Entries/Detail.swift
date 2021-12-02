import Foundation

public struct Detail: Codable {
  public var id: String
  public var name: String
  public var metadata: [Metadata]
  
  public init(
    id: String,
    name: String,
    metadata: [Metadata]
    ){
    self.id = id
    self.name = name
    self.metadata = metadata
  }
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case metadata
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = (try? container.decode(String.self, forKey: .id)) ?? ""
    name = (try? container.decode(String.self, forKey: .name)) ?? ""
    metadata = (try? container.decode([Metadata].self, forKey: .metadata)) ?? []
  }
}

extension Detail: Equatable {
  public static func == (lhs: Detail, rhs: Detail) -> Bool {
    return lhs.id == rhs.id &&
      lhs.name == rhs.name &&
      lhs.metadata == rhs.metadata
  }
}

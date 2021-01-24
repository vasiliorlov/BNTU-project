// swiftlint:disable all
import Amplify
import Foundation

public struct DynProduct: Model {
  public let id: String
  public var name: String
  public var measureId: String
  
  public init(id: String = UUID().uuidString,
      name: String,
      measureId: String) {
      self.id = id
      self.name = name
      self.measureId = measureId
  }
}
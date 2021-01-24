// swiftlint:disable all
import Amplify
import Foundation

public struct DynMeasure: Model {
  public let id: String
  public var measureFactor: Int
  public var name: String
  
  public init(id: String = UUID().uuidString,
      measureFactor: Int,
      name: String) {
      self.id = id
      self.measureFactor = measureFactor
      self.name = name
  }
}
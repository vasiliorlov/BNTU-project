// swiftlint:disable all
import Amplify
import Foundation

public struct DynPointOfSale: Model {
  public let id: String
  public var name: String
  public var adreess: DynAdress
  public var comment: String
  
  public init(id: String = UUID().uuidString,
      name: String,
      adreess: DynAdress,
      comment: String) {
      self.id = id
      self.name = name
      self.adreess = adreess
      self.comment = comment
  }
}
// swiftlint:disable all
import Amplify
import Foundation

public struct DynVisit: Model {
  public let id: String
  public var posID: String
  public var cash: Double?
  public var comment: String?
  public var isCollect: Bool
  public var isInventory: Bool
  public var isService: Bool
  public var needCollect: Bool
  public var needInventory: Bool
  public var needService: Bool
  public var items: [DynVisitItem]
  
  public init(id: String = UUID().uuidString,
      posID: String,
      cash: Double? = nil,
      comment: String? = nil,
      isCollect: Bool,
      isInventory: Bool,
      isService: Bool,
      needCollect: Bool,
      needInventory: Bool,
      needService: Bool,
      items: [DynVisitItem] = []) {
      self.id = id
      self.posID = posID
      self.cash = cash
      self.comment = comment
      self.isCollect = isCollect
      self.isInventory = isInventory
      self.isService = isService
      self.needCollect = needCollect
      self.needInventory = needInventory
      self.needService = needService
      self.items = items
  }
}
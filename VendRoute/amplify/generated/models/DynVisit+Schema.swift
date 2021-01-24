// swiftlint:disable all
import Amplify
import Foundation

extension DynVisit {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case posID
    case cash
    case comment
    case isCollect
    case isInventory
    case isService
    case needCollect
    case needInventory
    case needService
    case items
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let dynVisit = DynVisit.keys
    
    model.pluralName = "DynVisits"
    
    model.fields(
      .id(),
      .field(dynVisit.posID, is: .required, ofType: .string),
      .field(dynVisit.cash, is: .optional, ofType: .double),
      .field(dynVisit.comment, is: .optional, ofType: .string),
      .field(dynVisit.isCollect, is: .required, ofType: .bool),
      .field(dynVisit.isInventory, is: .required, ofType: .bool),
      .field(dynVisit.isService, is: .required, ofType: .bool),
      .field(dynVisit.needCollect, is: .required, ofType: .bool),
      .field(dynVisit.needInventory, is: .required, ofType: .bool),
      .field(dynVisit.needService, is: .required, ofType: .bool),
      .field(dynVisit.items, is: .required, ofType: .embeddedCollection(of: DynVisitItem.self))
    )
    }
}
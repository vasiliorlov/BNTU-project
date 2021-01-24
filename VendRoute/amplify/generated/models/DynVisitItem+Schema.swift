// swiftlint:disable all
import Amplify
import Foundation

extension DynVisitItem {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case column
    case row
    case productId
    case add
    case remove
    case spoiled
    case inv
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let dynVisitItem = DynVisitItem.keys
    
    model.pluralName = "DynVisitItems"
    
    model.fields(
      .id(),
      .field(dynVisitItem.column, is: .required, ofType: .int),
      .field(dynVisitItem.row, is: .required, ofType: .int),
      .field(dynVisitItem.productId, is: .required, ofType: .string),
      .field(dynVisitItem.add, is: .optional, ofType: .int),
      .field(dynVisitItem.remove, is: .optional, ofType: .int),
      .field(dynVisitItem.spoiled, is: .optional, ofType: .int),
      .field(dynVisitItem.inv, is: .optional, ofType: .int)
    )
    }
}
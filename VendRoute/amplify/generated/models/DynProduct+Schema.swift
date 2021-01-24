// swiftlint:disable all
import Amplify
import Foundation

extension DynProduct {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case measureId
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let dynProduct = DynProduct.keys
    
    model.pluralName = "DynProducts"
    
    model.fields(
      .id(),
      .field(dynProduct.name, is: .required, ofType: .string),
      .field(dynProduct.measureId, is: .required, ofType: .string)
    )
    }
}
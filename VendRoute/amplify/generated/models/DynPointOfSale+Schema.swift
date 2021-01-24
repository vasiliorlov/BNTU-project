// swiftlint:disable all
import Amplify
import Foundation

extension DynPointOfSale {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case adreess
    case comment
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let dynPointOfSale = DynPointOfSale.keys
    
    model.pluralName = "DynPointOfSales"
    
    model.fields(
      .id(),
      .field(dynPointOfSale.name, is: .required, ofType: .string),
      .field(dynPointOfSale.adreess, is: .required, ofType: .embedded(type: DynAdress.self)),
      .field(dynPointOfSale.comment, is: .required, ofType: .string)
    )
    }
}
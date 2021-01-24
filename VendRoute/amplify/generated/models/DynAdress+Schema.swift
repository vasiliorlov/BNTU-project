// swiftlint:disable all
import Amplify
import Foundation

extension DynAdress {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case city
    case street
    case gps
    case postCode
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let dynAdress = DynAdress.keys
    
    model.pluralName = "DynAdresses"
    
    model.fields(
      .field(dynAdress.city, is: .required, ofType: .string),
      .field(dynAdress.street, is: .required, ofType: .string),
      .field(dynAdress.gps, is: .required, ofType: .embedded(type: DynGpsCoordinate.self)),
      .field(dynAdress.postCode, is: .required, ofType: .string)
    )
    }
}
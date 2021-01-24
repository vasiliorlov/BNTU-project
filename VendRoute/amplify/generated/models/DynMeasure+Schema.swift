// swiftlint:disable all
import Amplify
import Foundation

extension DynMeasure {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case measureFactor
    case name
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let dynMeasure = DynMeasure.keys
    
    model.pluralName = "DynMeasures"
    
    model.fields(
      .id(),
      .field(dynMeasure.measureFactor, is: .required, ofType: .int),
      .field(dynMeasure.name, is: .required, ofType: .string)
    )
    }
}
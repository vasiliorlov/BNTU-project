// swiftlint:disable all
import Amplify
import Foundation

extension DynGpsCoordinate {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case longitude
    case latitude
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let dynGpsCoordinate = DynGpsCoordinate.keys
    
    model.pluralName = "DynGpsCoordinates"
    
    model.fields(
      .field(dynGpsCoordinate.longitude, is: .required, ofType: .double),
      .field(dynGpsCoordinate.latitude, is: .required, ofType: .double)
    )
    }
}
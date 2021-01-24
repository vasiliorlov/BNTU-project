// swiftlint:disable all
import Amplify
import Foundation

public struct DynAdress: Embeddable {
  var city: String
  var street: String
  var gps: DynGpsCoordinate
  var postCode: String
}
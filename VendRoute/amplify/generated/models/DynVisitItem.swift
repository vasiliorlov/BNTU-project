// swiftlint:disable all
import Amplify
import Foundation

public struct DynVisitItem: Embeddable {
  var id: String
  var column: Int
  var row: Int
  var productId: String
  var add: Int?
  var remove: Int?
  var spoiled: Int?
  var inv: Int?
}
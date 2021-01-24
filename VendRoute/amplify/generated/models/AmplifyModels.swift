// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "adf2ba2d5f5238a23da8eafa5635d831"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: DynVisit.self)
    ModelRegistry.register(modelType: DynProduct.self)
    ModelRegistry.register(modelType: DynMeasure.self)
    ModelRegistry.register(modelType: DynPointOfSale.self)
  }
}
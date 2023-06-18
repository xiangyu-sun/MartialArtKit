
import Foundation
import HealthKit

public extension HKQuantityType {
     static var activeEnergyBurned: HKQuantityType {
        return HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
    }
    
    static var heartRate: HKQuantityType {
        return HKObjectType.quantityType(forIdentifier: .heartRate)!
    }
    
    static var stepCount: HKQuantityType {
        return HKObjectType.quantityType(forIdentifier: .stepCount)!
    }
}

public extension HKCategoryType {
     static var mindfulSession: HKCategoryType {
        return HKObjectType.categoryType(forIdentifier: .mindfulSession)!
    }
    
    func sample(start: Date, end: Date) -> HKCategorySample {
        return HKCategorySample(type: self, value: 0, start: start, end: end)
    }
}

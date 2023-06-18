//
//  HealthKitConfig.swift
//  Taichi
//
//  Created by 孙翔宇 on 05/02/2020.
//  Copyright © 2020 xiangyu sun. All rights reserved.
//

import HealthKit

public final class HealthKitConfiguration {
    public static let typesToRead = Set([
                HKQuantityType.activeEnergyBurned,
                HKQuantityType.stepCount,
                HKQuantityType.heartRate])
    
    public static let typesToShare = Set([HKObjectType.workoutType(),
                        HKCategoryType.mindfulSession])
}

//
//  WorkoutConfiguratable.swift
//  Taichi
//
//  Created by 孙翔宇 on 05/02/2020.
//  Copyright © 2020 xiangyu sun. All rights reserved.
//

import Foundation
import HealthKit

public protocol WorkoutConfiguratable {
    var activity: Activity { get }
    var locationType: HKWorkoutSessionLocationType { get }
    var timerMinutes: UInt { get }
}

public enum Activity: UInt, CaseIterable {
    case taijiquan
    case taolu
    case jingzhuo
    case qigong
    case rougong
    case zazen
    case ukemi
    case tsuburi
    
    init(activityType: HKWorkoutActivityType) {
        switch activityType {
        case .taiChi:
            self = .taijiquan
        case .martialArts:
            self = .taolu
        case .mindAndBody:
            self = .qigong
        case .preparationAndRecovery:
            self = .rougong
        default:
            self = .taolu
        }
    }
    
    public var workoutType: HKWorkoutActivityType {
        switch self {
        case .taijiquan:
            return .taiChi
        case .taolu, .tsuburi:
            return .martialArts
        case .qigong, .jingzhuo, .zazen:
            return .mindAndBody
        case .rougong:
            return .preparationAndRecovery
        default:
            return .martialArts
        }
    }
    
    
    
    public var lapEnabled: Bool {
        switch workoutType {
        case .taiChi, .martialArts:
            return true
        default:
            return false
        }
    }
    
    public var timerEnabled: Bool {
        true
    }
}

public struct WorkoutConfiguration: WorkoutConfiguratable {
    public var activity: Activity
    public var locationType: HKWorkoutSessionLocationType
    public var timerMinutes: UInt
    public static let allActivities = Activity.allCases
    
    public var timerInterval: Double {
         Double(timerMinutes) * 60 * Double.random(in: 1.00...1.33)
    }
    
    public static var `default`: WorkoutConfiguration {
        return WorkoutConfiguration(activity: allActivities[0], locationType: .unknown, timerMinutes: timerSettings[0])
    }
    
    public static func configuration(_ config: HKWorkoutConfiguration) -> WorkoutConfiguration {
        return WorkoutConfiguration(activity: Activity(activityType: config.activityType), locationType: config.locationType, timerMinutes: timerSettings[0])
    }
    
    public func buildHKWorkoutConfiguration() -> HKWorkoutConfiguration {
        let config = HKWorkoutConfiguration()
        config.activityType = activity.workoutType
        config.locationType = locationType
        return config
    }
    
    public static let locationTypes: [HKWorkoutSessionLocationType] = [.indoor, .outdoor]
    public static let timerSettings: [UInt] =  [0, 5, 10, 20, 40, 60]
    
}

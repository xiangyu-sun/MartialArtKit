/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 Utilites for workout management and string formatting.
 */

import Foundation
import HealthKit

public extension Activity {
    var loclaizedName: String {
        let name: String
        switch self {
        case .taijiquan:
            name = .taichi
        case .taolu:
            name = .taolu
        case .qigong:
            name = .qigong
        case .jingzhuo:
            name = .jingzhuo
        case .rougong:
            name = .rougong
        case .ukemi:
            name = .ukemi
        case .zazen:
            name = .zazen
        case .tsuburi:
            name = .tsuburi
        }
        return name
    }
}

public extension HKWorkoutSessionLocationType {
    var loclaizedName: String {
        let name: String
        switch self {
        case .indoor:
            name = .indoor
        case .outdoor:
            name = .outdoor
        default:
            name = .unknown
        }
        return name
    }
}

public func format(energy: HKQuantity) -> String {
    return String.localizedStringWithFormat(.calariesFormat, energy.doubleValue(for: HKUnit.kilocalorie()))
}

public func format(minutes: UInt) -> String {
    return String.localizedStringWithFormat(.minuteFormat, minutes)
}

public func format(heartRate: HKQuantity) -> String {
    return String.localizedStringWithFormat(.heartRateFormat, heartRate.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute())))
}


public func format(duration: TimeInterval) -> String {
    let durationFormatter = DateComponentsFormatter()
    durationFormatter.unitsStyle = .positional
    durationFormatter.allowedUnits = [.second, .minute, .hour]
    durationFormatter.zeroFormattingBehavior = .pad
    
    if let string = durationFormatter.string(from: duration) {
        return string
    } else {
        return ""
    }
}

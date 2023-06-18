//
//  Interface.swift
//  Taichi
//
//  Created by 孙翔宇 on 03/08/2019.
//  Copyright © 2019 xiangyu sun. All rights reserved.
//

import Foundation

// MARK: - Quantity

extension Bundle {
    static var frameworkBundle: Bundle {
        return Bundle(for: HealthKitConfiguration.self)
    }
}

public extension String {
    
    static let calariesFormat = NSLocalizedString("%.1f calorie(s)", bundle: .frameworkBundle, comment: "")
    static let minuteFormat = NSLocalizedString("%d minute(s)", bundle: .frameworkBundle, comment: "")
    static let heartRateFormat = "%.1f BPM"
    
}

// MARK: - Categoryies

extension String {
    static let taichi = NSLocalizedString("Taichi", bundle: .frameworkBundle, comment: "")
    static let qigong =  NSLocalizedString("Qi Gong", bundle: .frameworkBundle, comment: "")
    static let jingzhuo =  NSLocalizedString("Jing Zhuo", bundle: .frameworkBundle, comment: "")
    static let zazen =  NSLocalizedString("Zazen", bundle: .frameworkBundle, comment: "")
    static let rougong =  NSLocalizedString("Rou Gong", bundle: .frameworkBundle, comment: "")
    static let taolu =  NSLocalizedString("Tao Lu", bundle: .frameworkBundle, comment: "")
    static let martialArts =  NSLocalizedString("Martial Arts", comment: "")
    static let tsuburi =  NSLocalizedString("Tsuburi", bundle: .frameworkBundle, comment: "")
    static let ukemi =  NSLocalizedString("Ukemi", bundle: .frameworkBundle, comment: "")
    static let preparationAndRecovery =  NSLocalizedString("Preparation and Recovery", bundle: .frameworkBundle, comment: "")
    static let others =  NSLocalizedString("Others", bundle: .frameworkBundle, comment: "")
}

// MARK: - Location

extension String {
    static let indoor = NSLocalizedString("Indoor", bundle: .frameworkBundle, comment: "")
    static let outdoor = NSLocalizedString("Outdoor", bundle: .frameworkBundle, comment: "")
    static let unknown = NSLocalizedString("Unknown", bundle: .frameworkBundle, comment: "")
}

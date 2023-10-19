//
//  DeviceList.swift
//  DeviceListKit
//
//  Created by Igor Soares on 09/11/20.
//

import UIKit
/// Enum representing the different types of iOS devices available


// Link Helper
// https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model

public enum DeviceType: String, CaseIterable {
  case iPhone2G
  
  case iPhone3G
  case iPhone3GS
  
  case iPhone4
  case iPhone4S
  
  case iPhone5
  case iPhone5C
  case iPhone5S
  
  case iPhone6
  case iPhone6Plus
  
  case iPhone6S
  case iPhone6SPlus
  
  case iPhoneSE
  case iPhoneSEGen2
  case iPhoneSEGen3
  
  case iPhone7
  case iPhone7Plus
  
  case iPhone8
  case iPhone8Plus
  
  case iPhoneX
  
  case iPhoneXS
  case iPhoneXSMax
  case iPhoneXR
  
  case iPhone11
  case iPhone11Pro
  case iPhone11ProMax
  
  case iPhone12Mini
  case iPhone12
  case iPhone12Pro
  case iPhone12ProMax
  
  case iPhone13Mini
  case iPhone13
  case iPhone13Pro
  case iPhone13ProMax
  
  case iPhone14
  case iPhone14Plus
  case iPhone14Pro
  case iPhone14ProMax
  
  case iPhone15
  case iPhone15Plus
  case iPhone15Pro
  case iPhone15ProMax
  
  case iPodTouch1G
  case iPodTouch2G
  case iPodTouch3G
  case iPodTouch4G
  case iPodTouch5G
  case iPodTouch6G
  case iPodTouch7G
  
  case iPad
  case iPad2
  case iPad3
  case iPad4
  case iPad5
  case iPad6
  case iPad7
  case iPad8
  case iPad9
  case iPad10Gen
  case iPadMini
  case iPadMiniRetina
  case iPadMini3
  case iPadMini4
  case iPadMini5
  case iPadMini6
  
  case iPadAir
  case iPadAir2
  case iPadAir3
  case iPadAir4
  case iPadAir5
  
  case iPadPro9Inch
  case iPadPro10p5Inch
  case iPadPro11Inch
  case iPadPro12Inch
  
  case simulator
  case notAvailable
  
  public enum GroupType {
    case iPad
    case dynamicIsland
    case notch
    case large
    case medium
    case small
    case iPod
    case notAvailable
  }
  
  public var group: GroupType {
    switch self {
    case .iPad, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPad7, .iPad8, .iPad9, .iPad10Gen,
         .iPadMini, .iPadMiniRetina, .iPadMini3, .iPadMini4, .iPadMini5, .iPadMini6,
         .iPadAir, .iPadAir2, .iPadAir3, .iPadAir4, .iPadPro9Inch, .iPadPro10p5Inch, .iPadPro11Inch, .iPadPro12Inch:
      return .iPad
      
    case .iPhone14, .iPhone14Plus, .iPhone14Pro, .iPhone14ProMax, .iPhone15, .iPhone15Pro, .iPhone15Plus, .iPhone15ProMax:
      return .dynamicIsland
    
    case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax,
         .iPhone11, .iPhone11Pro, .iPhone11ProMax,
         .iPhone12Mini, .iPhone12, .iPhone12Pro, .iPhone12ProMax,
        .iPhone13Mini, .iPhone13, .iPhone13Pro, .iPhone13ProMax:
      return .notch
      
    case .iPhone6Plus, .iPhone6SPlus, .iPhone7Plus, .iPhone8Plus:
      return .large
      
    case .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhoneSEGen2, .iPhoneSEGen3:
      return .medium
      
    case .iPhone2G, .iPhone3G, .iPhone3GS, .iPhone4, .iPhone4S, .iPhone5, .iPhone5S, .iPhone5C, .iPhoneSE:
      return .small
      
    case .iPodTouch1G, .iPodTouch2G, .iPodTouch3G, .iPodTouch4G, .iPodTouch5G, .iPodTouch6G, .iPodTouch7G:
      return .iPod
      
    default:
      return .notAvailable
    }
  }
  
  public static var isSimulator: Bool {
    return TARGET_OS_SIMULATOR != 0
  }
  
  public static var current: DeviceType {
    var identifier: String = ""
    if isSimulator {
      identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? ""
    } else {
      var size: size_t = 0
      sysctlbyname("hw.machine", nil, &size, nil, 0)
      var machine = [CChar](repeating: 0, count: size)
      sysctlbyname("hw.machine", &machine, &size, nil, 0)
      identifier = String(cString: machine, encoding: .utf8)!
    }
    return DeviceType(identifier: identifier)
  }
  
  public var displayName: String {
    switch self {
    case .iPhone2G: return "iPhone 2G"
    case .iPhone3G: return "iPhone 3G"
    case .iPhone3GS: return "iPhone 3GS"
    case .iPhone4: return "iPhone 4"
    case .iPhone4S: return "iPhone 4S"
    case .iPhone5: return "iPhone 5"
    case .iPhone5C: return "iPhone 5C"
    case .iPhone5S: return "iPhone 5S"
    case .iPhone6Plus: return "iPhone 6 Plus"
    case .iPhone6: return "iPhone 6"
    case .iPhone6S: return "iPhone 6S"
    case .iPhone6SPlus: return "iPhone 6S Plus"
    case .iPhoneSE: return "iPhone SE"
    case .iPhone7: return "iPhone 7"
    case .iPhone7Plus: return "iPhone 7 Plus"
    case .iPhone8: return "iPhone 8"
    case .iPhone8Plus: return "iPhone 8 Plus"
    case .iPhoneX: return "iPhone X"
    case .iPhoneXS: return "iPhone XS"
    case .iPhoneXSMax: return "iPhone XS Max"
    case .iPhoneXR: return "iPhone XR"
    case .iPhone11: return "iPhone 11"
    case .iPhone11Pro: return "iPhone 11 Pro"
    case .iPhone11ProMax: return "iPhone 11 Pro Max"
    case .iPhone12Mini: return "iPhone 12 Mini"
    case .iPhone12: return "iPhone 12"
    case .iPhone12Pro: return "iPhone 12 Pro"
    case .iPhone12ProMax: return "iPhone 12 Pro Max"
    case .iPhone13Mini: return "iPhone 13 Mini"
    case .iPhone13: return "iPhone 13"
    case .iPhone13Pro: return "iPhone 13 Pro"
    case .iPhone13ProMax: return "iPhone 13 Pro Max"
    case .iPhone14: return "iPhone 14"
    case .iPhone14Plus: return "iPhone 14 Plus"
    case .iPhone14Pro: return "iPhone 14 Pro"
    case .iPhone14ProMax: return "iPhone 14 Pro Max"
    case .iPhoneSEGen2: return "iPhone SE (2nd Gen)"
    case .iPhoneSEGen3: return "iPhone SE (3rd Gen)"
    case .iPodTouch1G: return "iPod Touch 1G"
    case .iPodTouch2G: return "iPod Touch 2G"
    case .iPodTouch3G: return "iPod Touch 3G"
    case .iPodTouch4G: return "iPod Touch 4G"
    case .iPodTouch5G: return "iPod Touch 5G"
    case .iPodTouch6G: return "iPod Touch 6G"
    case .iPodTouch7G: return "iPod Touch 7G"
    case .iPad: return "iPad"
    case .iPad2: return "iPad 2"
    case .iPad3: return "iPad 3"
    case .iPad4: return "iPad 4"
    case .iPad5: return "iPad 5"
    case .iPad6: return "iPad 6"
    case .iPad7: return "iPad 7"
    case .iPad8: return "iPad 8"
    case .iPad9: return "iPad 9"
    case .iPad10Gen: return "iPad (10th Gen)"
    case .iPadMini: return "iPad Mini"
    case .iPadMiniRetina: return "iPad Mini Retina"
    case .iPadMini3: return "iPad Mini 3"
    case .iPadMini4: return "iPad Mini 4"
    case .iPadMini5: return "iPad Mini 5"
    case .iPadMini6: return "iPad Mini 6"
    case .iPadAir: return "iPad Air"
    case .iPadAir2: return "iPad Air 2"
    case .iPadAir3: return "iPad Air 3"
    case .iPadAir4: return "iPad Air 4"
    case .iPadAir5: return "iPad Air 5"
    case .iPadPro9Inch: return "iPad Pro 9 Inch"
    case .iPadPro10p5Inch: return "iPad Pro 10.5 Inch"
    case .iPadPro11Inch: return "iPad Pro 11 Inch"
    case .iPadPro12Inch: return "iPad Pro 12 Inch"
    case .simulator: return "Simulator"
    case .notAvailable: return "Not Available"
    case .iPhone15: return "iPhone 15"
    case .iPhone15Plus: return "iPhone 15 Plus"
    case .iPhone15Pro: return "iPhone 15 Pro"
    case .iPhone15ProMax: return "iPhone 15 Pro Max"
    }
  }
  
  /// The identifiers associated with each device type
  var identifiers: [String] {
    switch self {
    case .notAvailable: return []
    case .simulator: return ["i386", "x86_64"]
      
    case .iPhone2G: return ["iPhone1,1"]
      
    case .iPhone3G: return ["iPhone1,2"]
      
    case .iPhone3GS: return ["iPhone2,1"]
      
    case .iPhone4: return ["iPhone3,1", "iPhone3,2", "iPhone3,3"]
      
    case .iPhone4S: return ["iPhone4,1"]
      
    case .iPhone5: return ["iPhone5,1", "iPhone5,2"]
      
    case .iPhone5C: return ["iPhone5,3", "iPhone5,4"]
    case .iPhone5S: return ["iPhone6,1", "iPhone6,2"]
      
    case .iPhone6: return ["iPhone7,2"]
    case .iPhone6Plus: return ["iPhone7,1"]
      
    case .iPhone6S: return ["iPhone8,1"]
    case .iPhone6SPlus: return ["iPhone8,2"]
      
    case .iPhone7: return ["iPhone9,1", "iPhone9,3"]
    case .iPhone7Plus: return ["iPhone9,2", "iPhone9,4"]
      
    case .iPhone8: return ["iPhone10,1", "iPhone10,4"]
    case .iPhone8Plus: return ["iPhone10,2", "iPhone10,5"]
    case .iPhoneX: return ["iPhone10,3", "iPhone10,6"]
      
    case .iPhoneXS: return ["iPhone11,2"]
    case .iPhoneXSMax: return ["iPhone11,4", "iPhone11,6"]
    case .iPhoneXR: return ["iPhone11,8"]
      
    case .iPhone11: return ["iPhone12,1"]
    case .iPhone11Pro: return ["iPhone12,3"]
    case .iPhone11ProMax: return ["iPhone12,5"]
      
    case .iPhone12Mini: return ["iPhone13,1"]
    case .iPhone12: return ["iPhone13,2"]
    case .iPhone12Pro: return ["iPhone13,3"]
    case .iPhone12ProMax: return ["iPhone13,4"]
      
    case .iPhone13Mini: return ["iPhone14,4"]
    case .iPhone13: return ["iPhone14,5"]
    case .iPhone13Pro: return ["iPhone14,2"]
    case .iPhone13ProMax: return ["iPhone14,3"]
      
    case .iPhone14: return ["iPhone14,7"]
    case .iPhone14Plus: return ["iPhone14,8"]
    case .iPhone14Pro: return ["iPhone15,2"]
    case .iPhone14ProMax: return ["iPhone15,3"]
      
    case .iPhone15: return ["iPhone15,4"]
    case .iPhone15Plus: return ["iPhone15,5"]
    case .iPhone15Pro: return ["iPhone16,1"]
    case .iPhone15ProMax: return ["iPhone16,2"]
      
    case .iPhoneSE: return ["iPhone8,4"]
    case .iPhoneSEGen2: return ["iPhone12,8"]
    case .iPhoneSEGen3: return ["iPhone14,6"]
      
    case .iPodTouch1G: return ["iPod1,1"]
    case .iPodTouch2G: return ["iPod2,1"]
    case .iPodTouch3G: return ["iPod3,1"]
    case .iPodTouch4G: return ["iPod4,1"]
    case .iPodTouch5G: return ["iPod5,1"]
    case .iPodTouch6G: return ["iPod7,1"]
    case .iPodTouch7G: return ["iPod9,1"]
      
    case .iPad: return ["iPad1,1", "iPad1,2"]
    case .iPad2: return ["iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"]
    case .iPad3: return ["iPad3,1", "iPad3,2", "iPad3,3"]
    case .iPad4: return ["iPad3,4", "iPad3,5", "iPad3,6"]
    case .iPad5: return ["iPad6,11", "iPad6,12"]
    case .iPad6: return ["iPad7,5", "iPad7,6"]
    case .iPad7: return ["iPad7,11", "iPad7,12"]
    case .iPad8: return ["iPad11,6", "iPad11,7"]
    case .iPad9: return ["iPad12,1", "iPad12,2"]
    case .iPad10Gen: return ["iPad13,18", "iPad13,19"]
      
    case .iPadMini: return ["iPad2,5", "iPad2,6", "iPad2,7"]
    case .iPadMiniRetina: return ["iPad4,4", "iPad4,5", "iPad4,6"]
    case .iPadMini3: return ["iPad4,7", "iPad4,8", "iPad4,9"]
    case .iPadMini4: return ["iPad5,1", "iPad5,2"]
    case .iPadMini5: return ["iPad11,1", "iPad11,2"]
    case .iPadMini6: return ["iPad14,1", "iPad14,2"]
      
    case .iPadAir: return ["iPad4,1", "iPad4,2", "iPad4,3"]
    case .iPadAir2: return ["iPad5,3", "iPad5,4"]
    case .iPadAir3: return ["iPad11,3", "iPad11,4"]
    case .iPadAir4: return ["iPad13,1", "iPad13,2"]
    case .iPadAir5: return ["iPad13,16", "iPad13,17"]
      
    case .iPadPro9Inch: return ["iPad6,3", "iPad6,4"]
    case .iPadPro10p5Inch: return ["iPad7,3", "iPad7,4"]
    case .iPadPro11Inch: return ["iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4", "iPad8,9", "iPad8,10"]
    case .iPadPro12Inch: return ["iPad6,7", "iPad6,8", "iPad7,1", "iPad7,2", "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8", "iPad8,11", "iPad8,12", "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11", "iPad14,5", "iPad14,6"]
    }
  }
  
  // MARK: Inits
  /// Creates a device type
  ///
  /// - Parameter identifier: The identifier of the device
  init(identifier: String) {
    for device in DeviceType.allCases {
      for deviceId in device.identifiers {
        guard identifier == deviceId else { continue }
        self = device
        return
      }
    }
    
    self = .notAvailable
  }
}

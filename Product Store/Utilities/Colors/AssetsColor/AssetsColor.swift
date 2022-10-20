//
//  File.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//
import Foundation
import UIKit

enum AssetsColor {
   case MainColor
   case BorderColor
   case BackGroundColor
   case MainFontColor
   case SecondFontColor
   case SubSecondFontColor
}

extension UIColor {

    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .MainColor:
            return UIColor(named: "MainColor")
        case .BorderColor:
            return UIColor(named: "BorderColor")
        case .BackGroundColor:
            return UIColor(named: "BackGroundColor")
        case .MainFontColor:
            return UIColor(named: "MainFontColor")
        case .SecondFontColor:
            return UIColor(named: "SecondFontColor")
        case .SubSecondFontColor:
            return UIColor(named: "SubSecondFontColor")
        }
    }
}


//
//  Storyboard.swift
//  Project
//
//  Created by Ahmed Elmemy on 11/07/2022.
//

import UIKit
import Localize_Swift

public enum Storyboard: String {
    //storyBoards in APP
    
    case Main

    public func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        var detectLang: String!
        if Localize.currentLanguage() == "en" {
            detectLang = "Base"
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        } else if Localize.currentLanguage() == "ar" {
            detectLang = "Base"
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        let path = Bundle.main.path(forResource: detectLang , ofType: "lproj")
        let bundd = Bundle.init(path: path!)
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: bundd)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
}

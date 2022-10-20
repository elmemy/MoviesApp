//
//  UIViewController.swift
//  Project
//
//  Created by Ahmed Elmemy on 11/07/2022.
//

import UIKit
extension UIViewController {
    
    
    func hadelNavigationBarView(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: AppFonts.Regular(size: 17),NSAttributedString.Key.foregroundColor: UIColor.appColor(.MainFontColor)!]
    }
    
  
    
    // present
    func presentDetails(viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    // dismiss
    func dismissDetails() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    
    public static var defaultNib: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    public static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}

extension UIView {
    func AuthBackgroundRoundCorner() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 50
        self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
}

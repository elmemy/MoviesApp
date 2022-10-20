//
//  NoIntrnetViewController.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import UIKit

class NoIntrnetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissAction(_ sender: Any) {
        let vc = Storyboard.Main.instantiate(MovieViewController.self)
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        let configurator = MovieConfiguratorImplementation()
        configurator.configure(MovieViewController: vc)
        self.view.window?.rootViewController = nav
    }
   

}

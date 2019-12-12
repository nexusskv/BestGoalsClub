//
//  Router.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class Router {

    static func present(_ vc: String, from parent: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let child = storyboard.instantiateViewController(withIdentifier: vc + "ViewController")
        parent.present(child, animated: true, completion: nil)
    }
    
    static func dismiss(_ vc: UIViewController) {
        vc.dismiss(animated: true, completion: nil)
    }
}

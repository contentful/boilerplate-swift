//
//  ViewController.swift
//  Boilerplate
//
//  Created by JP Wright on 31/01/2017.
//  Copyright © 2017 Contentful. All rights reserved.
//

import UIKit
import Contentful

class ViewController: UIViewController {

    let client: Client

    // MARK: Initialization

    init() {
        self.client = Client(spaceIdentifier: "cfexampleapi", accessToken: "b4c0n73n7fu1")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

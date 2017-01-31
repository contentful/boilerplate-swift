//
//  ViewController.swift
//  Boilerplate
//
//  Created by JP Wright on 31/01/2017.
//  Copyright © 2017 Contentful. All rights reserved.
//

import UIKit
import Contentful
import Interstellar

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


        // Fetch space
        client.fetchSpace { [weak self] (result: Result<Space>) in

            // This callback is where your network response will be handled
            // If you're going to update the UI...make sure to delegate back to the main thread.
            switch result {
            case .success(let space):
                print("Fetched space with name \(space.name)")
            case .error(let error):
                self?.handle(error: error)
            }
        }

        // Fetch entries
        client.fetchEntries(matching: ["limit": 5]) { [weak self] (result: Result<Contentful.Array<Entry>>) in
            switch result {
            case .success(let entries):
                print("Printing Entries")
                entries.items.forEach { entry in
                    print(entry.identifier)
                }

            case .error(let error):
                self?.handle(error: error)
            }
        }
    }


    // MARK: Private

    func handle(error: Error) {
        print("Uh oh, something went wrong. You can do what you want with this \(error)")
    }
}

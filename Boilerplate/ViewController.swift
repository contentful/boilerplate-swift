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

/**
 * The Space Id and access_token for your Contentful space. Copy paste your space id,
 * and your CDA API key (access token) to replace the variables below and see your data in the console.
 */
let SPACE_ID = "cfexampleapi"
let ACCESS_TOKEN = "b4c0n73n7fu1"

class ViewController: UIViewController {

    /**
     * We must initialize a Contentful.Client object to infterface with the Contentful CDA.
     * In this case, it's an instance variable on our viewController.
     */
    let client: Client = Client(spaceIdentifier: SPACE_ID, accessToken: ACCESS_TOKEN)
    
    override func viewDidLoad() {
        super.viewDidLoad()


        /**
         * All of the Client methods to retrieve content from the API are prefixed with `fetch`
         * They use asynchronous callbacks to handle the responses. The response has a Result enum
         * which encapsulates the returned value if the request was successful, or the error if the 
         * request failed.
         * Don't forget to delegate to the main thread if you are going to update the UI with the content!
         */
        client.fetchSpace { [weak self] (result: Result<Space>) in

            // This callback is where your network response will be handled
            // If you're going to update the UI...make sure to delegate back to the main thread.
            switch result {
            case .success(let space):
                print("==================Printing space==================")
                print("Fetched space with the name \(space.name)")
                print("===============Done Printing space================")
            case .error(let error):
                self?.handle(error: error)
            }
        }

        /**
         * Similar to `fetchSpace` fetchEntries returns a Result, but this time containing a Contentful
         * Array of Entry objects.
         */
        client.fetchEntries(matching: ["limit": 100]) { [weak self] (result: Result<Contentful.Array<Entry>>) in
            switch result {
            case .success(let entries):
                print("=================Printing Entries=================")
                entries.items.forEach { entry in
                    print(entry.identifier)
                }
                print("==============Done Printing Entries===============")
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

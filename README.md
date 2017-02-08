# boilerplate-swift

This is a sample app demonstrating basic usage of the [contentful.swift](https://github.com/contentful/contentful.swift) Content Delivery API SDK.

Upon launch, the app:

- Initializes a `Client` object.
- Fetches a `Space`.
- Fetches up to 100 `Entry` objects from that `Space`.

## Using the app

1. Clone the repo, and open _Boilerplate-Swift.xcworkspace_.
2. Copy/paste your `space_id` and `access_token` into the global constants defined in the _ViewController_ file ([source here](https://github.com/contentful/boilerplate-swift/blob/master/Boilerplate/ViewController.swift)).
3. Hit "Run" in Xcode, follow along with the comments, and view the relevant output in the Xcode debug console.

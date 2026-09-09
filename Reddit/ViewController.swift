//
//  ViewController.swift
//  Reddit
//

import UIKit

class ViewController: UIViewController {
    
    let network = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        network.execute(endpoint: .home) { result in
            let page: Page? = try? result.get()
            print(page?.posts.first?.title)
        }
    }


}


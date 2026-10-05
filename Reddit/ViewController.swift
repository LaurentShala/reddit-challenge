//
//  ViewController.swift
//  Reddit
//

import UIKit

class ViewController: UIViewController {
    
    let service = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        service.execute(endpoint: .home) { result in
            switch result {
            case .success(let response):
                print(response.posts)
            case .failure:
                print("error!!!!")
            }
        }
    }
    
}


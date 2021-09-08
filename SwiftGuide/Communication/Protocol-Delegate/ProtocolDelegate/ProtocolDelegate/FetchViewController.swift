//
//  FeatchViewController.swift
//  ProtocolDelegate
//
//  Created by Joshua Taylor on 9/7/21.
//

import UIKit

protocol FetchViewControllerDelegate: AnyObject {
    func buttonPressed(fetchViewController: FetchViewController, value: String)
}

class FetchViewController: UIViewController {

    weak var fetchViewControllerDelegate: FetchViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func FetchData(_ sender: Any) {
        fetchViewControllerDelegate?.buttonPressed(fetchViewController: self, value: "\"Hi, From FetchViewControllerDelegate\"")
        self.navigationController?.popViewController(animated: true)
    }
    
}

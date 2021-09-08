//
//  ViewController.swift
//  ProtocolDelegate
//
//  Created by Joshua Taylor on 9/7/21.
//

import UIKit

class ViewController: UIViewController, FetchViewControllerDelegate  {

    

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var fetchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func fetch(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Fetch") as? FetchViewController
        vc?.fetchViewControllerDelegate = self
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func buttonPressed(fetchViewController: FetchViewController, value: String) {
        self.infoLabel.text = "value from FetchViewController is \(value)"
    }
    
    

}


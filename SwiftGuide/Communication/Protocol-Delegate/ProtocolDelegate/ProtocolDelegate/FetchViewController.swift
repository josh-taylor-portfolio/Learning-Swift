//
//  FeatchViewController.swift
//  ProtocolDelegate
//
//  Created by Joshua Taylor on 9/7/21.
//

import UIKit

class FetchViewController: UIViewController {

    let cryptoRateService: CryptoRateService = CryptoRateService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func FetchData(_ sender: Any) {
        cryptoRateService.fetchCryptoRate()
        self.navigationController?.popViewController(animated: true)
    }
    
}

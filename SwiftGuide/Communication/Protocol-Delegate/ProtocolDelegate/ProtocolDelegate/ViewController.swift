//
//  ViewController.swift
//  ProtocolDelegate
//
//  Created by Joshua Taylor on 9/7/21.
//

import UIKit

class ViewController: UIViewController, CryptoServiceDelegate  {
    

    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var fetchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func fetch(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Fetch") as? FetchViewController
        vc?.cryptoRateService.delegate = self
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func didFetchCyrptoPrice(cryptoService: CryptoRateService, cyrptoRate: CryptoRate) {
        priceLable.text = "Crypto Symbol: \(cyrptoRate.symbol) is $\(cyrptoRate.rate)"
    }
    

}


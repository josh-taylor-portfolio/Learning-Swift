//
// Created by Joshua Taylor on 9/13/21.
//

import Foundation
import UIKit


func createUIAlertControllerWithOkayAction(title: String, message: String) -> UIAlertController {

    let alert = UIAlertController(title: title,
            message: message,
            preferredStyle: .alert)

    let okayAction = UIAlertAction(title: "Okay", style: .default)

    alert.addAction(okayAction)

    return alert
}

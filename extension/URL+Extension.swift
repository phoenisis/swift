//
//  URL+Extension.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 04/03/2019.
//  Copyright © 2019 Utils. All rights reserved.
//

import UIKit

extension URL {
    
    func openInSafari() {
        if UIApplication.shared.canOpenURL(self) {
            UIApplication.shared.open(self)
        }
    }
    
    mutating func addSkipBackupAttribute() throws {
        var values: URLResourceValues = URLResourceValues()
        values.isExcludedFromBackup = true
        try setResourceValues(values)
    }
    
    func share(from controller: UIViewController, fromButton: UIButton? = nil) {
        let activityController: UIActivityViewController = UIActivityViewController(activityItems: [self], applicationActivities: nil)
        if let button = fromButton {
            activityController.popoverPresentationController?.setSourceButton(button)
        }
        controller.present(activityController, animated: true, completion: nil)
    }
    
}

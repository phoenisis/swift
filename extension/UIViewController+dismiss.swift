//
//  UIViewController+Dismiss.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 04/03/2019.
//  Copyright © 2019 Utils. All rights reserved.
//

import UIKit

extension UIViewController {
    func popOrDismiss() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

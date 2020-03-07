//
//  UIImageView+KF.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 19/12/2018.
//  Copyright © 2018 Utils. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
	var urlString: String? {
		get {
			return nil
		}
		set (urlString) {
			if let urlString = urlString {
				self.url = URL(string: urlString)
			} else {
				self.image = UIImage(named: "placeholder_image")
			}
		}
	}
	
	var url: URL? {
		get {
			return nil
		}
		set (url) {
			if let url = url {
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder_image"),
            transition: .fadeIn(duration: 0.33)
        )
        Nuke.loadImage(with: url, options: options, into: self)
			} else {
				self.image = UIImage(named: "placeholder_image")
			}
		}
	}

}

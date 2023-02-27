//  UIView+addView.swift
//  Nikita Rekaev 10.02.2023

import UIKit

extension UIView {
    
    /// addSubview + TAMIC = false
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

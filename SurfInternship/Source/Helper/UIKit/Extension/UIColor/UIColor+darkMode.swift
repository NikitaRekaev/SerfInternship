//  UIColor+darkMode.swift
//  Nikita Rekaev 12.02.2023

import UIKit

extension UIColor {

    static func color(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor {
            $0.userInterfaceStyle == .dark ? dark : light
        }
    }

}

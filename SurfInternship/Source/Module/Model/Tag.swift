//  Tag.swift
//  Nikita Rekaev 10.02.2023

enum Tag {
    case ios
    case android
    case design
    case flutter
    case frontend
    case backend
    case analytists
    case qa
    case pm
    case hr
}

// MARK: - Localizble

extension Tag: CaseIterable {

    var title: String {
        switch self {
            case .ios:
                return Localizable.Tab.ios
            case .android:
                return Localizable.Tab.android
            case .design:
                return Localizable.Tab.design
            case .flutter:
                return Localizable.Tab.flutter
            case .frontend:
                return Localizable.Tab.frontend
            case .backend:
                return Localizable.Tab.backend
            case .analytists:
                return Localizable.Tab.analytists
            case .qa:
                return Localizable.Tab.qa
            case .pm:
                return Localizable.Tab.pm
            case .hr:
                return Localizable.Tab.hr
        }
    }

}

// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localizable {
  internal enum Button {
    /// Отправить заявку
    internal static let send = Localizable.tr("Localizable", "button.send", fallback: "Отправить заявку")
  }
  internal enum Label {
    /// Хочешь к нам?
    internal static let offers = Localizable.tr("Localizable", "label.offers", fallback: "Хочешь к нам?")
    /// Localizable.strings
    ///   SerfInternship
    /// 
    ///   Created by Nikita Rekaev on 10.02.2023.
    internal static let title = Localizable.tr("Localizable", "label.title", fallback: "Стажировка в Surf")
    internal enum Subtitle {
      /// Получай стипендию, выстраивай удобный график,
      ///  работай на современном железе.
      internal static let middle = Localizable.tr("Localizable", "label.subtitle.middle", fallback: "Получай стипендию, выстраивай удобный график,\n работай на современном железе.")
      /// Работай над реальными задачами под руководством
      ///  опытного наставника и получи возможность
      ///  стать частью команды мечты.
      internal static let top = Localizable.tr("Localizable", "label.subtitle.top", fallback: "Работай над реальными задачами под руководством\n опытного наставника и получи возможность\n стать частью команды мечты.")
    }
  }
  internal enum Tab {
    /// Analytists
    internal static let analytists = Localizable.tr("Localizable", "tab.analytists", fallback: "Analytists")
    /// Android
    internal static let android = Localizable.tr("Localizable", "tab.android", fallback: "Android")
    /// Backend
    internal static let backend = Localizable.tr("Localizable", "tab.backend", fallback: "Backend")
    /// Design
    internal static let design = Localizable.tr("Localizable", "tab.design", fallback: "Design")
    /// Flutter
    internal static let flutter = Localizable.tr("Localizable", "tab.flutter", fallback: "Flutter")
    /// Frontend
    internal static let frontend = Localizable.tr("Localizable", "tab.frontend", fallback: "Frontend")
    /// HR
    internal static let hr = Localizable.tr("Localizable", "tab.hr", fallback: "HR")
    /// iOS
    internal static let ios = Localizable.tr("Localizable", "tab.ios", fallback: "iOS")
    /// PM
    internal static let pm = Localizable.tr("Localizable", "tab.pm", fallback: "PM")
    /// QA
    internal static let qa = Localizable.tr("Localizable", "tab.qa", fallback: "QA")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizable {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type

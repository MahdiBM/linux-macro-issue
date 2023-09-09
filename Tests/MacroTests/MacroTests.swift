import UnstableEnumMacro
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

class UnstableEnumMacroTests: XCTestCase {

    let macros: [String: any Macro.Type] = [
        "UnstableEnum": UnstableEnum.self
    ]

    func testStringEnum() throws {
        assertMacroExpansion(
            """
            @UnstableEnum<String>
            enum MyEnum: RawRepresentable {
                case a
                case b // bb
            }
            """,
            expandedSource: """

            enum MyEnum: RawRepresentable {
                case a
                case b // bb

                case unknown(String)

                /// This case serves as a way of discouraging exhaustive switch statements
                case __DO_NOT_USE_THIS_CASE

                var rawValue: String {
                    switch self {
                    case .a:
                        return "a"
                    case .b:
                        return "bb"
                    case let .unknown(value):
                        return value
                    case .__DO_NOT_USE_THIS_CASE:
                        fatalError("Must not use the '__DO_NOT_USE_THIS_CASE' case. This case serves as a way of discouraging exhaustive switch statements")
                    }
                }

                init?(rawValue: String) {
                    switch rawValue {
                    case "a":
                        self = .a
                    case "bb":
                        self = .b
                    default:
                        self = .unknown(rawValue)
                    }
                }
            }

            extension MyEnum: RawRepresentable, LosslessRawRepresentable {
            }
            """,
            macros: macros
        )
    }
}

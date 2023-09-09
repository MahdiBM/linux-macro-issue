import UnstableEnumMacro
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

class UnstableEnumMacroTests: XCTestCase {

    let macros: [String: any Macro.Type] = [
        "UnstableEnum": UnstableEnum.self
    ]
}

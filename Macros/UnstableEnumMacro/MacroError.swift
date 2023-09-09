import SwiftDiagnostics

enum MacroError: String, Error {
    case isNotEnum
}

extension MacroError: DiagnosticMessage {
    var message: String {
        self.rawValue
    }

    var diagnosticID: SwiftDiagnostics.MessageID {
        .init(domain: "UnstableEnumMacro.MacroError", id: self.rawValue)
    }

    var severity: SwiftDiagnostics.DiagnosticSeverity {
        .error
    }
}

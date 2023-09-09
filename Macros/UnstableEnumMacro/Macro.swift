import SwiftSyntax
import SwiftDiagnostics
import SwiftSyntaxMacros

public struct UnstableEnum: ExtensionMacro {
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        if declaration.hasError { return [] }

        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else {
            throw MacroError.isNotEnum
        }

        let ext: ExtensionDeclSyntax = try ExtensionDeclSyntax("""
        extension \(raw: enumDecl.name.text): RawRepresentable { }
        """)

        return [ext]
    }
}

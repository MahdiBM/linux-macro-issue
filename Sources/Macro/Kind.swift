@UnstableEnum
public enum Kind: Sendable, Codable {
    case guildText

    public var rawValue: String {
        "1"
    }

    public init?(rawValue: String) {
        nil
    }

    func doSomething() {
        if Optional<Self>.some(.guildText) == .guildText {
            return
        }
    }
}

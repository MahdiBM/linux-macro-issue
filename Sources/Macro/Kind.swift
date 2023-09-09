@UnstableEnum<Int>
public enum Kind: Sendable, Codable {
    case guildText // 0
    case dm // 1
    case guildVoice // 2
    case groupDm // 3
    case guildCategory // 4
    case guildAnnouncement // 5
    case announcementThread // 10
    case publicThread // 11
    case privateThread // 12
    case guildStageVoice // 13
    case guildDirectory // 14
    case guildForum // 15

    func doSomething() {
        if Optional<Self>.some(.announcementThread) == .announcementThread {
            return
        }
    }
}

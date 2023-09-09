import UnstableEnumMacro

@attached(
    extension,
    conformances: RawRepresentable, Equatable, Hashable
)
macro UnstableEnum() = #externalMacro(module: "UnstableEnumMacro", type: "UnstableEnum")

//
//  SettingsStore.swift
//  ComplexSkeleton
//
//  Created by Andras Olah on 2026. 01. 01..
//

public final class SettingsStore {
    private let store: BaseStore<SettingsState>

    public init(initial: SettingsState = .initialValue()) {
        self.store = BaseStore(initialState: initial)
    }

    // Observation
    public func stateStream() async -> AsyncStream<SettingsState> {
        await store.stateStream()
    }

    public func snapshot() async -> SettingsState {
        await store.currentState()
    }

    // Mutations
    public func setColorScheme(_ scheme: ColorScheme) async {
        await store.update { state in
            state.colorScheme = scheme
        }
    }
}


//
//  AnyStore.swift
//  ComplexSkeleton
//
//  Created by Andras Olah on 2026. 01. 01..
//

import Foundation

public protocol StoreProtocol: Actor {
    associatedtype State: Sendable

    func stateStream() -> AsyncStream<State>
    func currentState() -> State
    func update(_ mutation: @Sendable (inout State) -> Void)
}

public final actor BaseStore<State: Sendable>: StoreProtocol {
    private var _state: State
    private var subscribers: [UUID: AsyncStream<State>.Continuation] = [:]
    
    public init(initialState: State) {
        _state = initialState
    }
    
    deinit {
        for (_, subscriber) in subscribers {
            subscriber.finish()
        }
    }
    
    public func stateStream() -> AsyncStream<State> {
        AsyncStream { continuation in
            let subscriber = UUID()
            Log.info("New subscriber: \(subscriber)")
            subscribers[subscriber] = continuation
            Log.info("Subscriber count: \(subscribers.count)")
            
            continuation.yield(_state)
            
            continuation.onTermination = { [weak self] _ in
                Log.info("Removing subscriber: \(subscriber)")
                Task { await self?.removeSubscriber(subscriber) }
            }
        }
    }
    
    public func update(_ mutation: @Sendable (inout State) -> Void) {
        mutation(&_state)
        for (_, s) in subscribers {
            Log.info("Alerting subscriber")
            s.yield(_state)
        }
    }

    public func currentState() -> State {
        return _state
    }
}

private extension BaseStore {
    func removeSubscriber(_ id: UUID) {
        subscribers.removeValue(forKey: id)
    }
}

//
//  Container.swift
//
//
//  Created by 김인섭 on 12/3/23.
//

import Foundation

public class Container {
    
    var registry = [String: Any]()
    
    public init() { }

    @discardableResult
    public func register<T>(_ build: () -> T) -> Self {
        let key = String(describing: T.self)
        registry[key] = build()
        return self
    }

    public func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let dependency = registry[key] as? T else {
            fatalError("No registered dependency found for \(key)")
        }
        return dependency
    }
}

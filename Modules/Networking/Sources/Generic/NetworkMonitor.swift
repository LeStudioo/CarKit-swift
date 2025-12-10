//
//  NetworkMonitor.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Network

@Observable
public final class NetworkMonitor: @unchecked Sendable {
    public static let shared = NetworkMonitor()
    
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    
    public var isConnected = false

    private init() {
        networkMonitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}

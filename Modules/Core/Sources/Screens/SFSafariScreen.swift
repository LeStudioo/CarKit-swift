//
//  SFSafariScreen.swift
//  Core
//
//  Created by Theo Sementa on 25/12/2025.
//

import SwiftUI
import SafariServices

public struct SFSafariScreen: UIViewControllerRepresentable {
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    public func updateUIViewController(
        _ uiViewController: SFSafariViewController,
        context: UIViewControllerRepresentableContext<SFSafariScreen>) {
        // No need to do anything here
    }
}

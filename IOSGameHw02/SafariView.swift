//
//  SafariView.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/20.
//

import SwiftUI
import SafariServices
struct SafariView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = SFSafariViewController
    let url: URL
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://google.com")!)
    }
}


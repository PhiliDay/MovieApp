//
//  ActivityIndicatorView.swift
//  Movies
//
//  Created by Philippa Day on 23/02/2021.
//

import SwiftUI

//Need to implement
struct ActivityIndicator: UIViewRepresentable {
    @Binding var animate: Bool

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

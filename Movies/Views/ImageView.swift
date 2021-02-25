//
//  ImageView.swift
//  Movies
//
//  Created by Philippa Day on 24/02/2021.
//

import Foundation
import SwiftUI

struct ImageWithURL: View {

    @ObservedObject var imageLoader: ImageLoaderAndCache

    init(_ url: String) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
    }

    var body: some View {
          Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

//struct BigImageWithURL: View {
//
//    @ObservedObject var imageLoader: ImageLoaderAndCache
//
//    init(_ url: String) {
//        imageLoader = ImageLoaderAndCache(imageURL: url)
//    }
//
//    var body: some View {
//          Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//    }
//}

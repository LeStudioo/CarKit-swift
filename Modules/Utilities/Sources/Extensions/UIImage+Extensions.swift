//
//  UIImage+Extensions.swift
//  Utilities
//
//  Created by Theo Sementa on 11/12/2025.
//

import Foundation
import UIKit

public extension UIImage {

    func dataSizeInBytes() -> Int? {
        guard let data = self.jpegData(compressionQuality: 1.0) else { return nil }
        return data.count
    }

    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let newSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        return self.preparingThumbnail(of: newSize)
    }

    func compress(to kBytes: Int, allowedMargin: CGFloat = 0.2) -> Data? {
        let bytes = kBytes * 1024
        let threshold = Int(CGFloat(bytes) * (1 + allowedMargin))
        var compression: CGFloat = 1.0
        let step: CGFloat = 0.05
        var holderImage = self
        while let data = holderImage.pngData() {
            let ratio = data.count / bytes
            if data.count < threshold {
                return data
            } else {
                let multiplier = CGFloat((ratio / 5) + 1)
                compression -= (step * multiplier)

                guard let newImage = self.resized(withPercentage: compression) else { break }
                holderImage = newImage
            }
        }
        return nil
    }

}

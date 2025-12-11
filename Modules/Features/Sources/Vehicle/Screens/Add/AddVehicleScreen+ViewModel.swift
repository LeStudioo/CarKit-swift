//
//  AddVehicleScreen+ViewModel.swift
//  Features
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models
import SwiftUI
import Stores

// MARK: - Stored variables
extension AddVehicleScreen {
    
    @Observable
    final class ViewModel {
        
        var motorization: MotorizationType = .thermal
        var customName: String = ""
        var brand: String = ""
        var model: String = ""
        
        var selectedUIImage: UIImage?
        var mileageAtStart: String = ""
        var year: String = ""
        
        var isStepTwo: Bool = false
        
        @ObservationIgnored
        @Dependency(\.vehicleStore) private var vehicleStore
        
    }
    
}

// MARK: - Computed variables
extension AddVehicleScreen.ViewModel {
    
    var actionButtonTitle: String { // TODO: TBL
        return isStepTwo ? "Valider" : "Next"
    }
    
    var isFirstStepValid: Bool {
        return brand.isNotEmpty && model.isNotEmpty && customName.isNotEmpty
    }
    
}

// MARK: - Public functions
extension AddVehicleScreen.ViewModel {
    
    @MainActor
    func onCancel(dismiss: DismissAction) {
        if isStepTwo {
            isStepTwo = false
        } else {
            dismiss()
        }
    }
    
    @MainActor
    func createVehicle(dismiss: DismissAction) async {
        var body = VehicleBody.create(
            brand: brand,
            model: model,
            customName: customName,
            imageData: nil,
            year: year.toInt(),
            motorization: motorization.rawValue
        )
        
        if let originalImage = selectedUIImage { // TODO: EDIT
            let targetAspectRatio: CGFloat = 16.0/9.0

            let scale = min(UIScreen.main.bounds.width / originalImage.size.width, 1.0)
            let scaledWidth = originalImage.size.width * scale
            let scaledHeight = originalImage.size.height * scale

            let cropHeight = scaledWidth / targetAspectRatio
            let cropY = (scaledHeight - cropHeight) / 2

            let renderer = UIGraphicsImageRenderer(size: CGSize(width: scaledWidth, height: cropHeight))
            let croppedImage = renderer.image { _ in
                let drawRect = CGRect(x: 0, y: -cropY, width: scaledWidth, height: scaledHeight)
                originalImage.draw(in: drawRect)
            }

            if let imageData = croppedImage.jpegData(compressionQuality: 0.9) {
                body.imageData = imageData
            }
        }
        
        await vehicleStore.create(body: body)
        dismiss()
    }
    
}

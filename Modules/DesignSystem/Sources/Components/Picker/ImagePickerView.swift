//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 11/12/2025.
//

import SwiftUI
import PhotosUI

public struct ImagePickerView: View {
    
    // MARK: Dependencies
    @Binding var selectedUIImage: UIImage?
    
    // MARK: States
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var isPhotoPickerPresented: Bool = false
    @State private var isLoading: Bool = false
    
    // MARK: Init
    public init(
        selectedUIImage: Binding<UIImage?>? = nil
    ) {
        self._selectedUIImage = selectedUIImage ?? .constant(nil)
    }
    
    // MARK: -
    public var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            Text("word_image_optional".localized)
                .customFont(.Text.Small.medium, color: .Gray.dark)
            
            if selectedUIImage != nil {
                Text("image_picker_recommended".localized)
                    .customFont(.Text.Small.regular, color: .Gray.mid)
            }
            
            Button {
                isPhotoPickerPresented.toggle()
            } label: {
                if let selectedUIImage {
                    Image(uiImage: selectedUIImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .overlay {
                            RoundedRectangle(cornerRadius: .medium, style: .continuous)
                                .fill(Color.clear)
                                .strokeBorder(Color.Gray.light, lineWidth: 2)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: .medium, style: .continuous))
                        .overlay(alignment: .topTrailing) {
                            Button {
                                self.selectedUIImage = nil
                                self.selectedPickerItem = nil
                            } label: {
                                IconView(asset: .iconXmark, color: .Base.white)
                                    .padding(.small)
                                    .background(Color.Error.primary, in: .circle)
                                    .offset(x: 20, y: -20)
                            }
                        }
                } else {
                    RoundedRectangle(cornerRadius: .medium, style: .continuous)
                        .fill(Color.Brand.light)
                        .strokeBorder(Color.Brand.primary, style: .init(lineWidth: 2, dash: [5]))
                        .frame(height: 200)
                        .overlay {
                            if isLoading {
                                ProgressView()
                                    .tint(Color.Brand.primary)
                            } else {
                                VStack(spacing: 8) {
                                    IconView(asset: .iconPicture, color: .Brand.primary)
                                    
                                    Text("image_picker_add".localized)
                                        .customFont(.Text.Medium.bold, color: .Brand.primary)
                                }
                            }
                        }
                }
            }
            .task(id: selectedPickerItem) {
                isLoading = true
                
                guard let imageData = try? await selectedPickerItem?.loadTransferable(type: Data.self),
                      let image = UIImage(data: imageData),
                      let newImageData = image.compress(to: 5000)
                else {
                    isLoading = false
                    return
                }
                
                selectedUIImage = UIImage(data: newImageData)
                isLoading = false
            }
        }
        .photosPicker(
            isPresented: $isPhotoPickerPresented,
            selection: $selectedPickerItem
        )
    }
}

// MARK: - Preview
#Preview {
    ImagePickerView(selectedUIImage: .constant(nil))
        .padding()
}

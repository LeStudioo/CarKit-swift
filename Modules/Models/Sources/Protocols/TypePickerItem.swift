//
//  TypePickerItem.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public protocol TypePickerItem: CaseIterable, RawRepresentable, Hashable where RawValue == String {
    var name: String { get }
}

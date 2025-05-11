//
//  Student.swift
//  Bookworm
//
//  Created by Omolemo Mashigo on 2025/05/11.
//

import Foundation
import SwiftData

@Model
class Student{
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

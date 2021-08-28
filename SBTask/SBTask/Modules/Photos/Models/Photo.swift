//
//  Photo.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

struct Photo: Identifiable, Codable, Hashable {
    var id: Int
    let title: String
    let thumbnailUrl: String
}

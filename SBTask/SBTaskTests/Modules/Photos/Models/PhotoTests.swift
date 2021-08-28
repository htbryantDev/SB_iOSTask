//
//  PhotoTest.swift
//  SBTaskTests
//
//  Created by Harry Bryant on 28/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

@testable import SBTask
import XCTest

class PhotoTests: XCTestCase {
    func testPhotoDecodedFromFullJSON() throws {
        let photo = try JSONDecoder().decode(Photo.self, from: validPhotoJSON)
        XCTAssertEqual(photo.id, 1)
        XCTAssertEqual(photo.title, "accusamus beatae ad facilis cum similique qui sunt")
        XCTAssertEqual(photo.thumbnailUrl, "https://via.placeholder.com/150/92c952")
    }
    
    func testPhotosDecodedFromArrayJSON() throws {
        let photos = try JSONDecoder().decode([Photo].self, from: MockData().photos)
        XCTAssertEqual(photos.count, 12)
    }
    
}

extension PhotoTests {
    var validPhotoJSON: Data {
        Data("""
            {
                "albumId": 1,
                "id": 1,
                "title": "accusamus beatae ad facilis cum similique qui sunt",
                "url": "https://via.placeholder.com/600/92c952",
                "thumbnailUrl": "https://via.placeholder.com/150/92c952"
            }
            """.utf8)
    }
}

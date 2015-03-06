//
//  ScavengerHuntItem.swift
//  Scavenger Hunt
//
//  Created by Zach Perry on 3/5/15.
//  Copyright (c) 2015 Zach Perry. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject {
    let name: String
    var photo: UIImage?
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    let nameKey = "Name"
    let photoKey = "Photo"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: photoKey)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodePropertyListForKey(nameKey) as String
        photo = aDecoder.decodePropertyListForKey(photoKey) as? UIImage
    }
    
    init(name myName: String) {
        self.name = myName
    }
}

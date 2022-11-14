//
//  Item.swift
//  ThummIt
//
//  Created by 이성준 on 2022/11/14.
//

import Foundation

protocol Item {
    
    var baseView : UIView { get set }
    var backgroundImageView : UIImageView { get set }
    
    var itemName : String { get set }
    var backgroundImageName : String { get set }
    var indexInLayer : Int { get set }
    
    var center : CGPoint { get set }
    var relativeCenter : CGPoint { get set }

    var rotationDegree : Float { get set }
    var scale : Float { get set }

    var isBasePhotoFrame : Bool { get set }
    var isTemplateItem : Bool { get set }
    var canChangeColor : Bool { get set }
    
}



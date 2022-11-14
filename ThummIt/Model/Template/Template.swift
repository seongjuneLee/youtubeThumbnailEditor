//
//  Template.swift
//  ThummIt
//
//  Created by 이성준 on 2022/11/14.
//

import Foundation

protocol Template {
    
    var previewImageName :String { get set }
    var category :String { get set }
    var templateName :String { get set }
    var mainFrameImageName :String { get set }

    var bgColor :UIColor { get set }
    
    var texts :Array<Any> { get set } // type 정해주어야함
    var stickers :Array<Any> { get set } // type 정해주어야함
    var photoFrames :Array<Any> { get set } // type 정해주어야함
    
//    -(NSMutableArray *)items;
//    -(void)setUpPhotoFrame;
//    -(void)setUpTexts;
//    -(void)setUpStickers;
//    -(void)setUpMainFrames;

    
}

extension Template {
    
    var bgColor: UIColor {
        get {
            return .clear
        }
        set {
            print("the new value is \(newValue)")
        }
    }
    
}

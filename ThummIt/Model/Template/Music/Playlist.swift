//
//  PlaylistMusic.swift
//  ThummIt
//
//  Created by 이성준 on 2022/11/14.
//

import Foundation

struct Playlist : Template {
    
    
    var previewImageName: String = "playlistMusicPreview"
    var category: String = "Music"
    var templateName: String = "playlistMusicTemplate"
    var mainFrameImageName: String = "playlistMusicFrame"
    
    var bgColor: UIColor
    
    var texts: Array<Any> = {
//        Text *playlistText = [[Text alloc] init];
//        PlaylistTypo *playlistTypo = [PlaylistTypo playlistTypo];
//        playlistText.scale = 0.73;
//        playlistText.relativeCenter = CGPointMake(0.515, 0.45);
//        playlistText.isTemplateItem = true;
//        playlistText.indexInLayer = @"0";
//        playlistText.text = @"PLAYLIST";
//        playlistText.textView.text = playlistText.text;
//        playlistText.typo = playlistTypo;
//        [self.texts addObject:playlistText];
        return [""]
    }()
    var stickers: Array<Any>
    var photoFrames: Array<Any>
    
        
}

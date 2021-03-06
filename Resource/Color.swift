//
//  Color.swift
//  Resource
//
//  Created by 原ひかる on 2020/04/02.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit

public struct Color {
    
    public struct Background {
        public static let main = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1/1)
        public static let buttonStart = UIColor(red: 158/255, green: 158/255, blue: 255/255, alpha: 1/1)
        public static let buttonEnd = UIColor(red: 215/255, green: 215/255, blue: 255/255, alpha: 1/1)
        public static let cellTitle = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1/1)
    }
    
    public struct Selected {
        public static let selected = UIColor.black
        public static let unselected = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1/1)
    }
    
    public struct Text {
        public static let explain = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1/1)
    }
}

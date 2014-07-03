//
//  ShowOtherMasters.swift
//  ShowOtherMasters
//
//  Created by Ben Syverson on 7/1/14.
//  Copyright (c) 2014 Ben Syverson. All rights reserved.
//

import Foundation
import Cocoa


class ShowOtherMasters : NSObject, GlyphsReporter {
	init() {
		
	}
	
	var _controller : NSViewController?
	
	func drawBackgroundForLayer(layer: GSLayer) {
		
	}
	
	func interfaceVersion() -> Int
	{
		return 1
	}
	
	func title() -> String!
	{
		if let aString = NSBundle(forClass: ShowOtherMasters.self).localizedStringForKey("OtherMasters", value: "", table: nil) {
			return aString
		}
		return "Other"
	}
	
	func keyEquivalent() -> String!
	{
		return "`"
	}
	
	func modifierMask() -> CUnsignedInt {
		return NSCommandKeyMask
	}
	
	func setController(Controller: NSViewController!)
	{
		_controller = Controller
	}
	
	func drawBackgroundForLayer(Layer: GSLayer?)
	{
		
	}
	
	func drawForegroundForLayer(Layer: GSLayer?)
	{
		NSColor(white:0.5, alpha:0.2).set()
		if let allLayers = Layer?.parent?.layers? {
			for aLayer : AnyObject in allLayers.allValues() {
				if let myLayer = aLayer as? GSLayer {
					if myLayer.paths?.count > 0 {
						if let bezierPath = myLayer.bezierPath as NSBezierPath? {
							bezierPath.fill()
						}
					}
					if myLayer.components?.count > 0 {
						for aComponent : AnyObject in myLayer.components {
							if let myComponent = aComponent as? GSComponent {
								myComponent.bezierPath()?.fill()
							}
						}
					}
				}
			}
		}
	}
	
}


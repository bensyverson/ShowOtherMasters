#import <Foundation/Foundation.h>
#import <GlyphsCore/GSLayer.h>
#import <GlyphsCore/GSGlyph.h>
#import <GlyphsCore/GSComponent.h>
#import <GlyphsCore/GlyphsReporterProtocol.h>
#import <GlyphsCore/GSGlyphViewControllerProtocol.h>

#import "ShowOtherMasters.h"

@interface ShowOtherMasters ()
@property (nullable) NSViewController * _controller;
@end

@implementation ShowOtherMasters

- (id)init {
    self = [super init];
    return self;
}

- (NSUInteger)interfaceVersion {
    return 1;
}

- (NSString *)title {
    NSString *aString = [[NSBundle bundleForClass:[self class]] localizedStringForKey:@"OtherMasters" value:@"" table:nil];
    return aString ? aString : @"Other";
}

- (NSString *)keyEquivalent {
    return @"`";
}

- (int)modifierMask {
    return NSCommandKeyMask;
}

- (void)setController:(NSViewController <GSGlyphEditViewControllerProtocol> *)controller {
    self._controller = controller;
}

- (void)drawForegroundForLayer:(GSLayer *)layer {
    [[NSColor colorWithCalibratedWhite:0.5 alpha:0.2] set];
    if (layer && layer.parent && layer.parent.layers) {
        NSDictionary *allLayers = layer.parent.layers;
        for (NSObject *aLayer in [allLayers allValues]) {
            if ([aLayer isMemberOfClass:[GSLayer class]]) {
                GSLayer *myLayer = (GSLayer *) aLayer;
                if (myLayer.paths && myLayer.paths.count > 0) {
                    if (myLayer.bezierPath) {
                        [myLayer.bezierPath fill];
                    }
                }
                if (myLayer.components && myLayer.components.count > 0) {
                    for (NSObject *aComponent in myLayer.components) {
                        if ([aComponent isMemberOfClass:[GSComponent class]]) {
                            GSComponent *myComponent = (GSComponent *) aComponent;
                            NSBezierPath *myComponentBezierPath = [myComponent bezierPath];
                            if (myComponentBezierPath) {
                                [myComponentBezierPath fill];
                            }
                        }
                    }
                }
            }
        }
    }
}

@end

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

%hook UIImage

-(void)drawInRect:(CGRect)rect{
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	CGPathRef clippath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10.0].CGPath;
	CGContextAddPath(context, clippath);
	CGContextClip(context);
	%orig();
	CGContextRestoreGState(context);
}

%end
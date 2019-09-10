/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDImageCodersManager.h"
#import "SDImageIOCoder.h"
#import "SDImageGIFCoder.h"
#import "SDImageAPNGCoder.h"
#import "SDInternalMacros.h"

@interface SDImageCodersManager ()

@property (nonatomic, strong, nonnull) dispatch_semaphore_t codersLock;

@end

@implementation SDImageCodersManager
{
    NSMutableArray<id<SDImageCoder>> *_imageCoders;
}

+ (nonnull instancetype)sharedManager {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        // initialize with default coders
        _imageCoders = [NSMutableArray arrayWithArray:@[[SDImageIOCoder sharedCoder], [SDImageGIFCoder sharedCoder], [SDImageAPNGCoder sharedCoder]]];
        _codersLock = dispatch_semaphore_create(1);
    }
    return self;
}

- (NSArray<id<SDImageCoder>> *)coders
{
    SD_LOCK(self.codersLock);
    NSArray<id<SDImageCoder>> *coders = [_imageCoders copy];
    SD_UNLOCK(self.codersLock);
    return coders;
}

- (void)setCoders:(NSArray<id<SDImageCoder>> *)coders
{
    SD_LOCK(self.codersLock);
    [_imageCoders removeAllObjects];
    if (coders.count) {
        [_imageCoders addObjectsFromArray:coders];
    }
    SD_UNLOCK(self.codersLock);
}

#pragma mark - Coder IO operations

- (void)addCoder:(nonnull id<SDImageCoder>)coder {
    if (![coder conformsToProtocol:@protocol(SDImageCoder)]) {
        return;
    }
    SD_LOCK(self.codersLock);
    [_imageCoders addObject:coder];
    SD_UNLOCK(self.codersLock);
}

- (void)removeCoder:(nonnull id<SDImageCoder>)coder {
    if (![coder conformsToProtocol:@protocol(SDImageCoder)]) {
        return;
    }
    SD_LOCK(self.codersLock);
    [_imageCoders removeObject:coder];
    SD_UNLOCK(self.codersLock);
}

#pragma mark - SDImageCoder
- (BOOL)canDecodeFromData:(NSData *)data {
    NSArray<id<SDImageCoder>> *coders = self.coders;
    for (id<SDImageCoder> coder in coders.reverseObjectEnumerator) {
        if ([coder canDecodeFromData:data]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)canEncodeToFormat:(SDImageFormat)format {
    NSArray<id<SDImageCoder>> *coders = self.coders;
    for (id<SDImageCoder> coder in coders.reverseObjectEnumerator) {
        if ([coder canEncodeToFormat:format]) {
            return YES;
        }
    }
    return NO;
}

- (UIImage *)decodedImageWithData:(NSData *)data options:(nullable SDImageCoderOptions *)options {
    if (!data) {
        return nil;
    }
    UIImage *image;
    NSArray<id<SDImageCoder>> *coders = self.coders;
    for (id<SDImageCoder> coder in coders.reverseObjectEnumerator) {
        if ([coder canDecodeFromData:data]) {
            image = [coder decodedImageWithData:data options:options];
//            if (data.length/1024 > 90) {
//                image = [self compressImageWith:image];
//            }
            break;
        }
    }
    if (data.length/1024 > 90) {
        image = [self compressImageWith:image];
    }
    
    
    
    return image;
}

- (NSData *)encodedDataWithImage:(UIImage *)image format:(SDImageFormat)format options:(nullable SDImageCoderOptions *)options {
    if (!image) {
        return nil;
    }
    NSArray<id<SDImageCoder>> *coders = self.coders;
    for (id<SDImageCoder> coder in coders.reverseObjectEnumerator) {
        if ([coder canEncodeToFormat:format]) {
            return [coder encodedDataWithImage:image format:format options:options];
        }
    }
    return nil;
}

-(UIImage *)compressImageWith:(UIImage *)image  {
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    float width =[UIScreen mainScreen].bounds.size.width;
    float height = image.size.height/(image.size.width/width);
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    [image drawInRect:CGRectMake(0, 0, width, height)];
    
//    if (widthScale > heightScale) {
//        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
//    }else {
//        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
//    }
    
    // 从当前context中创建一个改变大小后的图片
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    return newImage;
}

@end

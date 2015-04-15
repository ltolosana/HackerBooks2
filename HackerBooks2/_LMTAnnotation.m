// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTAnnotation.m instead.

#import "_LMTAnnotation.h"

const struct LMTAnnotationAttributes LMTAnnotationAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.text = @"text",
};

const struct LMTAnnotationRelationships LMTAnnotationRelationships = {
	.book = @"book",
	.image = @"image",
	.localization = @"localization",
};

@implementation LMTAnnotationID
@end

@implementation _LMTAnnotation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Annotation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Annotation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Annotation" inManagedObjectContext:moc_];
}

- (LMTAnnotationID*)objectID {
	return (LMTAnnotationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic text;

@dynamic book;

@dynamic image;

@dynamic localization;

@end


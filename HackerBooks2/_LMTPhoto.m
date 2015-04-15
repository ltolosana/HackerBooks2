// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTPhoto.m instead.

#import "_LMTPhoto.h"

const struct LMTPhotoAttributes LMTPhotoAttributes = {
	.photoData = @"photoData",
	.photoURL = @"photoURL",
};

const struct LMTPhotoRelationships LMTPhotoRelationships = {
	.annotations = @"annotations",
	.book = @"book",
};

@implementation LMTPhotoID
@end

@implementation _LMTPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (LMTPhotoID*)objectID {
	return (LMTPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic photoURL;

@dynamic annotations;

- (NSMutableSet*)annotationsSet {
	[self willAccessValueForKey:@"annotations"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"annotations"];

	[self didAccessValueForKey:@"annotations"];
	return result;
}

@dynamic book;

@end


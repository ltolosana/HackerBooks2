// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTLocalization.m instead.

#import "_LMTLocalization.h"

const struct LMTLocalizationAttributes LMTLocalizationAttributes = {
	.lattitude = @"lattitude",
	.longitude = @"longitude",
};

const struct LMTLocalizationRelationships LMTLocalizationRelationships = {
	.annotations = @"annotations",
};

@implementation LMTLocalizationID
@end

@implementation _LMTLocalization

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Localization" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Localization";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Localization" inManagedObjectContext:moc_];
}

- (LMTLocalizationID*)objectID {
	return (LMTLocalizationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"lattitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lattitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic lattitude;

- (int32_t)lattitudeValue {
	NSNumber *result = [self lattitude];
	return [result intValue];
}

- (void)setLattitudeValue:(int32_t)value_ {
	[self setLattitude:@(value_)];
}

- (int32_t)primitiveLattitudeValue {
	NSNumber *result = [self primitiveLattitude];
	return [result intValue];
}

- (void)setPrimitiveLattitudeValue:(int32_t)value_ {
	[self setPrimitiveLattitude:@(value_)];
}

@dynamic longitude;

- (int32_t)longitudeValue {
	NSNumber *result = [self longitude];
	return [result intValue];
}

- (void)setLongitudeValue:(int32_t)value_ {
	[self setLongitude:@(value_)];
}

- (int32_t)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result intValue];
}

- (void)setPrimitiveLongitudeValue:(int32_t)value_ {
	[self setPrimitiveLongitude:@(value_)];
}

@dynamic annotations;

- (NSMutableSet*)annotationsSet {
	[self willAccessValueForKey:@"annotations"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"annotations"];

	[self didAccessValueForKey:@"annotations"];
	return result;
}

@end


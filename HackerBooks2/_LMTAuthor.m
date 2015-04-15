// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTAuthor.m instead.

#import "_LMTAuthor.h"

const struct LMTAuthorAttributes LMTAuthorAttributes = {
	.name = @"name",
};

const struct LMTAuthorRelationships LMTAuthorRelationships = {
	.books = @"books",
};

@implementation LMTAuthorID
@end

@implementation _LMTAuthor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Author";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Author" inManagedObjectContext:moc_];
}

- (LMTAuthorID*)objectID {
	return (LMTAuthorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic books;

- (NSMutableSet*)booksSet {
	[self willAccessValueForKey:@"books"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"books"];

	[self didAccessValueForKey:@"books"];
	return result;
}

@end


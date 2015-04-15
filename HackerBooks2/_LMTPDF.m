// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTPDF.m instead.

#import "_LMTPDF.h"

const struct LMTPDFAttributes LMTPDFAttributes = {
	.pdfData = @"pdfData",
	.pdfURL = @"pdfURL",
};

const struct LMTPDFRelationships LMTPDFRelationships = {
	.book = @"book",
};

@implementation LMTPDFID
@end

@implementation _LMTPDF

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PDF" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PDF";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PDF" inManagedObjectContext:moc_];
}

- (LMTPDFID*)objectID {
	return (LMTPDFID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic pdfData;

@dynamic pdfURL;

@dynamic book;

@end


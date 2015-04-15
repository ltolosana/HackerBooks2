// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTPDF.h instead.

@import CoreData;

extern const struct LMTPDFAttributes {
	__unsafe_unretained NSString *pdfData;
	__unsafe_unretained NSString *pdfURL;
} LMTPDFAttributes;

extern const struct LMTPDFRelationships {
	__unsafe_unretained NSString *book;
} LMTPDFRelationships;

@class LMTBook;

@interface LMTPDFID : NSManagedObjectID {}
@end

@interface _LMTPDF : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LMTPDFID* objectID;

@property (nonatomic, strong) NSData* pdfData;

//- (BOOL)validatePdfData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pdfURL;

//- (BOOL)validatePdfURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LMTBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _LMTPDF (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (NSString*)primitivePdfURL;
- (void)setPrimitivePdfURL:(NSString*)value;

- (LMTBook*)primitiveBook;
- (void)setPrimitiveBook:(LMTBook*)value;

@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTAnnotation.h instead.

@import CoreData;

extern const struct LMTAnnotationAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *text;
} LMTAnnotationAttributes;

extern const struct LMTAnnotationRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *localization;
} LMTAnnotationRelationships;

@class LMTBook;
@class LMTPhoto;
@class LMTLocalization;

@interface LMTAnnotationID : NSManagedObjectID {}
@end

@interface _LMTAnnotation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LMTAnnotationID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LMTBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LMTPhoto *image;

//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LMTLocalization *localization;

//- (BOOL)validateLocalization:(id*)value_ error:(NSError**)error_;

@end

@interface _LMTAnnotation (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (LMTBook*)primitiveBook;
- (void)setPrimitiveBook:(LMTBook*)value;

- (LMTPhoto*)primitiveImage;
- (void)setPrimitiveImage:(LMTPhoto*)value;

- (LMTLocalization*)primitiveLocalization;
- (void)setPrimitiveLocalization:(LMTLocalization*)value;

@end

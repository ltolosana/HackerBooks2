// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTPhoto.h instead.

@import CoreData;

extern const struct LMTPhotoAttributes {
	__unsafe_unretained NSString *photoData;
	__unsafe_unretained NSString *photoURL;
} LMTPhotoAttributes;

extern const struct LMTPhotoRelationships {
	__unsafe_unretained NSString *annotations;
	__unsafe_unretained NSString *book;
} LMTPhotoRelationships;

@class LMTAnnotation;
@class LMTBook;

@interface LMTPhotoID : NSManagedObjectID {}
@end

@interface _LMTPhoto : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LMTPhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* photoURL;

//- (BOOL)validatePhotoURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotations;

- (NSMutableSet*)annotationsSet;

@property (nonatomic, strong) LMTBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _LMTPhoto (AnnotationsCoreDataGeneratedAccessors)
- (void)addAnnotations:(NSSet*)value_;
- (void)removeAnnotations:(NSSet*)value_;
- (void)addAnnotationsObject:(LMTAnnotation*)value_;
- (void)removeAnnotationsObject:(LMTAnnotation*)value_;

@end

@interface _LMTPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSString*)primitivePhotoURL;
- (void)setPrimitivePhotoURL:(NSString*)value;

- (NSMutableSet*)primitiveAnnotations;
- (void)setPrimitiveAnnotations:(NSMutableSet*)value;

- (LMTBook*)primitiveBook;
- (void)setPrimitiveBook:(LMTBook*)value;

@end

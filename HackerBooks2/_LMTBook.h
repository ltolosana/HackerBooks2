// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTBook.h instead.

@import CoreData;

extern const struct LMTBookAttributes {
	__unsafe_unretained NSString *title;
} LMTBookAttributes;

extern const struct LMTBookRelationships {
	__unsafe_unretained NSString *annotations;
	__unsafe_unretained NSString *authors;
	__unsafe_unretained NSString *pdf;
	__unsafe_unretained NSString *photo;
	__unsafe_unretained NSString *tags;
} LMTBookRelationships;

@class LMTAnnotation;
@class LMTAuthor;
@class LMTPDF;
@class LMTPhoto;
@class LMTTag;

@interface LMTBookID : NSManagedObjectID {}
@end

@interface _LMTBook : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LMTBookID* objectID;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotations;

- (NSMutableSet*)annotationsSet;

@property (nonatomic, strong) NSSet *authors;

- (NSMutableSet*)authorsSet;

@property (nonatomic, strong) LMTPDF *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LMTPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;

@end

@interface _LMTBook (AnnotationsCoreDataGeneratedAccessors)
- (void)addAnnotations:(NSSet*)value_;
- (void)removeAnnotations:(NSSet*)value_;
- (void)addAnnotationsObject:(LMTAnnotation*)value_;
- (void)removeAnnotationsObject:(LMTAnnotation*)value_;

@end

@interface _LMTBook (AuthorsCoreDataGeneratedAccessors)
- (void)addAuthors:(NSSet*)value_;
- (void)removeAuthors:(NSSet*)value_;
- (void)addAuthorsObject:(LMTAuthor*)value_;
- (void)removeAuthorsObject:(LMTAuthor*)value_;

@end

@interface _LMTBook (TagsCoreDataGeneratedAccessors)
- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(LMTTag*)value_;
- (void)removeTagsObject:(LMTTag*)value_;

@end

@interface _LMTBook (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSMutableSet*)primitiveAnnotations;
- (void)setPrimitiveAnnotations:(NSMutableSet*)value;

- (NSMutableSet*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSMutableSet*)value;

- (LMTPDF*)primitivePdf;
- (void)setPrimitivePdf:(LMTPDF*)value;

- (LMTPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(LMTPhoto*)value;

- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;

@end

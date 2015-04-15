// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTAuthor.h instead.

@import CoreData;

extern const struct LMTAuthorAttributes {
	__unsafe_unretained NSString *name;
} LMTAuthorAttributes;

extern const struct LMTAuthorRelationships {
	__unsafe_unretained NSString *books;
} LMTAuthorRelationships;

@class LMTBook;

@interface LMTAuthorID : NSManagedObjectID {}
@end

@interface _LMTAuthor : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LMTAuthorID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _LMTAuthor (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(LMTBook*)value_;
- (void)removeBooksObject:(LMTBook*)value_;

@end

@interface _LMTAuthor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end

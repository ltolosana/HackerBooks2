// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTTag.h instead.

@import CoreData;

extern const struct LMTTagAttributes {
	__unsafe_unretained NSString *name;
} LMTTagAttributes;

extern const struct LMTTagRelationships {
	__unsafe_unretained NSString *books;
} LMTTagRelationships;

@class LMTBook;

@interface LMTTagID : NSManagedObjectID {}
@end

@interface _LMTTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LMTTagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _LMTTag (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(LMTBook*)value_;
- (void)removeBooksObject:(LMTBook*)value_;

@end

@interface _LMTTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end

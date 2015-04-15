// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LMTLocalization.h instead.

@import CoreData;

extern const struct LMTLocalizationAttributes {
	__unsafe_unretained NSString *lattitude;
	__unsafe_unretained NSString *longitude;
} LMTLocalizationAttributes;

extern const struct LMTLocalizationRelationships {
	__unsafe_unretained NSString *annotations;
} LMTLocalizationRelationships;

@class LMTAnnotation;

@interface LMTLocalizationID : NSManagedObjectID {}
@end

@interface _LMTLocalization : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LMTLocalizationID* objectID;

@property (nonatomic, strong) NSNumber* lattitude;

@property (atomic) int32_t lattitudeValue;
- (int32_t)lattitudeValue;
- (void)setLattitudeValue:(int32_t)value_;

//- (BOOL)validateLattitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* longitude;

@property (atomic) int32_t longitudeValue;
- (int32_t)longitudeValue;
- (void)setLongitudeValue:(int32_t)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotations;

- (NSMutableSet*)annotationsSet;

@end

@interface _LMTLocalization (AnnotationsCoreDataGeneratedAccessors)
- (void)addAnnotations:(NSSet*)value_;
- (void)removeAnnotations:(NSSet*)value_;
- (void)addAnnotationsObject:(LMTAnnotation*)value_;
- (void)removeAnnotationsObject:(LMTAnnotation*)value_;

@end

@interface _LMTLocalization (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveLattitude;
- (void)setPrimitiveLattitude:(NSNumber*)value;

- (int32_t)primitiveLattitudeValue;
- (void)setPrimitiveLattitudeValue:(int32_t)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (int32_t)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(int32_t)value_;

- (NSMutableSet*)primitiveAnnotations;
- (void)setPrimitiveAnnotations:(NSMutableSet*)value;

@end

#import "LMTPhoto.h"

@interface LMTPhoto ()

// Private interface goes here.

@end

@implementation LMTPhoto

// Custom logic goes here.

#pragma mark - Properties
-(void) setImage:(UIImage *)image{
    
    // convertir la UIImage en un NSData
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
    
}

-(UIImage *) image{

    //    self.photoData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.photoURL]];
        if (self.photoData == nil) {
            // No hemos descargado todavia
            // Descargo la photo
            [self withDataURL:[NSURL URLWithString:self.photoURL]
              completionBlock:^(NSData *data) {
                  self.photoData = data;
                  [self notifyChangeInImage];
              }];

        }

    // convertir la NSData en UIImage
    return [UIImage imageWithData:self.photoData];
}

#pragma mark - Class Methods
+(instancetype) photoWithURL:(NSString *) photoURL context:(NSManagedObjectContext *) context{
    
    LMTPhoto *p = [self insertInManagedObjectContext:context];
    
    p.photoURL = photoURL;

    return p;
}



#pragma mark - Utils
-(void) withDataURL: (NSURL *) url completionBlock:(void (^)(NSData* data))completionBlock{
    
    // Nos vamos a segundo plano a descargar la imagen
    // iOS nos da por defecto unas 4 colas (QOS_CLASS_USER_INITIATED y otras 3 mas) para que la App las use, sin tener que estar creando colas nuevas
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        
        NSData *d = [NSData dataWithContentsOfURL:url];
        
        // Cuando la tengo, me voy a primer plano
        // y llamo al completionBolck
        // Esto se hace por convencion. Por convencion los bloques de finalizacion (completionBlock) se ejecutan en primer plano (cola principal)
        // Si no quieres eso, dentro del bloque de finalizacion lo primero seria hacer un dispatch_async y mandar las cosas a segundo plano
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completionBlock(d);
        });
    });
    
    
    
}

-(void)notifyChangeInImage{
    
    // avisamos delegado si lo tenemos
//    [self.delegate asyncImageDidChange:self];
    
    // Enviamos una notificación
    NSNotification *notification =
    [NSNotification notificationWithName: IMAGE_DID_CHANGE_NOTIFICATION
                                  object:self
                                userInfo:@{IMAGE_KEY : self.image}];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    
    // con esto y las notificaciones KVO, quien necesite saber lo que ando
    // lo tendrá muy fácil
}


//    if (_image == nil) {
//        // Set the name to the local image file based on the Title
//        NSFileManager *fm = [NSFileManager defaultManager];
//        NSURL *localImageURL = [[fm URLsForDirectory:NSCachesDirectory
//                                           inDomains:NSUserDomainMask] lastObject];
//        localImageURL = [localImageURL URLByAppendingPathComponent:[self.title stringByAppendingPathExtension:@"jpg"]];
//
//        NSError *error;
//        NSData *data = nil;
//
//        // Try to load image locally
//        data = [NSData dataWithContentsOfURL:localImageURL
//                                     options:NSDataReadingMappedIfSafe
//                                       error:&error];
//        if (data == nil) {
//            // There is no local image, so load from internet
//
//            data = [NSData dataWithContentsOfURL:self.imageURL
//                                         options:NSDataReadingMappedIfSafe
//                                           error:&error];
//            if (data != nil) {
//                // save the image into local cache directory
//                BOOL rc = [data writeToURL:localImageURL
//                                   options:NSDataWritingAtomic
//                                     error:&error];
//                if (rc == NO) {
//                    NSLog(@"Error al guardar la imagen en local: %@", error.localizedDescription);
//                }
//
//            }
//
//        }
//        // No matter local or remote, return image
//        _image = [UIImage imageWithData:data];
//
//    }
//    return _image;

@end

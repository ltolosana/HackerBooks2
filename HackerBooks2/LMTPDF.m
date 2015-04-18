#import "LMTPDF.h"

@interface LMTPDF ()

// Private interface goes here.

@end

@implementation LMTPDF

// Custom logic goes here.

+(instancetype) pdfWithURL:(NSString *) pdfURL context:(NSManagedObjectContext *) context{

    LMTPDF *apdf = [self insertInManagedObjectContext:context];
    
    apdf.pdfURL = pdfURL;

    return apdf;
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

@end

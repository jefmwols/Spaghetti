//
//  NWSClassObjectType.h
//  Spaghetti
//
//  Copyright (c) 2012 noodlewerk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWSObjectType.h"

/**
 * The class object type wraps the Class class.
 *
 * The class objec type is mainly used by the basic store to create (allocate) new instances.
 *
 * @see NWSObjectType
 * @see NWSBasicStore
 */
@interface NWSClassObjectType : NWSObjectType

@property (nonatomic, strong) Class clas;

- (id)initWithClass:(Class)clas;

@end

//
//  Task.m
//  WorkShop_ToDoList
//
//  Created by Marina on 26/04/2023.
//

#import "Task.h"

@implementation Task

-(void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.titleTask forKey:@"title"];
    [coder encodeObject:self.descriptionTask forKey:@"taskDescription"];
    [coder encodeObject:self.dateTask forKey:@"DateTask"];
    [coder encodeObject:self.propirty forKey:@"probirty"];
    [coder encodeObject:self.status forKey:@"status"];
    [coder encodeObject:self.image forKey:@"image"];
}

-(instancetype)initWithCoder:(NSCoder *)coder {
if (self = [super init]) {
    _titleTask = [coder decodeObjectForKey:@"title"];
    _descriptionTask = [coder decodeObjectForKey:@"taskDescription"];
    _dateTask = [coder decodeObjectForKey:@"DateTask"];
    _propirty = [coder decodeObjectForKey:@"probirty"];
    _status = [coder decodeObjectForKey:@"status"];
    _image = [coder decodeObjectForKey:@"image"];
    
}
return self;
}


@end

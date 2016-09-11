//
//  LGFCollectionCell.m
//  LGFCollectionViewAutoLayout
//
//  Created by 吕桂峰 on 15/12/11.
//  Copyright © 2015年 吕桂峰. All rights reserved.
//

#import "LGFCollectionCell.h"
#import "Masonry.h"
@implementation LGFCollectionCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 0.5;
        self.layer.cornerRadius = 4;
        [self addSubview:self.titleLabel];
        [self addSubview:self.imageView];
        [self initialConstraints];
    }
    return self;
}



-(void)initialConstraints
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(8);
        make.width.greaterThanOrEqualTo(@0);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(4);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(@8);
        make.right.equalTo(self.mas_right).offset(-8);
    }];
}


#pragma mark - getter
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor  blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByClipping;
        _titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _titleLabel;
}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        
        _imageView.image = [UIImage imageNamed:@"udeleteicon"];
    }
    return _imageView;
}

@end

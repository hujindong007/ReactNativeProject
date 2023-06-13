//
//  DemoCollectionViewCell.m
//  ReactNativeProjectIOS
//
//  Created by 王家强 on 2019/6/13.
//  Copyright © 2019 王家强. All rights reserved.
//

#import "DemoCollectionViewCell.h"
#import <Masonry.h>
#import "DemoDataKey.h"

@interface DemoCollectionViewCell ()

@property (strong, nonatomic) UIImageView *headImageV;

@property (strong, nonatomic) UILabel *nameLabel;

@end

@implementation DemoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        [self.contentView addSubview:self.headImageV];
        [self.contentView addSubview:self.nameLabel];
        
//        [self.headImageV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(16);
//            make.centerY.mas_equalTo(self.contentView.mas_centerY);
//            make.size.mas_equalTo(CGSizeMake(60, 60));
//        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
        }];
    }
    
    return self;
}

-(void)setModel:(NSDictionary *)model{
    self.headImageV.image = [UIImage imageNamed:model[DemoCollctionItemImage]];
    
    self.nameLabel.text = model[DemoCollctionItemName];
    
    NSString * contentString = model[DemoCollctionItemName];
    
    CGSize titleSize = [contentString boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;

    CGFloat contentWidth = titleSize.width+1;
    
    CGFloat kScreenW = [UIScreen mainScreen].bounds.size.width;
    
    if (contentWidth>(kScreenW-24)) {
        _nameLabel.numberOfLines = 0;
    } else {
        _nameLabel.numberOfLines = 1;
    }
    
    
}



- (UIImageView *)headImageV
{
    if (!_headImageV) {
        _headImageV = [[UIImageView alloc] init];
        _headImageV.layer.cornerRadius = 30;
        _headImageV.layer.masksToBounds = YES;
    }
    return _headImageV;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.backgroundColor = [UIColor redColor];
    }
    return _nameLabel;
}

@end

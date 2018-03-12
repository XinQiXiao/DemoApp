//
//  MasTableViewCell.m
//  DemoApp
//
//  Created by qixin on 2018/3/12.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "MasTableViewCell.h"
#import <Masonry.h>

@implementation MasTableViewCell
{
    UILabel *detailLabel;
    UIImageView *iconImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        iconImageView = [UIImageView new];
        iconImageView.backgroundColor = [UIColor redColor];
        [self addSubview:iconImageView];
        
        detailLabel = [UILabel new];
        detailLabel.textColor = [UIColor blueColor];
        detailLabel.textAlignment = NSTextAlignmentLeft;
        detailLabel.font = [UIFont systemFontOfSize:20.0f];
        detailLabel.backgroundColor = [UIColor grayColor];
        detailLabel.numberOfLines = 0;
        [self addSubview:detailLabel];
        
        CGFloat padding = 20.0f;
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.top.left.equalTo(self.contentView).mas_offset(padding);
        }];
        
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iconImageView.mas_right).mas_offset(padding);
            make.top.equalTo(self.contentView).mas_offset(padding);
            make.right.bottom.equalTo(self.contentView).mas_offset(-padding);
            make.height.greaterThanOrEqualTo(@30);
        }];
        
    }
    return self;
}

-(void)setDetail:(NSString *)detail{
    _detail = detail;
    detailLabel.text = _detail;
}

@end

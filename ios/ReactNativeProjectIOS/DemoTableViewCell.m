//
//  DemoTableViewCell.m
//  ReactNativeProjectIOS
//
//  Created by 王家强 on 2019/6/13.
//  Copyright © 2019 王家强. All rights reserved.
//

#import "DemoTableViewCell.h"
#import <Masonry.h>
#import "DemoCollectionViewCell.h"

#import "UICollectionViewLeftAlignedLayout.h"

@interface DemoTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UIView *bgView;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) NSArray *dataArr;
@property (nonatomic,strong) UILabel * titleLbl;

@end

@implementation DemoTableViewCell

static CGFloat const Margin = 12;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - cell
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewLeftAlignedLayout *leftAlignedLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
        leftAlignedLayout.minimumLineSpacing = 10;                          //最小行间距
        leftAlignedLayout.minimumInteritemSpacing = 10;                     //最小列间距
        leftAlignedLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);  //网格上左下右间距
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:leftAlignedLayout];
        _collectionView.backgroundColor = [UIColor yellowColor];
        [_collectionView registerClass:[DemoCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([DemoCollectionViewCell class])];
        _collectionView.showsHorizontalScrollIndicator=NO;
        _collectionView.showsVerticalScrollIndicator=NO;
        _collectionView.backgroundColor=[UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
    }
    return _collectionView;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 8;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (UILabel *)titleLbl
{
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.text = @"服务方式";
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.font = [UIFont systemFontOfSize:13];
        _titleLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLbl;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)creatView
{
    self.contentView.backgroundColor = [UIColor whiteColor];
//    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.titleLbl];
    [self.contentView addSubview:self.collectionView];
    
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_equalTo(12);
//        make.right.bottom.mas_equalTo(-12);
//    }];
//
    [self.titleLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(30);
        make.left.equalTo(self.contentView.mas_left).offset(12);
        make.right.equalTo(self.contentView.mas_right).offset(-12);
        make.height.mas_equalTo(20);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.bottom.top.right.mas_equalTo(0);
        make.top.equalTo(self.titleLbl.mas_bottom).offset(30);
        make.left.equalTo(self.contentView.mas_left).offset(12);
        make.right.equalTo(self.contentView.mas_right).offset(-12);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
}

#pragma mark - cell data
- (void)setModel:(NSArray *)model
{
    self.dataArr = model;
    [self.collectionView reloadData];
    
    /**
    // 通过collectionViewLayout.collectionViewContentSize
    [self.collectionView layoutIfNeeded];
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.collectionView.collectionViewLayout.collectionViewContentSize.height);
    }];
    // 这种方法在6p等机型会出现高度错误的现象，通过调试可以发现collection的宽度为288（应该为388[414-16x2]）
     */
    
//    // 这里我们使用重写systemLayoutSizeFittingSize的方式
//    [self.collectionView layoutIfNeeded];
//    [self.titleLbl layoutIfNeeded];
//    [self.bgView layoutIfNeeded];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * model = self.dataArr[indexPath.item];
    NSString * contentString = model[@"name"];
    
    CGSize titleSize = [contentString boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;

    //    CreateTypeListModel * listModel = _createTypeArray[indexPath.item];
    CGFloat contentWidth = titleSize.width+1;
//    [titleStr widthWithFontString:titleStr height:30 fontSize:13.0f];
    
    CGFloat kScreenW = [UIScreen mainScreen].bounds.size.width;
    
    if (contentWidth>(kScreenW-24)) {
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, (kScreenW-24), 0)];
        textView.text = contentString;
        textView.font = [UIFont systemFontOfSize:13];
        CGSize size = CGSizeMake(kScreenW-24, MAXFLOAT);
        CGSize constraint = [textView sizeThatFits:size];
        CGFloat contentHeight = constraint.height;
        return CGSizeMake(kScreenW-24, contentHeight);
    } else {
        return CGSizeMake(contentWidth+24, 30);
    }
}

#pragma mark - 计算高度
- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
//    // 先对bgview进行布局
//    self.bgView.frame = CGRectMake(0, 0, targetSize.width, 44);
//    [self.bgView layoutIfNeeded];
////
////    // 在对collectionView进行布局
//    self.collectionView.frame = CGRectMake(0, 0, targetSize.width-Margin*2, 44);
    [self.collectionView layoutIfNeeded];
    
    // 由于这里collection的高度是动态的，这里cell的高度我们根据collection来计算
    CGSize collectionSize = self.collectionView.collectionViewLayout.collectionViewContentSize;
    CGFloat cotentViewH = collectionSize.height + Margin*2;
    
    // 返回当前cell的高度
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, cotentViewH+80);
}

#pragma mark - collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DemoCollectionViewCell class]) forIndexPath:indexPath];
    [cell setModel:self.dataArr[indexPath.row]];
    return cell;
}




@end



import 'package:ecommerce_app/features/shop/models/banner_model.dart';
import 'package:ecommerce_app/features/shop/models/brand_category_model.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce_app/features/shop/models/product_category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/models/product_variation_model.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';

import '../../features/shop/models/category_model.dart';

class TDummyData {
  // ///- Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner8,
        targetScreen: TRoutes.checkout,
        active: false),
  ];
  //

  static final List<ProductCategoryModel> productCategory = [
    // ProductCategoryModel(productId: '001', categoryId: '2'),
    // ProductCategoryModel(productId: '002', categoryId: '2'),
    // ProductCategoryModel(productId: '003', categoryId: '7'),
    // ProductCategoryModel(productId: '004', categoryId: '4'),
    // ProductCategoryModel(productId: '005', categoryId: '1'),
    // ProductCategoryModel(productId: '006', categoryId: '8'),
    // ProductCategoryModel(productId: '007', categoryId: '5'),
    // ProductCategoryModel(productId: '008', categoryId: '6'),
    // ProductCategoryModel(productId: '009', categoryId: '6'),
    ProductCategoryModel(productId: '010', categoryId: '3'),
  ];
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '2'),
    BrandCategoryModel(brandId: '2', categoryId: '2'),
    BrandCategoryModel(brandId: '3', categoryId: '2'),
    BrandCategoryModel(brandId: '1', categoryId: '7'),
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '6'),
    BrandCategoryModel(brandId: '2', categoryId: '5'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '5', categoryId: '3'),
  ];
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: TImages.gildanlogo,
        name: 'Gildan',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: TImages.tacvasenlogo,
        name: 'Tacvasen',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: TImages.wranglerlogo,
        name: 'Wrangler',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: TImages.mageMalelogo,
        name: 'Mage Male',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '5',
        image: TImages.jVerLogo,
        name: 'J.Ver',
        productsCount: 265,
        isFeatured: true),
  ];

  /// --List of all Products
  static final List<ProductModel> products = [
    // ProductModel(
    //     id: '001',
    //     title: '4 Color collar t-shirt dry fit',
    //     stock: 15,
    //     price: 135,
    //     isFeatured: true,
    //     thumbnail: TImages.productImage69,
    //     description:
    //         'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a  demo and nothing else.',
    //     brand: BrandModel(id: '1', image: TImages.gildanlogo, name: 'Gildan'),
    //     images: [
    //       TImages.productImage60,
    //       TImages.productImage51,
    //       TImages.productImage52,
    //       TImages.productImage63
    //     ],
    //     salePrice: 50,
    //     sku: 'ABR4568',
    //     categoryId: '2',
    //     productAttributes: [
    //       ProductAttributeModel(
    //           name: 'Color', values: ['Green', 'Yellow', 'Red', 'Blue']),
    //       ProductAttributeModel(
    //           name: 'Size', values: ['M', 'L', 'XL', 'XXL', 'XXXL']),
    //     ],
    //     productVariations: [
    //       ProductVariationModel(
    //           id: '1',
    //           stock: 34,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage60,
    //           description:
    //               'This is a Product description 4 Color collar t-shirt dry fit',
    //           attributeValues: {'Color': 'Green', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '2',
    //           stock: 15,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage60,
    //           attributeValues: {'Color': 'Green', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '3',
    //           stock: 15,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage60,
    //           attributeValues: {'Color': 'Green', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '4',
    //           stock: 15,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage60,
    //           attributeValues: {'Color': 'Green', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '5',
    //           stock: 0,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage60,
    //           attributeValues: {'Color': 'Green', 'Size': 'XXXL'}),
    //       ProductVariationModel(
    //           id: '6',
    //           stock: 20,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage61,
    //           attributeValues: {'Color': 'Yellow', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '7',
    //           stock: 0,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage61,
    //           attributeValues: {'Color': 'Yellow', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '8',
    //           stock: 20,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage61,
    //           attributeValues: {'Color': 'Yellow', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '9',
    //           stock: 20,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage61,
    //           attributeValues: {'Color': 'Yellow', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '10',
    //           stock: 0,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage61,
    //           attributeValues: {'Color': 'Yellow', 'Size': 'XXXL'}),
    //       ProductVariationModel(
    //           id: '11',
    //           stock: 0,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '12',
    //           stock: 11,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '13',
    //           stock: 11,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '14',
    //           stock: 11,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '15',
    //           stock: 11,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XXXL'}),
    //       ProductVariationModel(
    //           id: '16',
    //           stock: 20,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '17',
    //           stock: 25,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '18',
    //           stock: 25,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '19',
    //           stock: 25,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '20',
    //           stock: 25,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage63,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XXXL'}),
    //     ],
    //     productType: 'ProductType.variable',
    //     date: DateTime.now()),
    // ProductModel(
    //     id: '002',
    //     title: 'Gildan Women\'s Softstyle Cotton T-Shirt',
    //     stock: 20,
    //     price: 12,
    //     isFeatured: true,
    //     thumbnail: TImages.productImage78,
    //     description:
    //         'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a  demo and nothing else.',
    //     brand: BrandModel(id: '1', image: TImages.gildanlogo, name: 'Gildan'),
    //     images: [
    //       TImages.productImage78,
    //       TImages.productImage79,
    //       TImages.productImage80,
    //       TImages.productImage81
    //     ],
    //     salePrice: 10,
    //     sku: 'ABR4569',
    //     categoryId: '2',
    //     productAttributes: [
    //       ProductAttributeModel(
    //           name: 'Color', values: ['Grey', 'Green', 'Pink', 'Purple']),
    //       ProductAttributeModel(name: 'Size', values: [
    //         'M',
    //         'L',
    //         'XL',
    //         'XXL',
    //       ]),
    //     ],
    //     productVariations: [
    //       ProductVariationModel(
    //           id: '1',
    //           stock: 34,
    //           price: 12,
    //           salePrice: 10,
    //           image: TImages.productImage78,
    //           description:
    //               'This is a Product description 4 Color collar t-shirt dry fit',
    //           attributeValues: {'Color': 'Grey', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '2',
    //           stock: 15,
    //           price: 12,
    //           salePrice: 10,
    //           image: TImages.productImage78,
    //           attributeValues: {'Color': 'Grey', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '3',
    //           stock: 15,
    //           price: 12,
    //           salePrice: 10,
    //           image: TImages.productImage78,
    //           attributeValues: {'Color': 'Grey', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '4',
    //           stock: 0,
    //           price: 12,
    //           salePrice: 10,
    //           image: TImages.productImage78,
    //           attributeValues: {'Color': 'Grey', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '5',
    //           stock: 20,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage79,
    //           attributeValues: {'Color': 'Green', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '6',
    //           stock: 20,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage79,
    //           attributeValues: {'Color': 'Green', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '7',
    //           stock: 0,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage79,
    //           attributeValues: {'Color': 'Green', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '8',
    //           stock: 20,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage79,
    //           attributeValues: {'Color': 'Green', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '9',
    //           stock: 0,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Pink', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '10',
    //           stock: 0,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Pink', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '11',
    //           stock: 11,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Pink', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '12',
    //           stock: 11,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Pink', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '13',
    //           stock: 11,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Purple', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '14',
    //           stock: 11,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Purple', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '15',
    //           stock: 20,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Purple', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '16',
    //           stock: 25,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Purple', 'Size': 'XXL'}),
    //     ],
    //     productType: 'ProductType.variable',
    //     date: DateTime.now()),
    // ProductModel(
    //     id: '003',
    //     title:
    //         'Gildan Winter Gloves For Men Women, Cold Weather Warm Touchscreen Glove Unisex',
    //     stock: 20,
    //     price: 7.98,
    //     isFeatured: true,
    //     thumbnail: TImages.productImage82,
    //     description:
    //         'ensitive touchscreen & anti-slip palm : Sensitivity Touchscreen gloves increased by 50% more than the previous winter gloves version, with more durability and sensitivity. Winter gloves for men with touchscreen capability design on the thumb, forefinger, middle finger and being compatible with all touchscreen devices, say goodbye to ice fingers. The Non-slip grip pattern design of womens gloves helps to grasp things easily and hold the steering wheel, adaptable to the Men/Women habits.',
    //     brand: BrandModel(id: '1', image: TImages.gildanlogo, name: 'Gildan'),
    //     images: [
    //       TImages.productImage82,
    //       TImages.productImage83,
    //       TImages.productImage84,
    //       TImages.productImage85
    //     ],
    //     sku: 'ABR4570',
    //     categoryId: '7',
    //     productAttributes: [
    //       ProductAttributeModel(
    //           name: 'Color', values: ['Black', 'Blue', 'Grey', 'Red']),
    //       ProductAttributeModel(name: 'Size', values: [
    //         'L',
    //         'XL',
    //         'XXL',
    //       ]),
    //     ],
    //     productVariations: [
    //       ProductVariationModel(
    //           id: '1',
    //           stock: 15,
    //           price: 7.98,
    //           image: TImages.productImage82,
    //           attributeValues: {'Color': 'Black', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '2',
    //           stock: 15,
    //           price: 7.98,
    //           image: TImages.productImage82,
    //           attributeValues: {'Color': 'Black', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '3',
    //           stock: 5,
    //           price: 7.98,
    //           image: TImages.productImage82,
    //           attributeValues: {'Color': 'Black', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '4',
    //           stock: 20,
    //           price: 7.98,
    //           image: TImages.productImage83,
    //           attributeValues: {'Color': 'Blue', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '5',
    //           stock: 10,
    //           price: 7.98,
    //           image: TImages.productImage83,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '6',
    //           stock: 20,
    //           price: 7.98,
    //           image: TImages.productImage83,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '10',
    //           stock: 0,
    //           price: 7.98,
    //           image: TImages.productImage84,
    //           attributeValues: {'Color': 'Grey', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '11',
    //           stock: 11,
    //           price: 7.98,
    //           image: TImages.productImage84,
    //           attributeValues: {'Color': 'Grey', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '12',
    //           stock: 11,
    //           price: 7.98,
    //           image: TImages.productImage84,
    //           attributeValues: {'Color': 'Grey', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '14',
    //           stock: 11,
    //           price: 7.98,
    //           image: TImages.productImage85,
    //           attributeValues: {'Color': 'Red', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '15',
    //           stock: 20,
    //           price: 7.98,
    //           image: TImages.productImage85,
    //           attributeValues: {'Color': 'Red', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '16',
    //           stock: 25,
    //           price: 7.98,
    //           image: TImages.productImage85,
    //           attributeValues: {'Color': 'Red', 'Size': 'XXL'}),
    //     ],
    //     productType: 'ProductType.variable',
    //     date: DateTime.now()),
    // ProductModel(
    //     id: '004',
    //     title:
    //         'Men\'s Bomber Jacket Lightweight Casual Spring Fall Windbreaker Zip Up Coat',
    //     stock: 20,
    //     price: 39.98,
    //     isFeatured: true,
    //     thumbnail: TImages.productImage86,
    //     description:
    //         'Material: Polyester; Lightweight, Windbreaker, Breathable. Full zipper stand collar bomber jacket, The zipper head is on the left. FEATURE: Rib Knit Cuffs, Waistband, Collar for comfort, Dual pen pockets on sleeve.',
    //     brand:
    //         BrandModel(id: '2', image: TImages.tacvasenlogo, name: 'Tacvasen'),
    //     images: [
    //       TImages.productImage86,
    //       TImages.productImage87,
    //       TImages.productImage88,
    //       TImages.productImage89
    //     ],
    //     sku: 'ABR4570',
    //     categoryId: '4',
    //     productAttributes: [
    //       ProductAttributeModel(
    //           name: 'Color', values: ['Black', 'Blue', 'Brown', 'Yellow']),
    //       ProductAttributeModel(name: 'Size', values: [
    //         'L',
    //         'XL',
    //         'XXL',
    //         'XXXL',
    //       ]),
    //     ],
    //     productVariations: [
    //       ProductVariationModel(
    //           id: '1',
    //           stock: 15,
    //           price: 39.98,
    //           image: TImages.productImage86,
    //           attributeValues: {'Color': 'Black', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '2',
    //           stock: 15,
    //           price: 39.98,
    //           image: TImages.productImage86,
    //           attributeValues: {'Color': 'Black', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '3',
    //           stock: 5,
    //           price: 39.98,
    //           image: TImages.productImage86,
    //           attributeValues: {'Color': 'Black', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '4',
    //           stock: 5,
    //           price: 39.98,
    //           image: TImages.productImage86,
    //           attributeValues: {'Color': 'Black', 'Size': 'XXXL'}),
    //       ProductVariationModel(
    //           id: '5',
    //           stock: 20,
    //           price: 39.98,
    //           image: TImages.productImage87,
    //           attributeValues: {'Color': 'Blue', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '6',
    //           price: 39.98,
    //           stock: 10,
    //           image: TImages.productImage87,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '7',
    //           stock: 20,
    //           price: 39.98,
    //           image: TImages.productImage87,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '8',
    //           stock: 5,
    //           price: 39.98,
    //           image: TImages.productImage87,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XXXL'}),
    //       ProductVariationModel(
    //           id: '9',
    //           stock: 0,
    //           price: 39.98,
    //           image: TImages.productImage88,
    //           attributeValues: {'Color': 'Brown', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '10',
    //           stock: 11,
    //           price: 39.98,
    //           image: TImages.productImage88,
    //           attributeValues: {'Color': 'Brown', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '11',
    //           stock: 11,
    //           price: 39.98,
    //           image: TImages.productImage88,
    //           attributeValues: {'Color': 'Brown', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '12',
    //           stock: 5,
    //           price: 39.98,
    //           image: TImages.productImage88,
    //           attributeValues: {'Color': 'Brown', 'Size': 'XXXL'}),
    //       ProductVariationModel(
    //           id: '13',
    //           stock: 11,
    //           price: 39.98,
    //           image: TImages.productImage89,
    //           attributeValues: {'Color': 'Yellow', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '14',
    //           stock: 20,
    //           price: 39.98,
    //           image: TImages.productImage89,
    //           attributeValues: {'Color': 'Yellow', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '15',
    //           stock: 25,
    //           price: 39.98,
    //           image: TImages.productImage89,
    //           attributeValues: {'Color': 'Yellow', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '16',
    //           stock: 5,
    //           price: 39.98,
    //           image: TImages.productImage89,
    //           attributeValues: {'Color': 'Yellow', 'Size': 'XXXL'}),
    //     ],
    //     productType: 'ProductType.variable',
    //     date: DateTime.now()),
    // ProductModel(
    //     id: '005',
    //     title: 'Men\'s Slim-Fit Casual Stretch Chino Pant',
    //     stock: 20,
    //     price: 21.26,
    //     salePrice: 28.50,
    //     isFeatured: true,
    //     thumbnail: TImages.productImage90,
    //     description:
    //         'Material: Polyester; Lightweight, Windbreaker, Breathable. Full zipper stand collar bomber jacket, The zipper head is on the left. FEATURE: Rib Knit Cuffs, Waistband, Collar for comfort, Dual pen pockets on sleeve.',
    //     brand:
    //         BrandModel(id: '3', image: TImages.wranglerlogo, name: 'Wrangler'),
    //     images: [
    //       TImages.productImage90,
    //       TImages.productImage91,
    //       TImages.productImage92,
    //       TImages.productImage93
    //     ],
    //     sku: 'ABR4570',
    //     categoryId: '1',
    //     productAttributes: [
    //       ProductAttributeModel(
    //           name: 'Color', values: ['Black', 'Brown', 'Green', 'White']),
    //       ProductAttributeModel(name: 'Size', values: [
    //         'L',
    //         'XL',
    //         'XXL',
    //         'XXXL',
    //       ]),
    //     ],
    //     productVariations: [
    //       ProductVariationModel(
    //           id: '1',
    //           stock: 15,
    //           price: 21.26,
    //           image: TImages.productImage90,
    //           attributeValues: {'Color': 'Black', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '2',
    //           stock: 15,
    //           price: 24.26,
    //           image: TImages.productImage90,
    //           attributeValues: {'Color': 'Black', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '3',
    //           stock: 5,
    //           price: 26.26,
    //           image: TImages.productImage90,
    //           attributeValues: {'Color': 'Black', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '4',
    //           stock: 5,
    //           price: 28.5,
    //           image: TImages.productImage90,
    //           attributeValues: {'Color': 'Black', 'Size': 'XXXL'}),
    //       ProductVariationModel(
    //           id: '5',
    //           stock: 20,
    //           price: 21.26,
    //           image: TImages.productImage91,
    //           attributeValues: {'Color': 'Brown', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '6',
    //           price: 24.26,
    //           stock: 10,
    //           image: TImages.productImage91,
    //           attributeValues: {'Color': 'Brown', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '7',
    //           stock: 20,
    //           price: 26.26,
    //           image: TImages.productImage91,
    //           attributeValues: {'Color': 'Brown', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '8',
    //           stock: 5,
    //           price: 28.5,
    //           image: TImages.productImage91,
    //           attributeValues: {'Color': 'Brown', 'Size': 'XXXL'}),
    //       ProductVariationModel(
    //           id: '9',
    //           stock: 0,
    //           price: 21.26,
    //           image: TImages.productImage92,
    //           attributeValues: {'Color': 'Green', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '10',
    //           stock: 11,
    //           price: 24.26,
    //           image: TImages.productImage92,
    //           attributeValues: {'Color': 'Green', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '11',
    //           stock: 11,
    //           price: 26.26,
    //           image: TImages.productImage92,
    //           attributeValues: {'Color': 'Green', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '12',
    //           stock: 5,
    //           price: 28.5,
    //           image: TImages.productImage92,
    //           attributeValues: {'Color': 'Green', 'Size': 'XXXL'}),
    //       ProductVariationModel(
    //           id: '13',
    //           stock: 11,
    //           price: 21.26,
    //           image: TImages.productImage93,
    //           attributeValues: {'Color': 'White', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '14',
    //           stock: 20,
    //           price: 24.26,
    //           image: TImages.productImage93,
    //           attributeValues: {'Color': 'White', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '15',
    //           stock: 25,
    //           price: 26.26,
    //           image: TImages.productImage93,
    //           attributeValues: {'Color': 'White', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '16',
    //           stock: 5,
    //           price: 28.5,
    //           image: TImages.productImage93,
    //           attributeValues: {'Color': 'White', 'Size': 'XXXL'}),
    //     ],
    //     productType: 'ProductType.variable',
    //     date: DateTime.now()),

    // ProductModel(
    //     id: '008',
    //     title:
    //         'Mage Male Men\'s Slim Fit Suit One Button 3-Piece Blazer Dress Business',
    //     stock: 20,
    //     price: 72.59,
    //     isFeatured: true,
    //     thumbnail: TImages.productImage78,
    //     description:
    //         'Material: Cotton polyester blended, The Mens Suits Will Be Comfortable, Breathable, Softer, Smoother, Easier to Wash and Keep. The Shape Slim fit , simple style, basic suit suitable for everyday wear.\n'
    //         'Button Closure: This mens suit with full shoulder design and slim cut with 3D draping. Slim fit suits for men are a little tighter than a regular fit suit. When you put on it makes you slimmer, sharper, look modern and handsome.\n'
    //         'It\'s suitable for multi-occasions, like wedding, daily life, business meeting, any fashion forward parties, any grandly holiday, ect. It is also prefect for young men to prepare for the Homingcming and back to school.\n'
    //         'Suit is men\'s symbol. There is nothing as cool as confident. This prefect and comfortable tuxedo suit doesn\'t cost hundreds of dollars to buy. It\'s a very affordable price.',
    //     brand: BrandModel(
    //         id: '4',
    //         image: TImages.mageMalelogo,
    //         name: 'Mage Male',
    //         isFeatured: true),
    //     images: [
    //       TImages.productImage78,
    //       TImages.productImage79,
    //       TImages.productImage80,
    //       TImages.productImage81,
    //       TImages.productImage82,
    //     ],
    //     sku: 'ABR4576',
    //     categoryId: '6',
    //     productAttributes: [
    //       ProductAttributeModel(
    //           name: 'Color',
    //           values: ['Black', 'Blue', 'Brown', 'Grey', 'White']),
    //       ProductAttributeModel(name: 'Size', values: [
    //         'M',
    //         'L',
    //         'XL',
    //         'XXL',
    //       ]),
    //     ],
    //     productVariations: [
    //       ProductVariationModel(
    //           id: '1',
    //           stock: 15,
    //           price: 72.59,
    //           image: TImages.productImage78,
    //           attributeValues: {'Color': 'Black', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '2',
    //           stock: 15,
    //           price: 72.59,
    //           image: TImages.productImage78,
    //           attributeValues: {'Color': 'Black', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '3',
    //           stock: 5,
    //           price: 72.59,
    //           image: TImages.productImage78,
    //           attributeValues: {'Color': 'Black', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '4',
    //           stock: 5,
    //           price: 72.59,
    //           image: TImages.productImage78,
    //           attributeValues: {'Color': 'Black', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '5',
    //           stock: 20,
    //           price: 72.59,
    //           image: TImages.productImage79,
    //           attributeValues: {'Color': 'Blue', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '6',
    //           price: 72.59,
    //           stock: 10,
    //           image: TImages.productImage79,
    //           attributeValues: {'Color': 'Blue', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '7',
    //           stock: 20,
    //           price: 72.59,
    //           image: TImages.productImage79,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '8',
    //           stock: 20,
    //           price: 72.59,
    //           image: TImages.productImage79,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '9',
    //           stock: 20,
    //           price: 72.59,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Brown', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '10',
    //           stock: 10,
    //           price: 72.59,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Brown', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '11',
    //           stock: 30,
    //           price: 72.59,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Brown', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '12',
    //           stock: 20,
    //           price: 72.59,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Brown', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '13',
    //           stock: 5,
    //           price: 72.59,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Grey', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '14',
    //           stock: 11,
    //           price: 72.59,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Grey', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '15',
    //           stock: 20,
    //           price: 72.59,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Grey', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '16',
    //           stock: 20,
    //           price: 72.59,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Grey', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '17',
    //           stock: 5,
    //           price: 72.59,
    //           image: TImages.productImage82,
    //           attributeValues: {'Color': 'White', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '18',
    //           stock: 11,
    //           price: 72.59,
    //           image: TImages.productImage82,
    //           attributeValues: {'Color': 'White', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '19',
    //           stock: 20,
    //           price: 72.59,
    //           image: TImages.productImage82,
    //           attributeValues: {'Color': 'White', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '20',
    //           stock: 20,
    //           price: 72.59,
    //           image: TImages.productImage82,
    //           attributeValues: {'Color': 'White', 'Size': 'XXL'}),
    //     ],
    //     productType: 'ProductType.variable',
    //     date: DateTime.now()),
    // ProductModel(
    //     id: '009',
    //     title: 'Mage Male Men\'s 2 Piece Suit One Button Slim Fit Formal',
    //     stock: 20,
    //     price: 69.99,
    //     isFeatured: true,
    //     thumbnail: TImages.productImage83,
    //     description:
    //         'Classic Style: Blazer: Single button closure, notched / peaked lapel collar, double vents, one chest pocket with white / blue trim,two side flap pockets, inside pockets; Pants: Flat front, zipper fly, button end and adjustable waist tab, two front slash pockets, two back welt pockets with buttons; Bow tie: Match with a satin bow tie in a similar color.\n'
    //         '2 Pieces?Actually 3 Pieces! In addition to the blazer and pants, this set also includes a "random" satin bow tie that the color is not fixed, a similar color bow tie can save you the trouble of matching.\n'
    //         'Suitable for any occasion: This tuxedo / suit is suitable for many occasions: Dinner / Work / Business / Conference / Wedding / Party / Prom / Halloween / Cruise / Magician / Chorus / Graduation / Date / Fashion show and any other formal occasions, also suitable for husbands, fathers, brothers and friends. This suit is available in a variety of lapel styles, that you purchase different lapel styles and it will be easy to match different occasions.\n',
    //     brand: BrandModel(
    //         id: '4',
    //         image: TImages.mageMalelogo,
    //         name: 'Mage Male',
    //         isFeatured: true),
    //     images: [
    //       TImages.productImage83,
    //       TImages.productImage84,
    //       TImages.productImage85,
    //       TImages.productImage86,
    //     ],
    //     sku: 'ABR4577',
    //     categoryId: '6',
    //     productAttributes: [
    //       ProductAttributeModel(
    //           name: 'Color', values: ['Black', 'Blue', 'Grey', 'Purple']),
    //       ProductAttributeModel(name: 'Size', values: [
    //         'M',
    //         'L',
    //         'XL',
    //         'XXL',
    //       ]),
    //     ],
    //     productVariations: [
    //       ProductVariationModel(
    //           id: '1',
    //           stock: 15,
    //           price: 69.99,
    //           image: TImages.productImage83,
    //           attributeValues: {'Color': 'Black', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '2',
    //           stock: 15,
    //           price: 69.99,
    //           image: TImages.productImage83,
    //           attributeValues: {'Color': 'Black', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '3',
    //           stock: 5,
    //           price: 69.99,
    //           image: TImages.productImage83,
    //           attributeValues: {'Color': 'Black', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '4',
    //           stock: 5,
    //           price: 69.99,
    //           image: TImages.productImage83,
    //           attributeValues: {'Color': 'Black', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '5',
    //           stock: 20,
    //           price: 69.99,
    //           image: TImages.productImage84,
    //           attributeValues: {'Color': 'Blue', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '6',
    //           price: 69.99,
    //           stock: 10,
    //           image: TImages.productImage84,
    //           attributeValues: {'Color': 'Blue', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '7',
    //           stock: 20,
    //           price: 69.99,
    //           image: TImages.productImage84,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '8',
    //           stock: 20,
    //           price: 69.99,
    //           image: TImages.productImage84,
    //           attributeValues: {'Color': 'Blue', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '9',
    //           stock: 20,
    //           price: 69.99,
    //           image: TImages.productImage85,
    //           attributeValues: {'Color': 'Grey', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '10',
    //           stock: 10,
    //           price: 69.99,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Grey', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '11',
    //           stock: 30,
    //           price: 69.99,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Grey', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '12',
    //           stock: 20,
    //           price: 69.99,
    //           image: TImages.productImage80,
    //           attributeValues: {'Color': 'Grey', 'Size': 'XXL'}),
    //       ProductVariationModel(
    //           id: '13',
    //           stock: 5,
    //           price: 69.99,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Purple', 'Size': 'M'}),
    //       ProductVariationModel(
    //           id: '14',
    //           stock: 11,
    //           price: 69.99,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Purple', 'Size': 'L'}),
    //       ProductVariationModel(
    //           id: '15',
    //           stock: 20,
    //           price: 69.99,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Purple', 'Size': 'XL'}),
    //       ProductVariationModel(
    //           id: '16',
    //           stock: 20,
    //           price: 69.99,
    //           image: TImages.productImage81,
    //           attributeValues: {'Color': 'Purple', 'Size': 'XXL'}),
    //     ],
    //     productType: 'ProductType.variable',
    //     date: DateTime.now()),
    ProductModel(
        id: '010',
        title: 'J.VER Men\'s Dress Shirts Solid Long Sleeve Stretch Wrinkle',
        stock: 20,
        price: 24.99,
        isFeatured: true,
        thumbnail: TImages.productImage87,
        description:
            'Flex Fabric: The long sleeve dress shirt is made of stretch fabric,makes you move body easier;soft and comfortable with good breathability.\n'
            'Wrinkle Free: The combination of high-quality fabrics and special technology makes the solid dress shirt not easy to wrinkle, easy to care.The classic spread collar easily matches with a tie or bow tie.\n'
            'Occasion: Business/ Wedding/ Party/ Dating/ Office/ Nightclub, whether for formal occasions or daily casual, this mens dress shirt is a perfect choice. The classic design ensures it\'s a staple in any wardrobe.\n'
            'Size: Our button down shirts are US regular fit tailoring style,a variety of sizes and colors for you to choose,please refer to the size chart to choose the size that suits you',
        brand: BrandModel(
            id: '5', image: TImages.jVerLogo, name: 'J.Ver', isFeatured: true),
        images: [
          TImages.productImage87,
          TImages.productImage88,
          TImages.productImage89,
          TImages.productImage90,
        ],
        sku: 'ABR4578',
        categoryId: '3',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Black', 'Grey', 'Purple', 'White']),
          ProductAttributeModel(name: 'Size', values: [
            'L',
            'XL',
            'XXL',
            'XXXL',
          ]),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 15,
              price: 24.99,
              image: TImages.productImage87,
              attributeValues: {'Color': 'Black', 'Size': 'L'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 24.99,
              image: TImages.productImage87,
              attributeValues: {'Color': 'Black', 'Size': 'XL'}),
          ProductVariationModel(
              id: '3',
              stock: 5,
              price: 24.99,
              image: TImages.productImage87,
              attributeValues: {'Color': 'Black', 'Size': 'XXL'}),
          ProductVariationModel(
              id: '4',
              stock: 5,
              price: 24.99,
              image: TImages.productImage87,
              attributeValues: {'Color': 'Black', 'Size': 'XXXL'}),
          ProductVariationModel(
              id: '5',
              stock: 20,
              price: 24.99,
              image: TImages.productImage88,
              attributeValues: {'Color': 'Grey', 'Size': 'L'}),
          ProductVariationModel(
              id: '6',
              price: 24.99,
              stock: 10,
              image: TImages.productImage88,
              attributeValues: {'Color': 'Grey', 'Size': 'XL'}),
          ProductVariationModel(
              id: '7',
              stock: 20,
              price: 24.99,
              image: TImages.productImage88,
              attributeValues: {'Color': 'Grey', 'Size': 'XXL'}),
          ProductVariationModel(
              id: '8',
              stock: 20,
              price: 24.99,
              image: TImages.productImage88,
              attributeValues: {'Color': 'Grey', 'Size': 'XXXL'}),
          ProductVariationModel(
              id: '9',
              stock: 20,
              price: 24.99,
              image: TImages.productImage89,
              attributeValues: {'Color': 'Purple', 'Size': 'M'}),
          ProductVariationModel(
              id: '10',
              stock: 10,
              price: 24.99,
              image: TImages.productImage89,
              attributeValues: {'Color': 'Purple', 'Size': 'L'}),
          ProductVariationModel(
              id: '11',
              stock: 30,
              price: 24.99,
              image: TImages.productImage89,
              attributeValues: {'Color': 'Purple', 'Size': 'XL'}),
          ProductVariationModel(
              id: '12',
              stock: 20,
              price: 24.99,
              image: TImages.productImage89,
              attributeValues: {'Color': 'Purple', 'Size': 'XXL'}),
          ProductVariationModel(
              id: '13',
              stock: 5,
              price: 24.99,
              image: TImages.productImage90,
              attributeValues: {'Color': 'White', 'Size': 'L'}),
          ProductVariationModel(
              id: '14',
              stock: 11,
              price: 24.99,
              image: TImages.productImage90,
              attributeValues: {'Color': 'White', 'Size': 'XL'}),
          ProductVariationModel(
              id: '15',
              stock: 20,
              price: 24.99,
              image: TImages.productImage90,
              attributeValues: {'Color': 'White', 'Size': 'XXL'}),
          ProductVariationModel(
              id: '16',
              stock: 20,
              price: 24.99,
              image: TImages.productImage90,
              attributeValues: {'Color': 'White', 'Size': 'XXXL'}),
        ],
        productType: 'ProductType.variable',
        date: DateTime.now()),
  ];
  static final List<CategoryModel> categories = [
    // CategoryModel(
    //     id: '1', name: 'Pants', image: TImages.pantsIcon, isFeatured: true),
    // CategoryModel(
    //     id: '2', name: 'T-Shirt', image: TImages.tShirtIcon, isFeatured: true),
    // CategoryModel(
    //     id: '3', name: 'Shirt', image: TImages.shirtIcon, isFeatured: true),
    // CategoryModel(
    //     id: '4', name: 'Jacket', image: TImages.jacketIcon, isFeatured: true),
    // CategoryModel(
    //     id: '5', name: 'Skirt', image: TImages.skirtIcon, isFeatured: true),
    // CategoryModel(
    //     id: '6', name: 'Suit', image: TImages.suitIcon, isFeatured: true),
    // CategoryModel(
    //     id: '7', name: 'Gloves', image: TImages.glovesIcon, isFeatured: true),
    // CategoryModel(
    //     id: '8', name: 'Shoes', image: TImages.shoesIcon, isFeatured: true),
  ];
}

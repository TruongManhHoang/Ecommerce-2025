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
    ProductCategoryModel(productId: '001', categoryId: '2'),
  ];
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '2'),
    BrandCategoryModel(brandId: '2', categoryId: '2'),
    BrandCategoryModel(brandId: '3', categoryId: '2'),
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
  ];

  /// --List of all Products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: '4 Color collar t-shirt dry fit',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage69,
        description:
            'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a  demo and nothing else.',
        brand: BrandModel(id: '1', image: TImages.gildanlogo, name: 'Gildan'),
        images: [
          TImages.productImage60,
          TImages.productImage51,
          TImages.productImage52,
          TImages.productImage63
        ],
        salePrice: 50,
        sku: 'ABR4568',
        categoryId: '2',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Yellow', 'Red', 'Blue']),
          ProductAttributeModel(
              name: 'Size', values: ['M', 'L', 'XL', 'XXL', 'XXXL']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage60,
              description:
                  'This is a Product description 4 Color collar t-shirt dry fit',
              attributeValues: {'Color': 'Green', 'Size': 'M'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Green', 'Size': 'L'}),
          ProductVariationModel(
              id: '3',
              stock: 15,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Green', 'Size': 'XL'}),
          ProductVariationModel(
              id: '4',
              stock: 15,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Green', 'Size': 'XXL'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Green', 'Size': 'XXXL'}),
          ProductVariationModel(
              id: '6',
              stock: 20,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'M'}),
          ProductVariationModel(
              id: '7',
              stock: 0,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'L'}),
          ProductVariationModel(
              id: '8',
              stock: 20,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'XL'}),
          ProductVariationModel(
              id: '9',
              stock: 20,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'XXL'}),
          ProductVariationModel(
              id: '10',
              stock: 0,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'XXXL'}),
          ProductVariationModel(
              id: '11',
              stock: 0,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'M'}),
          ProductVariationModel(
              id: '12',
              stock: 11,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'L'}),
          ProductVariationModel(
              id: '13',
              stock: 11,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'XL'}),
          ProductVariationModel(
              id: '14',
              stock: 11,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'XXL'}),
          ProductVariationModel(
              id: '15',
              stock: 11,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'XXXL'}),
          ProductVariationModel(
              id: '16',
              stock: 20,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'M'}),
          ProductVariationModel(
              id: '17',
              stock: 25,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'L'}),
          ProductVariationModel(
              id: '18',
              stock: 25,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'XL'}),
          ProductVariationModel(
              id: '19',
              stock: 25,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'XXL'}),
          ProductVariationModel(
              id: '20',
              stock: 25,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'XXXL'}),
        ],
        productType: 'ProductType.variable',
        date: DateTime.now()),
  ];
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Kids', image: TImages.kidsIcon, isFeatured: true),
    CategoryModel(
        id: '2', name: 'Men', image: TImages.menIcon, isFeatured: true),
    CategoryModel(
        id: '3', name: 'Women', image: TImages.womenIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Bag', image: TImages.bagIcon, isFeatured: true),
    CategoryModel(
        id: '5', name: 'Hat', image: TImages.hatIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Glass', image: TImages.glassesIcon, isFeatured: true),
    CategoryModel(
        id: '7', name: 'Shoes', image: TImages.shoesIcon, isFeatured: true),
  ];
}

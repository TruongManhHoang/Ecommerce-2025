import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/service/firebase_storage_service.dart';
import 'package:ecommerce_app/features/shop/models/product_category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/constants/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again : $e";
    }
  }

  /// Get limited featured product
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again : $e";
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again : $e";
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again : $e";
    }
  }

  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot =
          await _db.collection('Products').get(); // Lấy toàn bộ

      List<ProductModel> products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .where((product) => product.brand?.id == brandId) // Lọc thủ công
          .toList();

      return limit == -1 ? products : products.take(limit).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again : $e";
    }
  }

  Future<List<ProductModel>> getProductsForCategory({
    required String categoryId,
    int limit = 4,
  }) async {
    try {
      // Lấy danh sách productId từ bảng productCategory
      QuerySnapshot<Map<String, dynamic>> productCategoryQuery = await _db
          .collection('productCategory')
          .where('categoryId', isEqualTo: categoryId)
          .limit(limit)
          .get();

      if (productCategoryQuery.docs.isEmpty) {
        debugPrint("No products found for this category.");
        return [];
      }

      // Lấy danh sách productId
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      if (productIds.isEmpty) return [];

      List<ProductModel> products = [];

      // Giới hạn 10 sản phẩm mỗi truy vấn
      const int batchSize = 10;
      for (int i = 0; i < productIds.length; i += batchSize) {
        List<String> batch = productIds.sublist(
          i,
          i + batchSize > productIds.length ? productIds.length : i + batchSize,
        );

        QuerySnapshot<Map<String, dynamic>> productsQuery = await _db
            .collection('Products')
            .where(FieldPath.documentId, whereIn: batch)
            .get();

        products.addAll(
            productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)));
      }

      return products;
    } on FirebaseException catch (e) {
      debugPrint("Firebase error: ${e.code}");
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      debugPrint("Platform error: ${e.code}");
      throw TPlatformException(e.code).message;
    } catch (e) {
      debugPrint("Unexpected error: $e");
      throw "Something went wrong. Please try again: $e";
    }
  }

  ///Get Sub Categories
  ///Upload Categories to the Cloud Firebase
  ///Nhận danh mục phụ
  ///Tải danh mục lên Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      //Upload all the Categories along with their Images
      // Tải lên tất cả các Danh mục cùng với Hình ảnh của chúng
      final storage = Get.put(TFirebaseStorageService());
      for (var product in products) {
        //Get ImageData link from the local assets
        //Nhận liên kết ImageData từ nội dung cục bộ
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);
        //Upload Image and Get its URL
        // Tải hình ảnh lên và lấy URL của nó

        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());
        //Assign URL to Category, image attribute
        //Gán URL cho Danh mục, thuộc tính hình ảnh
        product.thumbnail = url;

        //Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            //Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            //Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            //Assign URL to product.thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }
        //Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            //Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            //Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            //Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        //Store product in Firebase
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again : $e";
    }
  }

  Future<void> uploadDummyDataProductCategory(
      List<ProductCategoryModel> productCategory) async {
    try {
      final CollectionReference productCategoryRef =
          FirebaseFirestore.instance.collection('productCategory');
      for (var item in productCategory) {
        await productCategoryRef.doc().set(item.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again : $e";
    }
  }
}

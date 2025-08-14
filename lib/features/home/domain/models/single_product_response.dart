class SingleProductResponse {
  final bool status;
  final SingleProduct product;

  SingleProductResponse({
    required this.status,
    required this.product,
  });

  factory SingleProductResponse.fromJson(Map<String, dynamic> json) {
    return SingleProductResponse(
      status: json['status'] ?? false,
      product: SingleProduct.fromJson(json['product'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'product': product.toJson(),
      };
}

class SingleProduct {
  final Product details;
  final List<Review> reviews;
  final List<Product> relatedProducts;
  final List<dynamic> images; // No structure defined, keeping as dynamic
  final dynamic brands; // Null or unknown structure

  SingleProduct({
    required this.details,
    required this.reviews,
    required this.relatedProducts,
    required this.images,
    this.brands,
  });

  factory SingleProduct.fromJson(Map<String, dynamic> json) {
    return SingleProduct(
      details: Product.fromJson(json),
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => Review.fromJson(e))
          .toList(),
      relatedProducts: (json['related_products'] as List<dynamic>? ?? [])
          .map((e) => Product.fromJson(e))
          .toList(),
      images: json['images'] ?? [],
      brands: json['brands'],
    );
  }

  Map<String, dynamic> toJson() => {
        ...details.toJson(), // Spread product details
        'reviews': reviews.map((e) => e.toJson()).toList(),
        'related_products': relatedProducts.map((e) => e.toJson()).toList(),
        'images': images,
        'brands': brands,
      };
}

/// Existing Product model from previous responses
class Product {
  final int productId;
  final String sku;
  final int loyaltyEarningPoints;
  final int minLoyaltyPointsRequired;
  final String name;
  final String description;
  final String shortDescription;
  final String? thumbnailImage;
  final int stockQuantity;
  final bool inStock;
  final bool featuredTag;
  final bool cancelAvailable;
  final bool returnAvailable;
  final bool replacementAvailable;
  final bool cashOnDeliveryAvailable;
  final num price;
  final dynamic offerInfo;

  Product({
    required this.productId,
    required this.sku,
    required this.loyaltyEarningPoints,
    required this.minLoyaltyPointsRequired,
    required this.name,
    required this.description,
    required this.shortDescription,
    this.thumbnailImage,
    required this.stockQuantity,
    required this.inStock,
    required this.featuredTag,
    required this.cancelAvailable,
    required this.returnAvailable,
    required this.replacementAvailable,
    required this.cashOnDeliveryAvailable,
    required this.price,
    this.offerInfo,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'] ?? 0,
      sku: json['sku'] ?? '',
      loyaltyEarningPoints: json['loyalty_earning_points'] ?? 0,
      minLoyaltyPointsRequired: json['min_loyalty_points_required'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['short_description'] ?? '',
      thumbnailImage: json['thumbnail_image'] as String?,
      stockQuantity: json['stock_quantity'] ?? 0,
      inStock: json['in_stock'] ?? false,
      featuredTag: json['featured_tag'] ?? false,
      cancelAvailable: json['cancel_available'] ?? false,
      returnAvailable: json['return_available'] ?? false,
      replacementAvailable: json['replacement_available'] ?? false,
      cashOnDeliveryAvailable: json['cash_on_delivery_available'] ?? false,
      price: json['price'] ?? 0,
      offerInfo: json['offer_info'],
    );
  }

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'sku': sku,
        'loyalty_earning_points': loyaltyEarningPoints,
        'min_loyalty_points_required': minLoyaltyPointsRequired,
        'name': name,
        'description': description,
        'short_description': shortDescription,
        'thumbnail_image': thumbnailImage,
        'stock_quantity': stockQuantity,
        'in_stock': inStock,
        'featured_tag': featuredTag,
        'cancel_available': cancelAvailable,
        'return_available': returnAvailable,
        'replacement_available': replacementAvailable,
        'cash_on_delivery_available': cashOnDeliveryAvailable,
        'price': price,
        'offer_info': offerInfo,
      };
}

/// Placeholder Review model
class Review {
  // Define review fields as per API spec when available
  // Currently using a dynamic map for flexibility
  final Map<String, dynamic> data;

  Review({required this.data});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(data: json);
  }

  Map<String, dynamic> toJson() => data;
}

class HomeData {
  final Section<Offer> offers;
  final Section<Category> categories;
  final Section<Product> topSellingItems;
  final Section<Product> bestOffers;

  HomeData({
    required this.offers,
    required this.categories,
    required this.topSellingItems,
    required this.bestOffers,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      offers: Section<Offer>.fromJson(
        json['offers'] as Map<String, dynamic>,
        (item) => Offer.fromJson(item),
      ),
      categories: Section<Category>.fromJson(
        json['categories'] as Map<String, dynamic>,
        (item) => Category.fromJson(item),
      ),
      topSellingItems: Section<Product>.fromJson(
        json['top_selling_items'] as Map<String, dynamic>,
        (item) => Product.fromJson(item),
      ),
      bestOffers: Section<Product>.fromJson(
        json['best_offers'] as Map<String, dynamic>,
        (item) => Product.fromJson(item),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'offers': offers.toJson(),
        'categories': categories.toJson(),
        'top_selling_items': topSellingItems.toJson(),
        'best_offers': bestOffers.toJson(),
      };
}

class Section<T> {
  final String title;
  final List<T> items;

  Section({
    required this.title,
    required this.items,
  });

  factory Section.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    var itemsJson = json['items'] as List<dynamic>? ?? [];
    var itemsList = itemsJson.map((e) => fromJsonT(e as Map<String, dynamic>)).toList();
    return Section<T>(
      title: json['title'] ?? '',
      items: itemsList,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'items': items.map((e) {
          if (e is Offer) return e.toJson();
          if (e is Category) return e.toJson();
          if (e is Product) return e.toJson();
          return e;
        }).toList(),
      };
}

class Offer {
  final int offerId;
  final int shopId;
  final String name;
  final String description;
  final String offerType;
  final String rate;
  final String image;

  Offer({
    required this.offerId,
    required this.shopId,
    required this.name,
    required this.description,
    required this.offerType,
    required this.rate,
    required this.image,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      offerId: json['offer_id'] ?? 0,
      shopId: json['shop_id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      offerType: json['offer_type'] ?? '',
      rate: json['rate'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'offer_id': offerId,
        'shop_id': shopId,
        'name': name,
        'description': description,
        'offer_type': offerType,
        'rate': rate,
        'image': image,
      };
}

class Category {
  final int categoryId;
  final String categoryName;
  final String? categoryImage; // nullable because JSON has null

  Category({
    required this.categoryId,
    required this.categoryName,
    this.categoryImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'] ?? 0,
      categoryName: json['category_name'] ?? '',
      categoryImage: json['category_image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'category_name': categoryName,
        'category_image': categoryImage,
      };
}

class Product {
  final int productId;
  final String sku;
  final int loyaltyEarningPoints;
  final int minLoyaltyPointsRequired;
  final String name;
  final String description;
  final String shortDescription;
  final String? thumbnailImage; // nullable
  final int stockQuantity;
  final bool inStock;
  final bool featuredTag;
  final bool cancelAvailable;
  final bool returnAvailable;
  final bool replacementAvailable;
  final bool cashOnDeliveryAvailable;
  final num price; // can be int or double
  final dynamic offerInfo; // nullable and unknown structure

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

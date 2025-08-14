class ProductListingResponse {
  final bool status;
  final ProductPagination data;

  ProductListingResponse({
    required this.status,
    required this.data,
  });

  factory ProductListingResponse.fromJson(Map<String, dynamic> json) {
    return ProductListingResponse(
      status: json['status'] ?? false,
      data: ProductPagination.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data.toJson(),
      };
}

class ProductPagination {
  final int currentPage;
  final List<Product> products;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<PageLink> links;
  final String? nextPageUrl;
  final String path;
  final String perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  ProductPagination({
    required this.currentPage,
    required this.products,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory ProductPagination.fromJson(Map<String, dynamic> json) {
    return ProductPagination(
      currentPage: json['current_page'] ?? 0,
      products: (json['data'] as List<dynamic>? ?? [])
          .map((item) => Product.fromJson(item))
          .toList(),
      firstPageUrl: json['first_page_url'] ?? '',
      from: json['from'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      lastPageUrl: json['last_page_url'] ?? '',
      links: (json['links'] as List<dynamic>? ?? [])
          .map((e) => PageLink.fromJson(e))
          .toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'] ?? '',
      perPage: json['per_page'] ?? '',
      prevPageUrl: json['prev_page_url'],
      to: json['to'] ?? 0,
      total: json['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': products.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': links.map((e) => e.toJson()).toList(),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };
}

class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'] ?? '',
      active: json['active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'label': label,
        'active': active,
      };
}

// ✅ Using the same Product model we already created earlier
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

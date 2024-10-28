import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/productModel.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                'https://picsum.photos/200/300', // Random image
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text('Image failed to load'),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Price: \$${product.price}'),
            Text('Discounted Price: \$${(product.price * 0.9).toStringAsFixed(2)}'),
            Text('Brand: ${product.brand}'),
            Text('Rating: ${product.rating} ⭐'),
            const SizedBox(height: 16),
            Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}


Widget productImage(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    // placeholder: (context, url) => const Center(
    //   child: CircularProgressIndicator(),
    // ),
    errorWidget: (context, url, error) => const Icon(
      Icons.broken_image,
      size: 80,
      color: Colors.grey,
    ),
    fit: BoxFit.cover,
  );
}

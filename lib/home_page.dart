import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  final List<String> categories = const [
    'Shoes',
    'Clothes',
    'Accessories',
    'Electronics',
    'Books',
  ];

  final List<Map<String, String>> products = const [
    {
      'name': 'Green Nike Air Shoes',
      'rating': '4.3',
      'price': '\$85.0',
      'image': 'assets/images/nike1.png',
    },
    {
      'name': 'Naviforce Watch',
      'rating': '4.5',
      'price': '\$60.0',
      'image': 'assets/images/watch.png',
    },
    {
      'name': 'Lenovo Laptop',
      'rating': '4.6',
      'price': '\$775.0',
      'image': 'assets/images/lenovo1.png',
    },
    {
      'name': 'Wireless Headphones',
      'rating': '4.8',
      'price': '\$120.0',
      'image': 'assets/images/headphone1.png',
    },
    {
      'name': 'Gaming Chair',
      'rating': '4.2',
      'price': '\$15.0',
      'image': 'assets/images/gammingChair.png',
    },
    {
      'name': 'Classic White T-Shirt',
      'rating': '4.7',
      'price': '\$25.0',
      'image': 'assets/images/tshirt1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Category',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 35,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 237, 231),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text(categories[index])),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Popular Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('View all', style: TextStyle(color: Colors.orange)),
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length * 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (_, index) {
            final product = products[index % products.length];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(product: product),
                  ),
                );
              },
              child: ProductCard(product: product),
            );
          },
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, String> product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              product['image']!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product['name']!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(product['rating']!, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product['price']!,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 14,
                  child: Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

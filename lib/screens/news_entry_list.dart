// screens/news_entry_list.dart
import 'package:flutter/material.dart';
import 'package:football_news/models/item.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  Future<List<Item>> fetchItems(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    List<Item> items = [];
    for (var item in json.decode(response)) {
      items.add(Item.fromJson(item));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: FutureBuilder<List<Item>>(
        future: fetchItems(request),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading items'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No items available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Price: ${item.price}'),
                  trailing: Icon(item.isFeatured ? Icons.star : Icons.star_border),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailPage(item: item),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

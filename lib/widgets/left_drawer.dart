import 'package:flutter/material.dart';
import 'package:miufootball_shop/screens/menu.dart';  // Pastikan path ini benar
import 'package:miufootball_shop/forms/add_product_form.dart';  // Pastikan path ini benar

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Football Shop',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // Navigasi ke halaman utama
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()), // Hapus const jika tidak diperlukan
              );
            },
          ),
          // Navigasi ke halaman form tambah produk
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AddProductFormPage()), // Hapus const jika tidak diperlukan
              );
            },
          ),
        ],
      ),
    );
  }
}

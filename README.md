**Tugas 7** 

 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?

    Widget tree adalah susunan hierarki dari semua widget yang membentuk tampilan aplikasi Flutter.
    Setiap elemen di layar seperti teks, tombol, gambar, atau layout semuanya merupakan widget yang tersusun seperti cabang-cabang pohon.

    Dalam struktur ini, ada hubungan antara parent (induk) dan child (anak).
    Widget parent berfungsi membungkus, mengatur posisi, serta gaya dari widget child di dalamnya.
    Satu widget child hanya bisa punya satu parent, sedangkan satu parent bisa memiliki banyak child.

    Contohnya:

    ```dart
    Scaffold(
    appBar: AppBar(title: Text('Football Shop')),
    body: Column(
        children: [
        Text('Selamat Datang'),
        ElevatedButton(onPressed: () {}, child: Text('Klik Saya')),
        ],
    ),
    )
    ```

    Pada contoh di atas, `Scaffold` adalah parent utama, `Column` adalah child dari `Scaffold`, dan `Text` serta `ElevatedButton` adalah child dari `Column`.
    Hubungan ini penting agar Flutter bisa membangun tampilan dan memperbarui UI dengan efisien.



2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

    * MaterialApp berfungsi sebagai pembungkus utama aplikasi yang mengatur tema, navigasi, dan konfigurasi global.
    * Scaffold digunakan untuk membuat kerangka dasar halaman seperti AppBar dan Body.
    * AppBar menampilkan judul aplikasi di bagian atas layar.
    * Padding memberikan jarak di sekitar widget agar tampilannya lebih rapi.
    * Column digunakan untuk menyusun widget secara vertikal dari atas ke bawah.
    * Row digunakan untuk menyusun widget secara horizontal dari kiri ke kanan.
    * Card membuat tampilan kotak dengan efek bayangan.
    * Text menampilkan tulisan pada layar.
    * GridView.count menampilkan beberapa widget dalam bentuk grid dengan jumlah kolom tertentu.
    * Icon menampilkan ikon dari pustaka Material Icons.
    * Material digunakan untuk memberikan efek material seperti warna dan bentuk.
    * InkWell memberi efek sentuhan atau ripple saat widget ditekan.
    * SnackBar menampilkan pesan singkat di bagian bawah layar ketika tombol ditekan.
    * Center menempatkan widget di posisi tengah.
    * SizedBox memberikan jarak antar widget.
    * Container digunakan untuk mengatur ukuran, padding, warna, dan posisi widget lainnya.



3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

    Widget MaterialApp berfungsi sebagai pintu utama (entry point) untuk aplikasi Flutter berbasis Material Design.
    Widget ini menyediakan pengaturan global seperti judul aplikasi, tema warna, dan navigasi antar halaman.
    Selain itu, MaterialApp juga menjadi konteks utama bagi widget lain agar dapat menggunakan gaya dan komponen Material Design seperti Scaffold, AppBar, dan SnackBar.

    Contohnya:

    ```dart
    MaterialApp(
    title: 'Football Shop',
    theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
    ),
    home: MyHomePage(),
    );
    ```

    MaterialApp sering digunakan sebagai widget root karena semua widget bawaan Flutter seperti Scaffold, AppBar, dan SnackBar memerlukan konteks MaterialApp agar dapat berfungsi dan menampilkan gaya Material Design dengan benar.


4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

    StatelessWidget adalah widget yang tampilannya tidak berubah selama aplikasi berjalan.
    Widget ini cocok untuk elemen statis seperti teks, ikon, atau halaman menu yang tidak membutuhkan perubahan data.

    StatefulWidget adalah widget yang dapat berubah tampilan karena memiliki state atau keadaan yang bisa diperbarui.
    Widget ini cocok digunakan untuk komponen yang bersifat interaktif seperti form, tombol counter, atau data yang diperbarui secara dinamis.

    Gunakan StatelessWidget jika tampilan tidak akan berubah, misalnya halaman utama atau menu tetap.
    Gunakan StatefulWidget jika tampilan akan berubah karena interaksi pengguna, misalnya saat pengguna menekan tombol atau mengubah input.

    Dalam proyek Football Shop, MyHomePage menggunakan StatelessWidget karena tampilan aplikasinya tetap dan tidak berubah selama dijalankan.



5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build()?

    BuildContext adalah objek yang menunjukkan posisi suatu widget di dalam widget tree.
    Flutter menggunakan BuildContext untuk mengetahui lokasi widget di struktur aplikasi dan untuk mengakses informasi dari widget parent, seperti tema warna, ukuran layar, atau navigasi.

    Setiap widget di Flutter punya akses ke BuildContext melalui parameter pada metode build().
    Contohnya:

    ```dart
    @override
    Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
    );
    }
    ```

    Pada contoh di atas, context digunakan untuk mengambil warna utama dari tema aplikasi.
    Selain itu, BuildContext juga digunakan untuk menampilkan SnackBar, melakukan navigasi antar halaman, dan mengakses data dari widget lain di atasnya.


6. Jelaskan konsep hot reload di Flutter dan bagaimana bedanya dengan hot restart.

    Hot reload digunakan untuk memperbarui kode dan tampilan UI tanpa kehilangan data atau state aplikasi.
    Prosesnya cepat karena Flutter hanya memperbarui bagian yang berubah saja.
    Hot reload cocok digunakan saat kamu hanya mengubah tampilan, teks, atau warna aplikasi.

    Sedangkan hot restart akan menjalankan ulang aplikasi dari awal dan menghapus semua state atau data sementara.
    Hot restart digunakan jika kamu mengubah struktur kode utama seperti menambah variabel global atau mengganti widget root.

    Contohnya, jika kamu mengganti warna tema menjadi pink, kamu cukup menggunakan hot reload.
    Namun jika kamu menambah variabel baru di main.dart atau mengubah struktur MaterialApp, maka kamu perlu melakukan hot restart agar perubahan diterapkan dari awal.

    ---

    Dengan memahami konsep widget tree, fungsi MaterialApp, perbedaan antara StatelessWidget dan StatefulWidget, pentingnya BuildContext, serta perbedaan antara hot reload dan hot restart, kamu bisa mengembangkan aplikasi Flutter dengan lebih efisien dan terstruktur.


--------------------------------------------------------------------------------------------------
**Tugas 8**
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

    Di Flutter, `Navigator.push()` dan `Navigator.pushReplacement()` digunakan untuk melakukan navigasi antar halaman, namun keduanya memiliki perbedaan dalam cara mereka mengelola stack (tumpukan) halaman.

    `Navigator.push()`: digunakan untuk menambahkan halaman baru ke atas stack navigasi. Halaman yang sebelumnya tetap ada di stack, sehingga pengguna dapat kembali ke halaman tersebut dengan menekan tombol "Back".
    Digunakan saat kita ingin menambah halaman baru ke stack dan memungkinkan pengguna untuk kembali ke halaman sebelumnya. Sebagai contoh, ketika pengguna berada di halaman utama dan ingin membuka halaman untuk menambah produk, mereka bisa kembali ke halaman utama setelah selesai mengisi form.

    * Gunakan `Navigator.push()` saat berpindah antar halaman yang memungkinkan pengguna kembali ke halaman sebelumnya, seperti antara **Halaman Utama** dan **Halaman Detail Produk**.

    contoh:
    ```dart
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddProductFormPage()),
    );
    ```

    `Navigator.pushReplacement()`: menggantikan halaman yang sedang tampil dengan halaman baru. Halaman sebelumnya akan dihapus dari stack, sehingga pengguna tidak dapat kembali ke halaman tersebut dengan tombol "Back".
    Digunakan saat kita ingin mengganti halaman saat proses navigasi. Misalnya, ketika pengguna selesai mendaftar atau berhasil login, kita mengganti halaman login dengan halaman utama.

    * Gunakan `Navigator.pushReplacement()` saat berpindah dari **Halaman Login** atau **Halaman Form Tambah Produk** ke **Halaman Utama**, karena setelah mengisi form, pengguna tidak perlu kembali ke halaman sebelumnya.

    contoh:
    ```dart
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
    ```

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?


Di Flutter, widget seperti `Scaffold`, `AppBar`, dan `Drawer` digunakan untuk membangun struktur halaman yang konsisten di seluruh aplikasi.

* `Scaffold` adalah widget yang menyediakan struktur dasar untuk sebuah halaman, seperti layout, AppBar, Drawer, FloatingActionButton, dan body. Widget ini membantu menyusun elemen-elemen tersebut agar terlihat rapi dan sesuai dengan desain aplikasi.
* Contoh `Scaffold` digunakan di setiap halaman untuk menyediakan struktur halaman umum dengan AppBar di bagian atas dan Drawer untuk navigasi. Hal ini memastikan konsistensi desain di seluruh aplikasi.

  Contoh Penggunaan:

  ```dart
  Scaffold(
    appBar: AppBar(
      title: const Text('MiuFootball Shop'),
    ),
    drawer: const LeftDrawer(),
    body: // Konten halaman,
  );
  ```

 * `AppBar` adalah widget yang digunakan untuk menampilkan bar bagian atas halaman, yang biasanya berisi judul, tombol aksi, dan navigasi.
* Contoh `AppBar` digunakan di setiap halaman untuk memberikan identitas aplikasi melalui judul dan konsistensi desain.

* `Drawer` adalah menu navigasi yang biasanya diletakkan di sisi kiri atau kanan layar. Pengguna dapat membuka menu ini untuk berpindah antar halaman di dalam aplikasi.
* Contoh `Drawer` digunakan untuk menyediakan menu navigasi ke halaman seperti Halaman Utama, Tambah Produk, dan lainnya. Ini memberikan cara mudah bagi pengguna untuk menjelajahi aplikasi.


3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Dalam desain antarmuka pengguna, widget layout seperti `Padding`, `SingleChildScrollView`, dan `ListView` memberikan fleksibilitas dan kemudahan dalam menampilkan elemen-elemen form dengan cara yang responsif dan nyaman dilihat oleh pengguna.

`Padding` digunakan untuk memberikan ruang atau jarak di sekitar widget. Ini membantu memastikan elemen-elemen UI tidak terlalu rapat dan tampil rapi.
* Contoh Penggunaan di Aplikasi:

  ```dart
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: const InputDecoration(labelText: 'Nama Produk'),
    ),
  );
  ```

 `SingleChildScrollView` memungkinkan konten di dalamnya untuk digulirkan jika ukurannya melebihi batas layar. Widget ini penting ketika form memiliki banyak input sehingga pengguna bisa menggulir form untuk mengisi semua data.
* Contoh Penggunaan di Aplikasi:

  ```dart
  SingleChildScrollView(
    child: Column(
      children: [
        TextFormField(...),
        TextFormField(...),
      ],
    ),
  );
  ```

`ListView` digunakan untuk menampilkan daftar elemen secara vertikal. Ini sangat berguna ketika menampilkan banyak item, seperti daftar produk atau item menu.
* Contoh Penggunaan di Aplikasi:

  ```dart
  ListView(
    children: items.map((item) => ListTile(title: Text(item.name))).toList(),
  );
  ```

Kelebihan Penggunaan Widget Layout:
* `Padding` memberikan jarak yang baik antar elemen form agar tidak terlalu rapat.
* `SingleChildScrollView` memastikan form dapat digulirkan jika kontennya lebih panjang dari layar.
* `ListView` memungkinkan penampilan daftar item secara dinamis dan efisien.


4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?


Penggunaan tema yang konsisten sangat penting untuk membangun identitas visual aplikasi. Di Flutter, kita dapat menyesuaikan warna tema aplikasi dengan mengubah `ThemeData`.

Menyesuaikan Tema :
* Warna Primer dan Sekunder: Tentukan warna utama dan warna aksen yang digunakan di seluruh aplikasi. Misalnya, menggunakan warna biru atau hijau yang sesuai dengan tema toko sepak bola.
* Warna Teks dan Latar Belakang: Tentukan warna teks, latar belakang, dan elemen UI lainnya agar terlihat serasi dengan identitas merek.

Contoh Pengaturan Tema di Aplikasi:

Di dalam `main.dart`, kita dapat menambahkan tema di `MaterialApp` seperti berikut:

```dart
import 'package:flutter/material.dart';
import 'screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        primaryColor: Colors.blue, // Warna utama aplikasi
        accentColor: Colors.green, // Warna aksen
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // Warna latar AppBar
          foregroundColor: Colors.white, // Warna teks di AppBar
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black), // Warna teks umum
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
```

 Dengan Tema Konsisten :

* Memberikan pengalaman pengguna yang menyenangkan dengan warna yang serasi.
* Membantu membangun identitas merek yang kuat.
* Mempermudah pengembangan dengan memusatkan pengaturan warna di satu tempat.



**Tugas 9**
 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

 
# miufootball_shop_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

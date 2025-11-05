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

Tugas 7

 1. Apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?

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

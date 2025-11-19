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

  Kita perlu membuat model Dart supaya data JSON yang kita terima dan kirim punya “bentuk” yang jelas dan konsisten. Dengan model (class) Dart:

  * Tipe data setiap field jadi jelas (misalnya name itu String, price itu double, isFeatured itu bool).
  * Null-safety lebih aman, karena kita bisa tandai mana yang wajib (required) dan mana yang boleh null.
  * Kita dapat bantuan dari editor/IDE (auto-complete, warning kalau salah tipe, dll).
  * Kode jadi lebih rapi dan gampang dirawat kalau nanti struktur JSON berubah.

  Kalau kita langsung pakai Map<String, dynamic> tanpa model:

  * Kita gampang salah ketik key, misalnya "thumnail" bukan "thumbnail", dan error-nya baru ketahuan saat runtime.
  * Tidak ada jaminan tipe data, jadi bisa saja kita mengira itu double, ternyata int atau String, dan bikin crash atau bug halus.
  * Null-safety jadi tidak maksimal, karena Map<String, dynamic> itu serba dynamic.
  * Kalau API berubah, kita harus cek manual semua tempat yang akses key di Map, dan ini bikin maintainability jelek dan rawan bug.

  Intinya, model Dart itu seperti kontrak yang bikin komunikasi Flutter–Django lebih terstruktur dan aman.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

  Secara singkat:

  * package http:
    Digunakan untuk melakukan HTTP request “biasa” (GET, POST, dll) ke web service. Dengan http, kita mengatur sendiri header, body, parsing JSON, dan manajemen cookie kalau perlu.

  * CookieRequest (dari pbp_django_auth):
    Ini adalah wrapper yang sudah disiapkan khusus untuk integrasi Flutter–Django dengan session dan cookie. CookieRequest:

    * Menyimpan dan mengirim cookie session Django secara otomatis.
    * Punya method khusus seperti login(), logout(), get(), postJson().
    * Membuat kita tidak perlu pusing mengelola cookie dan CSRF secara manual.

  Perbedaan utama:

  * http: generik, cocok untuk API stateless (misal REST tanpa session), tapi semua harus kita atur sendiri.
  * CookieRequest: fokus ke aplikasi yang pakai session Django. Cocok untuk autentikasi (login/logout) dan request yang butuh status user (request.user).

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

  CookieRequest menyimpan state penting, misalnya:

  * Status login (loggedIn atau tidak).
  * Cookie session Django yang dipakai di setiap request.
  * Informasi respons login/logout.

  Kalau kita membuat banyak instance CookieRequest secara terpisah:

  * Setiap instance punya cookie sendiri-sendiri, jadi backend Django bisa menganggap kita “user” yang berbeda-beda, atau bahkan tidak login sama sekali.
  * Akan susah menjaga konsistensi status login di seluruh halaman (satu halaman mengira sudah login, halaman lain mengira belum).

  Dengan membagikan satu instance CookieRequest lewat Provider di root (misalnya di main.dart):

  * Semua widget di aplikasi pakai instance yang sama.
  * Status login sinkron di semua halaman.
  * Setiap request ke Django pasti memakai cookie session yang sama, jadi Django tahu ini user yang sedang login.

  Jadi, CookieRequest diperlakukan seperti “global session manager” yang dibagikan ke seluruh aplikasi.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

  Beberapa konfigurasi penting:

  1. ALLOWED_HOSTS dan 10.0.2.2

    * Di Android emulator, localhost komputer kita diakses lewat alamat 10.0.2.2.
    * Kalau 10.0.2.2 tidak ditambahkan ke ALLOWED_HOSTS di settings.py, Django akan menolak request dari host itu (Bad Request 400).
    * Jadi, kita tambahkan misalnya: ["localhost", "127.0.0.1", "10.0.2.2"] supaya emulator bisa mengakses server Django di laptop kita.

  2. CORS (django-cors-headers)

    * Kalau Flutter (terutama Flutter Web atau origin berbeda) mengakses Django, browser akan memeriksa aturan CORS.
    * Kalau CORS tidak diatur (misalnya CORS_ALLOW_ALL_ORIGINS atau whitelist yang benar), request bisa diblok oleh browser sebelum sampai ke Django.
    * Akibatnya, kita dapat error CORS policy di console, dan data tidak akan sampai ke Flutter.

  3. Pengaturan SameSite dan cookie (CSRF_COOKIE_SAMESITE, SESSION_COOKIE_SAMESITE, Secure, dll)

    * Supaya cookie session dan CSRF bisa dikirim dari client (Flutter) ke Django ketika origin-nya dianggap berbeda, kita perlu mengatur SameSite dan Secure dengan benar.
    * Kalau pengaturan ini salah, cookie tidak dikirim, sehingga Django selalu menganggap user belum login (request.user anonim).

  4. Permission INTERNET di AndroidManifest.xml

    * Di Android, aplikasi butuh izin eksplisit untuk akses internet.
    * Kalau <uses-permission android:name="android.permission.INTERNET" /> tidak ditambahkan, aplikasi bisa jalan, tapi semua request HTTP gagal (tidak bisa konek ke server).

  Kalau konfigurasi-konfigurasi ini tidak benar:

  * Request bisa gagal di level Android (tidak ada internet permission).
  * Bisa ditolak Django (host tidak diizinkan).
  * Bisa diblok browser karena CORS.
  * Atau session tidak terbawa karena cookie tidak terkirim, sehingga autentikasi jadi gagal terus.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

  Alur umumnya seperti ini:

  1. Input di Flutter

    * User mengisi form (misalnya form tambah item, login, register) lewat TextFormField atau TextField.
    * Flutter menyimpan nilai input di variabel (misal _name, _price, dsb) lewat controller atau onChanged.

  2. Pengiriman ke Django

    * Saat user menekan tombol (misalnya tombol Submit atau Login), Flutter memanggil:

      * request.postJson(...) atau request.login(...), atau http.post(...).
    * Data dikirim dalam bentuk body JSON atau form-data ke endpoint Django (misalnya /create-flutter/, /auth/login/, /json/).

  3. Proses di Django

    * Django menerima request di view.
    * View membaca data dari request (POST atau request.body).
    * Django melakukan logika bisnis: simpan ke database, validasi, autentikasi, dsb.
    * Django mengembalikan respons ke Flutter berupa JSON (misalnya status, pesan, atau daftar item).

  4. Penerimaan di Flutter

    * Flutter menerima respons (biasanya Map atau List hasil decode JSON).
    * Data JSON dikonversi menjadi model Dart (misalnya NewsEntry, Item) dengan fromJson().

  5. Menampilkan di UI

    * Flutter memakai FutureBuilder atau setState untuk membangun ulang widget dengan data baru.
    * Data model ditampilkan ke layar, misalnya dalam bentuk ListView, Card, atau halaman detail.

  Jadi intinya: input → dikirim lewat HTTP → diolah Django → hasil JSON → dikonversi jadi model Dart → ditampilkan di widget.

  6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

  Kurang lebih alurnya seperti ini:

  a. Register

  * User buka halaman Register di Flutter.
  * User isi username, password, dan konfirmasi password.
  * Flutter kirim data itu sebagai JSON ke endpoint /auth/register/ lewat request.postJson().
  * Di Django:

    * View register membaca JSON.
    * Cek apakah password1 dan password2 sama.
    * Cek apakah username sudah dipakai.
    * Kalau valid, Django membuat User baru dan menyimpan ke database.
    * Django mengirim respons JSON (status: success atau error dan message).
  * Di Flutter:

    * Kalau status success, Flutter menampilkan SnackBar atau dialog bahwa register berhasil.
    * Lalu Flutter mengarahkan user ke halaman Login.

  b. Login

  * User buka halaman Login di Flutter.
  * User isi username dan password.
  * Flutter memanggil request.login(".../auth/login/", {'username': ..., 'password': ...}).
  * Di Django:

    * View login mengambil username dan password dari request.POST.
    * Memanggil authenticate() untuk verifikasi kredensial.
    * Kalau berhasil dan user aktif, auth_login(request, user) dipanggil untuk membuat session.
    * Django mengirim JSON (status True, username, message) dan menyertakan cookie session di header respons.
  * Di Flutter:

    * CookieRequest menyimpan cookie session tersebut secara otomatis.
    * Properti request.loggedIn akan menjadi true kalau login berhasil.
    * Kalau login sukses, Flutter menampilkan SnackBar dan mengarahkan user ke halaman utama/menu (misalnya MyHomePage atau MenuPage).

  c. Logout

  * User menekan tombol Logout di aplikasi Flutter.
  * Flutter memanggil request.logout(".../auth/logout/").
  * Di Django:

    * View logout memanggil auth_logout(request) untuk menghapus session di server.
    * Django mengirim JSON (status True/False, message).
  * Di Flutter:

    * CookieRequest menghapus cookie session yang tersimpan.
    * request.loggedIn menjadi false.
    * Flutter menampilkan SnackBar bahwa logout berhasil dan mengarahkan user kembali ke halaman Login.

  Dengan alur ini, Django yang mengelola autentikasi dan session, sementara Flutter hanya mengirim data dan memproses respons untuk menampilkan layar yang sesuai.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

  Versi step-by-step yang bisa saya tulis di README kurang lebih seperti ini:

  1. Menyiapkan proyek Django

    * Mengaktifkan virtual environment Python dan menginstal dependensi dari requirements.txt.
    * Menjalankan migrate dan memastikan server Django bisa jalan dengan python manage.py runserver.
    * Membuat app authentication (jika belum ada) dan menambahkannya ke INSTALLED_APPS.

  2. Mengimplementasikan autentikasi di Django

    * Menambahkan view login, register, dan logout di authentication/views.py sesuai spesifikasi (gunakan authenticate, auth_login, dan auth_logout).
    * Menambahkan routing untuk /auth/login/, /auth/register/, dan /auth/logout/ di authentication/urls.py dan meng-include di urls.py utama.
    * Menambahkan django-cors-headers ke INSTALLED_APPS dan MIDDLEWARE, lalu menambahkan pengaturan CORS (CORS_ALLOW_ALL_ORIGINS, CORS_ALLOW_CREDENTIALS, dsb.).
    * Menambahkan 10.0.2.2 ke ALLOWED_HOSTS untuk akses dari Android emulator.

  3. Membuat dan menyesuaikan model item di Django

    * Membuat model Item (misalnya name, price, description, thumbnail, category, is_featured, dan field user sebagai ForeignKey ke User kalau perlu).
    * Menjalankan makemigrations dan migrate.
    * Membuat view JSON yang mengembalikan daftar item, misalnya /json/ yang hanya mengembalikan item milik user yang sedang login (filter user=request.user).
    * Menambahkan URL endpoint JSON untuk daftar item.

  4. Menyiapkan proyek Flutter

    * Membuka proyek Flutter (miufootball_shop_mobile).
    * Memperbaiki pubspec.yaml (menghapus duplikasi dependencies dan menambahkan package yang diperlukan seperti provider, pbp_django_auth, http).
    * Menjalankan flutter pub get untuk mengambil dependensi.

  5. Mengintegrasikan CookieRequest di Flutter

    * Mengubah main.dart agar membungkus MaterialApp dengan Provider<CookieRequest>.
    * Mengatur initialRoute atau home ke halaman LoginPage.

  6. Membuat halaman login dan register di Flutter

    * Membuat file login.dart dan register.dart di folder lib/screens.
    * Mengimplementasikan form username dan password menggunakan TextEditingController.
    * Pada halaman login, memanggil request.login("http://[URL_APLIKASI]/auth/login/", {...}) dan mengarahkan ke halaman menu kalau login sukses.
    * Pada halaman register, memanggil request.postJson("http://[URL_APLIKASI]/auth/register/", jsonEncode({...})) dan mengarahkan ke halaman login kalau registrasi sukses.

  7. Membuat model Dart untuk item

    * Mengambil contoh JSON dari endpoint Django (misalnya [http://localhost:8000/json/](http://localhost:8000/json/)).
    * Menggunakan Quicktype untuk menghasilkan model Dart (misalnya Item atau NewsEntry).
    * Menaruh file model di lib/models/ dan menyesuaikan sedikit kalau perlu (nullable, tipe DateTime, dsb.).

  8. Membuat halaman daftar item di Flutter

    * Membuat halaman list, misalnya ItemListPage atau NewsEntryListPage.
    * Menghubungkan dengan CookieRequest lewat context.watch<CookieRequest>().
    * Membuat fungsi Future<List<Item>> yang memanggil request.get("http://[URL_APLIKASI]/json/") dan mengonversi hasil JSON menjadi list model Item.
    * Menggunakan FutureBuilder dan ListView.builder untuk menampilkan daftar item dalam bentuk Card atau ListTile.
    * Menampilkan field name, price, description singkat, thumbnail, category, dan is_featured pada setiap card sesuai permintaan tugas.

  9. Membuat halaman detail item

    * Membuat halaman ItemDetailPage yang menerima objek Item lewat constructor.
    * Menampilkan semua atribut item (name, price, description, thumbnail, category, is_featured, dsb.) secara lengkap.
    * Menambahkan tombol back untuk kembali ke halaman daftar item.
    * Mengatur onTap pada card di daftar item untuk melakukan Navigator.push ke ItemDetailPage dengan membawa item yang diklik.

  10. Implementasi filter item berdasarkan user yang login

      * Di sisi Django, pada view JSON, menambahkan filter yang hanya mengembalikan item yang terkait dengan request.user.
      * Di sisi Flutter, cukup memanggil endpoint tersebut; hasil yang kembali sudah terfilter berdasarkan user yang login.

  11. Menambahkan fitur logout di Flutter

      * Menambahkan tombol atau menu yang memicu proses logout.
      * Menggunakan request.logout("http://[URL_APLIKASI]/auth/logout/") untuk menghapus session di Django dan CookieRequest.
      * Setelah logout sukses, mengarahkan user kembali ke halaman LoginPage dan menampilkan SnackBar.

  12. Testing dan deployment

      * Menjalankan flutter run -d chrome atau emulator untuk mencoba seluruh flow: register → login → melihat daftar item → melihat detail → logout.
      * Menjalankan python manage.py runserver di backend dan memastikan tidak ada error.
      * Melakukan perbaikan kalau ada error dari CORS, ALLOWED_HOSTS, atau cookie.

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

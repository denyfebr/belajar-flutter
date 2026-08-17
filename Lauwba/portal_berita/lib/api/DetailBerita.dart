/// id : "452e47a50a2d99ed973847c62362d8f0"
/// jdl_news : "Kelas Reguler Android Studio Dari Universitas AKAKOM"
/// post_on : "Senin, 17-11-2025 21:53"
/// nama_kategori : "Berita"
/// foto_news : "https://lauwba.com/../news/kelas-reguler-android-studio-bersama-mas-faruq-dari-universitas-akakom.webp"
/// judul_seo : "kelas-reguler-android-studio-dari-universitas-akakom"
/// ket_news : "Training Kelas Reguler Android Studio Bersama Mas Faruq Dari Universitas AKAKOM Dalam menunjang studi akhir beliau\r\n\r\n \r\n\r\nTarget Peserta :\r\n===========\r\nProgram ini dapat diikuti oleh siapapun baik Umum, Mahasiswa atau pelajar sebab\r\n\r\ndidesain khusus bagi Anda yang ingin sampai mahir didalam membuat Aplikasi ANDROID dengan dibimbing dari NOL/Dasar dan GRATIS mengulang sampai BISA!.\r\n\r\n \r\n\r\nInfo Pendaftaran Kursus Dan Training IT (Website, Android Studio, Flutter & Digital Marketing :\r\nhttps://lauwba.com\r\n==============\r\nInstagram : @lauwba_techno\r\nTwiteer : @lauwba_techno\r\nWeb : lauwba.com\r\nHub kami whatsap : 082221777206\r\n"
/// message : "data ditemukan"
/// error : 200

class DetailBerita {
  DetailBerita({
      String? id, 
      String? jdlNews, 
      String? postOn, 
      String? namaKategori, 
      String? fotoNews, 
      String? judulSeo, 
      String? ketNews, 
      String? message, 
      num? error,}){
    _id = id;
    _jdlNews = jdlNews;
    _postOn = postOn;
    _namaKategori = namaKategori;
    _fotoNews = fotoNews;
    _judulSeo = judulSeo;
    _ketNews = ketNews;
    _message = message;
    _error = error;
}

  DetailBerita.fromJson(dynamic json) {
    _id = json['id'];
    _jdlNews = json['jdl_news'];
    _postOn = json['post_on'];
    _namaKategori = json['nama_kategori'];
    _fotoNews = json['foto_news'];
    _judulSeo = json['judul_seo'];
    _ketNews = json['ket_news'];
    _message = json['message'];
    _error = json['error'];
  }
  String? _id;
  String? _jdlNews;
  String? _postOn;
  String? _namaKategori;
  String? _fotoNews;
  String? _judulSeo;
  String? _ketNews;
  String? _message;
  num? _error;
DetailBerita copyWith({  String? id,
  String? jdlNews,
  String? postOn,
  String? namaKategori,
  String? fotoNews,
  String? judulSeo,
  String? ketNews,
  String? message,
  num? error,
}) => DetailBerita(  id: id ?? _id,
  jdlNews: jdlNews ?? _jdlNews,
  postOn: postOn ?? _postOn,
  namaKategori: namaKategori ?? _namaKategori,
  fotoNews: fotoNews ?? _fotoNews,
  judulSeo: judulSeo ?? _judulSeo,
  ketNews: ketNews ?? _ketNews,
  message: message ?? _message,
  error: error ?? _error,
);
  String? get id => _id;
  String? get jdlNews => _jdlNews;
  String? get postOn => _postOn;
  String? get namaKategori => _namaKategori;
  String? get fotoNews => _fotoNews;
  String? get judulSeo => _judulSeo;
  String? get ketNews => _ketNews;
  String? get message => _message;
  num? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['jdl_news'] = _jdlNews;
    map['post_on'] = _postOn;
    map['nama_kategori'] = _namaKategori;
    map['foto_news'] = _fotoNews;
    map['judul_seo'] = _judulSeo;
    map['ket_news'] = _ketNews;
    map['message'] = _message;
    map['error'] = _error;
    return map;
  }

}
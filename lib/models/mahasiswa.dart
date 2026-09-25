import 'dart:convert';

/// OOP Mahasiswa: Data Class Generator
/// Berisi constructor, properties, copyWith, toMap, fromMap, toJson, fromJson, toString, ==, dan hashCode.
class Mahasiswa {
  final String fullname;
  final String email;
  final String nomorHp;
  final String gender;
  final String tanggalLahir;
  final String alamat;
  final String username;
  final String password;

  const Mahasiswa({
    required this.fullname,
    required this.email,
    required this.nomorHp,
    required this.gender,
    required this.tanggalLahir,
    required this.alamat,
    required this.username,
    required this.password,
  });

  /// Method copyWith untuk membuat salinan objek dengan modifikasi nilai tertentu
  Mahasiswa copyWith({
    String? fullname,
    String? email,
    String? nomorHp,
    String? gender,
    String? tanggalLahir,
    String? alamat,
    String? username,
    String? password,
  }) {
    return Mahasiswa(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      nomorHp: nomorHp ?? this.nomorHp,
      gender: gender ?? this.gender,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      alamat: alamat ?? this.alamat,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  /// Konversi objek Mahasiswa menjadi `Map<String, dynamic>`
  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'email': email,
      'nomorHp': nomorHp,
      'gender': gender,
      'tanggalLahir': tanggalLahir,
      'alamat': alamat,
      'username': username,
      'password': password,
    };
  }

  /// Membuat objek Mahasiswa dari `Map<String, dynamic>`
  factory Mahasiswa.fromMap(Map<String, dynamic> map) {
    return Mahasiswa(
      fullname: map['fullname'] ?? '',
      email: map['email'] ?? '',
      nomorHp: map['nomorHp'] ?? '',
      gender: map['gender'] ?? '',
      tanggalLahir: map['tanggalLahir'] ?? '',
      alamat: map['alamat'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  /// Serialisasi objek ke format JSON String
  String toJson() => json.encode(toMap());

  /// Deserialisasi dari JSON String ke objek Mahasiswa
  factory Mahasiswa.fromJson(String source) =>
      Mahasiswa.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Representasi String untuk debugging dan logging
  @override
  String toString() {
    return 'Mahasiswa(fullname: $fullname, email: $email, nomorHp: $nomorHp, gender: $gender, tanggalLahir: $tanggalLahir, alamat: $alamat, username: $username, password: $password)';
  }

  /// Operator pembanding kesetaraan objek
  @override
  bool operator ==(covariant Mahasiswa other) {
    if (identical(this, other)) return true;

    return other.fullname == fullname &&
        other.email == email &&
        other.nomorHp == nomorHp &&
        other.gender == gender &&
        other.tanggalLahir == tanggalLahir &&
        other.alamat == alamat &&
        other.username == username &&
        other.password == password;
  }

  /// HashCode berdasarkan atribut data class
  @override
  int get hashCode {
    return fullname.hashCode ^
        email.hashCode ^
        nomorHp.hashCode ^
        gender.hashCode ^
        tanggalLahir.hashCode ^
        alamat.hashCode ^
        username.hashCode ^
        password.hashCode;
  }
}

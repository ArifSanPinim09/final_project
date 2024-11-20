class UserModel {
  final String uid;
  final String? imageId;
  final String? name;
  final String? email;
  final String? phone;
  final String? birthDate;
  final String? address;
  final String? role;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.uid,
    this.imageId,
    this.name,
    this.email,
    this.phone,
    this.birthDate,
    this.address,
    this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isProfileComplete =>
      name != null && birthDate != null && address != null && role != null;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      imageId: json['imageId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      address: json['address'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'imageId': imageId,
      'name': name,
      'email': email,
      'phone': phone,
      'birthDate': birthDate,
      'address': address,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? uid;
  String name;
  String surname;
  String mail;
  String? profilePhoto;
  String username;

  UserModel({
    this.uid,
    required this.name,
    required this.surname,
    required this.mail,
    this.profilePhoto,
    required this.username,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? surname,
    String? mail,
    String? profilePhoto,
    String? username,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      mail: mail ?? this.mail,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'surname': surname,
      'mail': mail,
      'profilePhoto': profilePhoto,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      mail: map['mail'] as String,
      profilePhoto: map['profilePhoto'] != null
          ? map['profilePhoto'] as String
          : null,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, surname: $surname, mail: $mail, profilePhoto: $profilePhoto, username: $username)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.surname == surname &&
        other.mail == mail &&
        other.profilePhoto == profilePhoto &&
        other.username == username;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        mail.hashCode ^
        profilePhoto.hashCode ^
        username.hashCode;
  }
}

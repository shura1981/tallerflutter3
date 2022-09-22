// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

SettingsFromJson(String value) => Settings.fromJson(value);
SettingsToJson(Settings setting) => json.encode(setting.toMap());

class Settings {
  String? userName;
  String? photo;
  bool themeDark = false;
  Settings({
    this.userName,
    this.photo,
    required this.themeDark,
  });

  Settings copyWith({
    String? userName,
    String? photo,
    bool? themeDark,
  }) {
    return Settings(
      userName: userName ?? this.userName,
      photo: photo ?? this.photo,
      themeDark: themeDark ?? this.themeDark,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userName != null) {
      result.addAll({'userName': userName});
    }
    if (photo != null) {
      result.addAll({'photo': photo});
    }
    result.addAll({'themeDark': themeDark});

    return result;
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      userName: map['userName'],
      photo: map['photo'],
      themeDark: map['themeDark'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source));

  @override
  String toString() =>
      'Settings(userName: $userName, photo: $photo, themeDark: $themeDark)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Settings &&
        other.userName == userName &&
        other.photo == photo &&
        other.themeDark == themeDark;
  }

  @override
  int get hashCode => userName.hashCode ^ photo.hashCode ^ themeDark.hashCode;
}

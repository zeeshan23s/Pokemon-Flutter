import 'dart:convert';

class Pokemon {
  String? name;
  String? url;
  String? height;
  String? width;
  Pokemon({
    this.name,
    this.url,
    this.height,
    this.width,
  });

  Pokemon copyWith({
    String? name,
    String? url,
    String? height,
    String? width,
  }) {
    return Pokemon(
      name: name ?? this.name,
      url: url ?? this.url,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'height': height,
      'width': width,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'],
      url: map['url'],
      height: map['height'],
      width: map['width'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pokemon(name: $name, url: $url, height: $height, width: $width)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pokemon &&
        other.name == name &&
        other.url == url &&
        other.height == height &&
        other.width == width;
  }

  @override
  int get hashCode {
    return name.hashCode ^ url.hashCode ^ height.hashCode ^ width.hashCode;
  }
}

class Locations {
  List<Nearby>? nearby;
  List<Popular>? popular;

  Locations({this.nearby, this.popular});

  factory Locations.fromJson(Map<String, dynamic> json) {
    var nearbyList = json['data']['nearby'] as List;
    var popularList = json['data']['popular'] as List;

    List<Nearby> nearby = nearbyList.map((i) => Nearby.fromJson(i)).toList();
    List<Popular> popular =
        popularList.map((i) => Popular.fromJson(i)).toList();

    return Locations(nearby: nearby, popular: popular);
  }
}

class Nearby {
  int? id;
  String? name;
  String? description;
  String? location;
  double? price;
  int? min;
  String? active;
  String? coverImage;
  int? stepCount;
  int? duration;
  int? distance;
  double? rating;
  NearbyAuthor? author;

  Nearby({
    this.id,
    this.name,
    this.description,
    this.location,
    this.price,
    this.min,
    this.active,
    this.coverImage,
    this.stepCount,
    this.duration,
    this.distance,
    this.rating,
    this.author,
  });

  factory Nearby.fromJson(Map<String, dynamic> json) {
    return Nearby(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      price:
          json["price"] == null ? null : double.parse(json["price"].toString()),
      min: json['min'],
      active: json['active'],
      coverImage: json['cover_image'],
      stepCount: json['stepcount'],
      duration: json['duration'],
      distance: json['distance'],
      author: NearbyAuthor.fromJson(json['author']),
      rating: json["price"] == null
          ? null
          : double.parse(json["average_rating"].toString()),
    );
  }
}

class NearbyAuthor {
  int? id;
  String? userName;
  String? img;
  String? location;

  NearbyAuthor({
    this.id,
    this.userName,
    this.img,
    this.location,
  });

  factory NearbyAuthor.fromJson(Map<String, dynamic> json) {
    return NearbyAuthor(
      id: json['id'],
      userName: json['username'],
      img: json['img_path'],
      location: json['location'],
    );
  }
}

class Popular {
  int? id;
  String? name;
  String? description;
  String? location;
  double? price;
  int? min;
  String? active;
  String? coverImage;
  int? stepCount;
  int? duration;
  int? distance;
  double? rating;
  PopularAuthor? author;

  Popular({
    this.id,
    this.name,
    this.description,
    this.location,
    this.price,
    this.min,
    this.active,
    this.coverImage,
    this.stepCount,
    this.duration,
    this.distance,
    this.rating,
    this.author,
  });

  factory Popular.fromJson(Map<String, dynamic> json) {
    return Popular(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      price:
          json["price"] == null ? null : double.parse(json["price"].toString()),
      min: json['min'],
      active: json['active'],
      coverImage: json['cover_image'],
      stepCount: json['stepcount'],
      duration: json['duration'],
      distance: json['distance'],
      author: PopularAuthor.fromJson(json['author']),
      rating: json["price"] == null
          ? null
          : double.parse(json["average_rating"].toString()),
    );
  }
}

class PopularAuthor {
  int? id;
  String? userName;
  String? img;
  String? location;

  PopularAuthor({
    this.id,
    this.userName,
    this.img,
    this.location,
  });

  factory PopularAuthor.fromJson(Map<String, dynamic> json) {
    return PopularAuthor(
      id: json['id'],
      userName: json['username'],
      img: json['img_path'],
      location: json['location'],
    );
  }
}

class ChractersResponseDto {
  late Info info;
  late List<Results> results;

  ChractersResponseDto.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    results = <Results>[];
    json['results'].forEach((v) {
      results.add(Results.fromJson(v));
    });
  }
}

class Info {
  late int count;
  late int pages;
  late String next;
  late dynamic prev;

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }
}

class Results {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Origin origin;
  late Location location;
  late String image;
  late String url;
  late String created;

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = json['origin'];
    location = json['location'];
    image = json['image'];
    url = json['url'];
    created = json['created'];
  }
}

class Origin {
  late String name;
  late String url;

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class Location {
  late String name;
  late String url;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

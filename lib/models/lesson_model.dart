class LessonModel {
  LessonModel({
    required this.requestId,
    required this.items,
    required this.count,
    required this.anyKey,
  });
  late final String requestId;
  late final List<Items> items;
  late final int count;
  late final String anyKey;

  LessonModel.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    count = json['count'];
    anyKey = json['anyKey'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['requestId'] = requestId;
    data['items'] = items.map((e) => e.toJson()).toList();
    data['count'] = count;
    data['anyKey'] = anyKey;
    return data;
  }
}

class Items {
  Items({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });
  late final String createdAt;
  late final String name;
  late final int duration;
  late final String category;
  late final bool locked;
  late final String id;

  Items.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    duration = json['duration'];
    category = json['category'];
    locked = json['locked'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['duration'] = duration;
    data['category'] = category;
    data['locked'] = locked;
    data['id'] = id;
    return data;
  }
}

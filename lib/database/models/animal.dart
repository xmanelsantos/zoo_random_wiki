// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Animal {
  int? id;
  String? name;
  String? scientificName;
  String? animalType;
  String? activeTime;
  String? lengthMin;
  String? lengthMax;
  String? weightMin;
  String? weightMax;
  String? lifespan;
  String? habitat;
  String? diet;
  String? geoRange;
  String? imageLink;

  Animal(
    this.id,
    this.name,
    this.scientificName,
    this.animalType,
    this.activeTime,
    this.lengthMin,
    this.lengthMax,
    this.weightMin,
    this.weightMax,
    this.lifespan,
    this.habitat,
    this.diet,
    this.geoRange,
    this.imageLink,
  );

  Animal copyWith({
    int? id,
    String? name,
    String? scientificName,
    String? animalType,
    String? activeTime,
    String? lengthMin,
    String? lengthMax,
    String? weightMin,
    String? weightMax,
    String? lifespan,
    String? habitat,
    String? diet,
    String? geoRange,
    String? imageLink,
  }) {
    return Animal(
      id ?? this.id,
      name ?? this.name,
      scientificName ?? this.scientificName,
      animalType ?? this.animalType,
      activeTime ?? this.activeTime,
      lengthMin ?? this.lengthMin,
      lengthMax ?? this.lengthMax,
      weightMin ?? this.weightMin,
      weightMax ?? this.weightMax,
      lifespan ?? this.lifespan,
      habitat ?? this.habitat,
      diet ?? this.diet,
      geoRange ?? this.geoRange,
      imageLink ?? this.imageLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'latin_name': scientificName,
      'animal_type': animalType,
      'active_time': activeTime,
      'length_min': lengthMin,
      'length_max': lengthMax,
      'weight_min': weightMin,
      'weight_max': weightMax,
      'lifespan': lifespan,
      'habitat': habitat,
      'diet': diet,
      'geo_range': geoRange,
      'image_link': imageLink,
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      map['id'] as int,
      map['name'] as String,
      map['latin_name'] as String,
      map['animal_type'] as String,
      map['active_time'] as String,
      map['length_min'] as String,
      map['length_max'] as String,
      map['weight_min'] as String,
      map['weight_max'] as String,
      map['lifespan'] as String,
      map['habitat'] as String,
      map['diet'] as String,
      map['geo_range'] as String,
      map['image_link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) =>
      Animal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Animal(id: $id, name: $name, scientificName: $scientificName, animalType: $animalType, activeTime: $activeTime, lengthMin: $lengthMin, lengthMax: $lengthMax, weightMin: $weightMin, weightMax: $weightMax, lifespan: $lifespan, habitat: $habitat, diet: $diet, geoRange: $geoRange, imageLink: $imageLink)';
  }

  @override
  bool operator ==(covariant Animal other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.scientificName == scientificName &&
        other.animalType == animalType &&
        other.activeTime == activeTime &&
        other.lengthMin == lengthMin &&
        other.lengthMax == lengthMax &&
        other.weightMin == weightMin &&
        other.weightMax == weightMax &&
        other.lifespan == lifespan &&
        other.habitat == habitat &&
        other.diet == diet &&
        other.geoRange == geoRange &&
        other.imageLink == imageLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        scientificName.hashCode ^
        animalType.hashCode ^
        activeTime.hashCode ^
        lengthMin.hashCode ^
        lengthMax.hashCode ^
        weightMin.hashCode ^
        weightMax.hashCode ^
        lifespan.hashCode ^
        habitat.hashCode ^
        diet.hashCode ^
        geoRange.hashCode ^
        imageLink.hashCode;
  }
}

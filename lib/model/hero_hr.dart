class HeroHr {
  final int id;
  final String name;
  final String description;
  final String urlImage;
  final String powers;
  final int rate;
  
  const HeroHr({
    required this.id,
    required this.name,
    required this.description,
    required this.urlImage,
    required this.powers,
    required this.rate,
    

  });

  factory HeroHr.fromJson(Map<String, dynamic> json) => HeroHr(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        urlImage: json['urlImage'],
        powers:json['powers'],
        rate:json['rate'],
      );

 

  Map<String, dynamic> toJson(String s) => {
        'id': id,
        'name': name,
        'description': description,
        'urlImage': urlImage,
        'powers': powers,
        'rate': rate,
      };
  
}

class Laptop {
  final String id;
  final String name;
  final String description;
  final String brand;
  final num price;
  final String processor;
  final String ram;
  final String storage;
  final String graphics;
  final String os;
  final String display;
  final String image;
  final String createdAt;

  Laptop({
    this.id = '', 
    required this.name,
    required this.description,
    required this.brand,
    required this.price,
    required this.processor,
    required this.ram,
    required this.storage,
    required this.graphics,
    required this.os,
    required this.display,
    this.image = 'https://t4.ftcdn.net/jpg/02/07/45/97/360_F_207459754_XZ4VRclGSmux91GZ0ukm4oOPcF8wkN08.jpg',
    this.createdAt = 'Sin fecha de creación',
  });

  factory Laptop.fromJson(Map<String, dynamic> json) {
    return Laptop(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      brand: json['brand'],
      price: json['price'],
      processor: json['processor'],
      ram: json['ram'],
      storage: json['storage'],
      graphics: json['graphics'],
      os: json['os'],
      display: json['display'],
      image: json['image'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'brand': brand,
      'price': price,
      'processor': processor,
      'ram': ram,
      'storage': storage,
      'graphics': graphics,
      'os': os,
      'display': display,
    };
  }
}

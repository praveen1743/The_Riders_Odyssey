class Ride {
  final String id;
  final String driverId;
  final String startLocation;
  final String endLocation;
  final DateTime startTime;
  final int availableSeats;
  final double price;
  final String status;

  Ride({
    required this.id,
    required this.driverId,
    required this.startLocation,
    required this.endLocation,
    required this.startTime,
    required this.availableSeats,
    required this.price,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'driverId': driverId,
      'startLocation': startLocation,
      'endLocation': endLocation,
      'startTime': startTime.toIso8601String(),
      'availableSeats': availableSeats,
      'price': price,
      'status': status,
    };
  }

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'],
      driverId: json['driverId'],
      startLocation: json['startLocation'],
      endLocation: json['endLocation'],
      startTime: DateTime.parse(json['startTime']),
      availableSeats: json['availableSeats'],
      price: json['price'],
      status: json['status'],
    );
  }
}
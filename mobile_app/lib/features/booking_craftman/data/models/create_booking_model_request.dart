class CreateBookingModelRequest {
  final String craftmanId;
  final String? clientId;
  final String date; // Format: 'YYYY-MM-DD'
  final String time; // Format: 'HH:MM'
  final String price; // Format: 'HH:MM'

  CreateBookingModelRequest({
    required this.craftmanId,
    this.clientId,
    required this.date,
    required this.time,
    this.price = '0',
  });

  Map<String, dynamic> toJson() {
    return {
      'craftsman': craftmanId,
      'client': clientId,
      'date': date,
      'time': time,
      'price': price,

    };
  }
}
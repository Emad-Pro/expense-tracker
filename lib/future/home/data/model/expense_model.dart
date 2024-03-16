class ExpanseModel {
  final int? id;
  final String name;
  final double amount;
  final DateTime? date;

  ExpanseModel({this.id, this.name = '', this.amount = 0.0, this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'date': date,
    };
  }

  factory ExpanseModel.fromMap(Map<String, dynamic> map) {
    return ExpanseModel(
      id: map['id'] as int,
      name: map['name'] as String,
      amount: map['amount'] ?? 0,
      date: map['date'] ?? DateTime.now(),
    );
  }
}

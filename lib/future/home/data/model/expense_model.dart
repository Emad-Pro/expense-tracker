class ExpanseModel {
  final String name;
  final String? amount;
  final String? date;

  ExpanseModel({this.name = '', this.amount, this.date});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'date': date,
    };
  }

  factory ExpanseModel.fromMap(Map<String, dynamic> map) {
    return ExpanseModel(
      name: map['name'] as String,
      amount: map['amount'],
      date: map['date'] ?? DateTime.now().toString(),
    );
  }
}

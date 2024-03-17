class ExpanseModelGetData {
  final int id;
  final String name;
  final String? amount;
  final String? date;

  ExpanseModelGetData(
      {this.name = '', this.amount, this.date, required this.id});

  Map<String, dynamic> toMap() {
    return {'name': name, 'amount': amount, 'date': date, 'id': id};
  }

  factory ExpanseModelGetData.fromMap(Map<String, dynamic> map) {
    return ExpanseModelGetData(
      name: map['name'] as String,
      id: map['id'],
      amount: map['amount'],
      date: map['date'] ?? DateTime.now().toString(),
    );
  }
}

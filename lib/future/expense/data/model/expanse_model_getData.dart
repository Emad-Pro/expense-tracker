class ExpanseModelGetData {
  final int id;
  final String description;
  final String? amount;
  final String? date;
  final String? time;
  final String? categories;
  ExpanseModelGetData(
      {this.description = '',
      this.amount,
      this.date,
      required this.id,
      required this.categories,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'amount': amount,
      'date': date,
      'id': id,
      'categories': categories,
      'time': time
    };
  }

  factory ExpanseModelGetData.fromMap(Map<String, dynamic> map) {
    return ExpanseModelGetData(
        description: map['description'] as String,
        id: map['id'],
        amount: map['amount'],
        date: map['date'],
        time: map['time'],
        categories: map['categories']);
  }
}

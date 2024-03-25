class ExpanseModel {
  final String description;
  final String? amount;
  final String? date;
  final String? time;
  final String? categories;

  ExpanseModel(
      {this.description = '',
      this.amount,
      this.date,
      this.categories,
      this.time});

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'amount': amount,
      'date': date,
      'categories': categories,
      'time': time,
    };
  }

  factory ExpanseModel.fromMap(Map<String, dynamic> map) {
    return ExpanseModel(
        description: map['description'],
        amount: map['amount'],
        date: map['date'],
        categories: map['categories'],
        time: map['time']);
  }
}

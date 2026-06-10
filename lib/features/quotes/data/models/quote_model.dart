import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel({
    required super.id,
    required super.text,
    required super.author,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['id'] ?? '',
      text: json['text'] ?? '',
      author: json['author'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author,
    };
  }
}
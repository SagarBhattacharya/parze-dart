import 'dart:convert';

class Result {
  final String type;
  final dynamic data;

  Map<String, Object?>? toJson() {
    if (data is String) {
      return {'type': type, 'data': (data as String)};
    } else if (data is List<Result>) {
      return {
        'type': type,
        'data':
            (data as List<Result>).map((result) {
              return result.toJson();
            }).toList(),
      };
    }
    return null;
  }

  @override
  String toString() {
    return JsonEncoder.withIndent("  ").convert(toJson());
  }

  Result({required this.type, required this.data});
}

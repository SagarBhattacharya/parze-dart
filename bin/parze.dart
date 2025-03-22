import 'package:parze/parze.dart';

void main(List<String> arguments) {
  final parser = many(or([letters(), digits()]));
  final result = parser.run("");
  print(result);
}

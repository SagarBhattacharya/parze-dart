import 'package:parze/core/result.dart';
import 'package:parze/core/state.dart';

class Parser {
  StateTransformerFunction update;
  Parser({required this.update});

  Result run(String target) {
    State state = State(source: target);
    return update(state).result!;
  }
}

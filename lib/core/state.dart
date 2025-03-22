import 'package:parze/core/result.dart';

class State {
  bool haveError = false;
  int index = 0;
  Result? result;
  final String source;

  State({required this.source});

  State success({required String type, required dynamic data}) {
    State state = State(source: source);
    state.result = Result(type: type, data: data);
    if (data is String) {
      state.index = index + data.length;
    }
    return state;
  }

  State error(String message) {
    State state = State(source: source);
    state.result = Result(type: "error", data: message);
    state.haveError = true;
    return state;
  }
}

typedef StateTransformerFunction = State Function(State);

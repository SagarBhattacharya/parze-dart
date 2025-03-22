import 'package:parze/core/parser.dart';
import 'package:parze/core/result.dart';
import 'package:parze/core/state.dart';

Parser many(Parser parser, {String? type, bool atLeastOne = false}) {
  return Parser(
    update: (state) {
      if (state.haveError) return state;

      List<Result> results = [];
      State nextState = state;

      while (true) {
        State testState = parser.update(nextState);
        if (testState.haveError) {
          break;
        }
        results.add(testState.result!);
        nextState = testState;
      }

      if (atLeastOne && results.isEmpty) {
        return nextState.error(
          "At least one match expected but found none at ${nextState.index}",
        );
      }

      return nextState.success(type: type ?? "many", data: results);
    },
  );
}

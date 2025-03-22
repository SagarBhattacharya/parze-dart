import 'package:parze/core/parser.dart';
import 'package:parze/core/result.dart';
import 'package:parze/core/state.dart';

Parser and(List<Parser> parsers, {String? type}) {
  return Parser(
    update: (state) {
      if (state.haveError) return state;

      List<Result> results = [];
      State nextState = state;

      for (var parser in parsers) {
        nextState = parser.update(nextState);
        results.add(nextState.result!);
      }
      return nextState.success(type: type ?? "sequence", data: results);
    },
  );
}

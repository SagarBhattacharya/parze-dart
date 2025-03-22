import 'package:parze/core/parser.dart';
import 'package:parze/core/state.dart';

Parser or(List<Parser> parsers) {
  return Parser(
    update: (state) {
      if (state.haveError) return state;
      State nextState = state;

      for (var parser in parsers) {
        nextState = parser.update(state);
        if (!nextState.haveError) {
          return nextState;
        }
      }
      return nextState.error("No Matches Found at ${state.index}");
    },
  );
}

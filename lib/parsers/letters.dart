import 'package:parze/core/parser.dart';

Parser letters() {
  return Parser(
    update: (state) {
      if (state.haveError) return state;
      final target = state.source.substring(state.index);

      if (target.isEmpty) {
        return state.error("Unexpected End of Input at ${state.index}");
      }

      final match = RegExp(r'^[A-Za-z]+').firstMatch(target);
      if (match != null) {
        return state.success(type: "letters", data: match[0]);
      }

      return state.error("Expected a letter at ${state.index}...");
    },
  );
}

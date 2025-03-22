import 'package:parze/core/parser.dart';

Parser string(String pattern) {
  return Parser(
    update: (state) {
      if (state.haveError) return state;
      final target = state.source.substring(state.index);

      if (target.isEmpty) {
        return state.error("Unexpected End of Input at ${state.index}");
      }

      if (target.startsWith(pattern)) {
        return state.success(type: "string", data: pattern);
      }

      return state.error(
        "Expected $pattern but got ${target.substring(0, pattern.length)}...",
      );
    },
  );
}

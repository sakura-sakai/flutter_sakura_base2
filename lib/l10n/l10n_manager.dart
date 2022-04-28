import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base2/route/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// L10n with Provider and using for ViewController
final l10nProvider = Provider<L10n>((ref) {
  return L10n.of(ref.read(contextProvider))!;
});

/// L10n with hook and using for View
L10n useL10n() => L10n.of(useContext())!;

extension StringL10nExtension on String {
  String mapArgs(List<String> args) {
    if (args.isEmpty) return this;

    String result = this;

    for (final arg in args) {
      result = result.replaceFirst(RegExp(r'{}'), arg);
    }

    return result;
  }
}

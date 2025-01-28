import 'package:kz_h/generated/l10n.dart';

String monthFromIntToString(int i, context) {
  final s = S.of(context);
  final months = [
    s.monthJanuary,
    s.monthFebruary,
    s.monthMarch,
    s.monthApril,
    s.monthMay,
    s.monthJune,
    s.monthJuly,
    s.monthAugust,
    s.monthSeptember,
    s.monthOctober,
    s.monthNovember,
    s.monthDecember,
  ];

  if (i < 1 || i > 12) {
    throw ArgumentError('Month index must be between 1 and 12.');
  }

  return months[i - 1];
}

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a kk locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'kk';

  static String m0(username, month, year) =>
      "@${username} ~ ${month} ${year} қосылды";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accuracy": MessageLookupByLibrary.simpleMessage("Дәлдік"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "Құпиясөзді растау",
    ),
    "email": MessageLookupByLibrary.simpleMessage("Электрондық пошта"),
    "fireDays": MessageLookupByLibrary.simpleMessage("Стрик"),
    "login": MessageLookupByLibrary.simpleMessage("Кіру"),
    "monthApril": MessageLookupByLibrary.simpleMessage("Сәуір"),
    "monthAugust": MessageLookupByLibrary.simpleMessage("Тамыз"),
    "monthDecember": MessageLookupByLibrary.simpleMessage("Желтоқсан"),
    "monthFebruary": MessageLookupByLibrary.simpleMessage("Ақпан"),
    "monthJanuary": MessageLookupByLibrary.simpleMessage("Қаңтар"),
    "monthJuly": MessageLookupByLibrary.simpleMessage("Шілде"),
    "monthJune": MessageLookupByLibrary.simpleMessage("Маусым"),
    "monthMarch": MessageLookupByLibrary.simpleMessage("Наурыз"),
    "monthMay": MessageLookupByLibrary.simpleMessage("Мамыр"),
    "monthNovember": MessageLookupByLibrary.simpleMessage("Қараша"),
    "monthOctober": MessageLookupByLibrary.simpleMessage("Қазан"),
    "monthSeptember": MessageLookupByLibrary.simpleMessage("Қыркүйек"),
    "password": MessageLookupByLibrary.simpleMessage("Құпиясөз"),
    "profileOverview": MessageLookupByLibrary.simpleMessage("Шолу"),
    "questions": MessageLookupByLibrary.simpleMessage("Сұрақтар"),
    "register": MessageLookupByLibrary.simpleMessage("Тіркелу"),
    "score": MessageLookupByLibrary.simpleMessage("Ұпай"),
    "username": MessageLookupByLibrary.simpleMessage("Қолданушы аты"),
    "usernameJoinedMonthYear": m0,
    "usernameOrEmail": MessageLookupByLibrary.simpleMessage(
      "Қолданушы аты немесе email",
    ),
  };
}

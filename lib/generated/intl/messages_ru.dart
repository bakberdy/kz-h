// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(username, month, year) =>
      "@${username} ~ Присоединился в ${month} ${year}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accuracy": MessageLookupByLibrary.simpleMessage("Точность"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm password"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "fireDays": MessageLookupByLibrary.simpleMessage("Серия дней"),
    "login": MessageLookupByLibrary.simpleMessage("Войти"),
    "monthApril": MessageLookupByLibrary.simpleMessage("April"),
    "monthAugust": MessageLookupByLibrary.simpleMessage("August"),
    "monthDecember": MessageLookupByLibrary.simpleMessage("December"),
    "monthFebruary": MessageLookupByLibrary.simpleMessage("February"),
    "monthJanuary": MessageLookupByLibrary.simpleMessage("January"),
    "monthJuly": MessageLookupByLibrary.simpleMessage("July"),
    "monthJune": MessageLookupByLibrary.simpleMessage("June"),
    "monthMarch": MessageLookupByLibrary.simpleMessage("March"),
    "monthMay": MessageLookupByLibrary.simpleMessage("May"),
    "monthNovember": MessageLookupByLibrary.simpleMessage("November"),
    "monthOctober": MessageLookupByLibrary.simpleMessage("October"),
    "monthSeptember": MessageLookupByLibrary.simpleMessage("September"),
    "password": MessageLookupByLibrary.simpleMessage("Пароль"),
    "profileOverview": MessageLookupByLibrary.simpleMessage("Обзор"),
    "questions": MessageLookupByLibrary.simpleMessage("Вопросы"),
    "register": MessageLookupByLibrary.simpleMessage("Зарегистрироваться!"),
    "score": MessageLookupByLibrary.simpleMessage("Очки"),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "usernameJoinedMonthYear": m0,
    "usernameOrEmail": MessageLookupByLibrary.simpleMessage(
      "Имя пользователя или Email",
    ),
  };
}

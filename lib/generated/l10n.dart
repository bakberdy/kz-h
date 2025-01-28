// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign in`
  String get login {
    return Intl.message('Sign in', name: 'login', desc: '', args: []);
  }

  /// `Register Now!`
  String get register {
    return Intl.message('Register Now!', name: 'register', desc: '', args: []);
  }

  /// `Username or Email`
  String get usernameOrEmail {
    return Intl.message(
      'Username or Email',
      name: 'usernameOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `@{username} ~ Joined {month} {year}`
  String usernameJoinedMonthYear(Object username, Object month, Object year) {
    return Intl.message(
      '@$username ~ Joined $month $year',
      name: 'usernameJoinedMonthYear',
      desc: '',
      args: [username, month, year],
    );
  }

  /// `Overview`
  String get profileOverview {
    return Intl.message(
      'Overview',
      name: 'profileOverview',
      desc: '',
      args: [],
    );
  }

  /// `Fire Days`
  String get fireDays {
    return Intl.message('Fire Days', name: 'fireDays', desc: '', args: []);
  }

  /// `Score`
  String get score {
    return Intl.message('Score', name: 'score', desc: '', args: []);
  }

  /// `Questions`
  String get questions {
    return Intl.message('Questions', name: 'questions', desc: '', args: []);
  }

  /// `Accuracy`
  String get accuracy {
    return Intl.message('Accuracy', name: 'accuracy', desc: '', args: []);
  }

  /// `January`
  String get monthJanuary {
    return Intl.message('January', name: 'monthJanuary', desc: '', args: []);
  }

  /// `February`
  String get monthFebruary {
    return Intl.message('February', name: 'monthFebruary', desc: '', args: []);
  }

  /// `March`
  String get monthMarch {
    return Intl.message('March', name: 'monthMarch', desc: '', args: []);
  }

  /// `April`
  String get monthApril {
    return Intl.message('April', name: 'monthApril', desc: '', args: []);
  }

  /// `May`
  String get monthMay {
    return Intl.message('May', name: 'monthMay', desc: '', args: []);
  }

  /// `June`
  String get monthJune {
    return Intl.message('June', name: 'monthJune', desc: '', args: []);
  }

  /// `July`
  String get monthJuly {
    return Intl.message('July', name: 'monthJuly', desc: '', args: []);
  }

  /// `August`
  String get monthAugust {
    return Intl.message('August', name: 'monthAugust', desc: '', args: []);
  }

  /// `September`
  String get monthSeptember {
    return Intl.message(
      'September',
      name: 'monthSeptember',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get monthOctober {
    return Intl.message('October', name: 'monthOctober', desc: '', args: []);
  }

  /// `November`
  String get monthNovember {
    return Intl.message('November', name: 'monthNovember', desc: '', args: []);
  }

  /// `December`
  String get monthDecember {
    return Intl.message('December', name: 'monthDecember', desc: '', args: []);
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'kk'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Floors`
  String get floors {
    return Intl.message(
      'Floors',
      name: 'floors',
      desc: '',
      args: [],
    );
  }

  /// `Select Language `
  String get select_lang {
    return Intl.message(
      'Select Language ',
      name: 'select_lang',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone {
    return Intl.message(
      'Phone number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get store {
    return Intl.message(
      'Store',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant`
  String get restaurant {
    return Intl.message(
      'Restaurant',
      name: 'restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Add `
  String get add {
    return Intl.message(
      'Add ',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add store `
  String get add_store {
    return Intl.message(
      'Add store ',
      name: 'add_store',
      desc: '',
      args: [],
    );
  }

  /// `Edit store information `
  String get edit_store {
    return Intl.message(
      'Edit store information ',
      name: 'edit_store',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Investor name`
  String get investor_name {
    return Intl.message(
      'Investor name',
      name: 'investor_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter name `
  String get val_name {
    return Intl.message(
      'Enter name ',
      name: 'val_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get val_phone {
    return Intl.message(
      'Enter phone number',
      name: 'val_phone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get ok {
    return Intl.message(
      'Confirm',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Enter investor name `
  String get investor_name_val {
    return Intl.message(
      'Enter investor name ',
      name: 'investor_name_val',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get success_state {
    return Intl.message(
      'Done',
      name: 'success_state',
      desc: '',
      args: [],
    );
  }

  /// `Loading ...`
  String get loading_state {
    return Intl.message(
      'Loading ...',
      name: 'loading_state',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get stores {
    return Intl.message(
      'Stores',
      name: 'stores',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants`
  String get restaurants {
    return Intl.message(
      'Restaurants',
      name: 'restaurants',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
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
      Locale.fromSubtags(languageCode: 'ar'),
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

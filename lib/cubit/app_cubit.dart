import 'package:bloc/bloc.dart';
import 'package:cham_city_center/main.dart';
import 'package:cham_city_center/shared/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../generated/l10n.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  List<String> floors = ['L3', 'L2', 'L1', 'G', 'E', 'P1', 'P2'];

  void changeAppLanguage(value) {
    print(value);
    box.write('lang', value);
    emit(AppChangeLanguageState());
  }

  void changeSelectedLanguage(value) {
    print(value);
    emit(AppChangeSelectedLanguageState());
  }

  static AppCubit get(context) => BlocProvider.of(context);

  String type = 's';
  changeType(String value) {
    type = value;
    emit(AppChangeTypeState());
  }

  Database? database;
  List<Map>? data;

  Future openDataBase() async {
    database = await openDatabase('cham_city_center.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db
          .execute(
              'CREATE TABLE Floors (id INTEGER PRIMARY KEY, floor TEXT, name TEXT, phone INTEGER, type TEXT,investor_name Text , description Text)')
          .then((value) {
        print(
            'table created successfully !');
        emit(AppCreateDataBaseState());
      });
    }, onOpen: (db) {
      print(
          'dataBase opened !');
    });
  }

  Future insetToDataBase(
      {required String floor,
      required String name,
      required int phone,
      required String type,
      required String investor_name,
      String? description}) async {
    await database!.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Floors(floor, name, phone,type,investor_name,description) VALUES( "$floor" , "$name" , "$phone" , "$type","$investor_name","$description")');
      print('inserted1: $id1');
    }).then((value) {
      emit(AppInsertToDataBaseState());
      getFromDataBase(
        type: 'floors',
        value: floor,
        db: database,
      ).then((value) => emit(AppGetFromDataBaseState()));
    });
  }

  Future getFromDataBase(
      {required String type, required value, required db}) async {
    emit(AppGetFromDataBaseLoadingState());
    (type == 'floors')
        ? data = await db.query(
            'Floors',
            where: 'floor = ?',
            whereArgs: ['$value'],
          )
        : (type == 'all')
            ? data = await db.query(
                'Floors',
              )
            : (type == 'restaurants')
                ? data = await db.query(
                    'Floors',
                    where: 'type = ?',
                    whereArgs: ['r'],
                  )
                :(type == 'stores')? data = await db.query(
                    'Floors',
                    where: 'type = ?',
                    whereArgs: ['s'],
                  ):(
    data= await db.query('Floors', columns: ['name'], where: 'name LIKE ?', whereArgs: ['%$value%']));

    print(data);
    print(data?.length);
    emit(AppGetFromDataBaseState());
  }

  Future updateRecord(
      {required String name,
      required int phone,
      required String type,
      required int id,
      required String investor_name,
      String? description}) async {
    // Update some record
    int count = await database!.update(
      'Floors',
      {
        'name': name,
        'phone': phone,
        'type': type,
        'investor_name': investor_name,
        'description': description
      },
      where: 'id = ?',
      whereArgs: [id],
    );
    print(data);
    emit(AppUpdateDataBaseState());
    print('updated: $count');
  }

  Future deleteRecord(
      {required int id, required String floor, required String name}) async {
    // Delete a record
    await database!.delete(
      'Floors',
      where: 'id = ?',
      whereArgs: [id],
    ).then((value) {
      print('$name deleted successfully');
      emit(AppDeleteFromDataBaseState());
      getFromDataBase(
        type: 'floors',
        value: floor,
        db: database,
      ).then((value) => emit(AppGetFromDataBaseState()));
    });
  }
}

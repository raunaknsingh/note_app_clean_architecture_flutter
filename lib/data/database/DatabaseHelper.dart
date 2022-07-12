import 'dart:async';

import 'package:notes_app_clean_arch_flutter/data/model/NoteEntity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  static const _dbName = 'Notes.db';
  static const _dbVersion = 1;
  static const _tableName = 'note';

  Future<Database> get database async {
    if (_database != null) return _database!;
    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final String dbPath = await getDatabasesPath();
    String path = join(dbPath, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE $_tableName (
      ${NoteFields.columnId} INTEGER PRIMARY KEY,
      ${NoteFields.title} STRING NOT NULL,
      ${NoteFields.description} STRING,
      ${NoteFields.date} STRING,
      ${NoteFields.isEdited} INTEGER NOT NULL
      )
      ''');
  }

  Future<int> insertNote(NoteEntity note) async {
    Database db = await instance.database;
    return await db.insert(_tableName, note.toJson());
  }

  Future<List<NoteEntity>> readAllNotes() async {
    Database db = await instance.database;
    final result = await db.query(_tableName);
    return result.map((jsonItem) => NoteEntity.fromJson(jsonItem)).toList();
  }

  Future<int> updateNote(NoteEntity note) async {
    Database db = await instance.database;
    return await db.update(_tableName, note.toJson(),
        where: '${NoteFields.columnId} = ?', whereArgs: [note.id]);
  }

  Future<int> deleteNote(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName,
        where: '${NoteFields.columnId} = ?', whereArgs: [id]);
  }

  Future close() async {
    Database db = await instance.database;
    await db.close();
  }
}

import 'package:fonovoo/data/database/migrations/base_migrations.dart';

class DatabaseVersion1 extends BaseMigrations {
  DatabaseVersion1(super.database);

  @override
  run() async {
    await database.executeCommand('PRAGMA foreign_keys = ON');

    await database.executeCommand('''
      CREATE TABLE schools ( 
        schoolid TEXT PRIMARY KEY,
        schoolname TEXT NOT NULL
      );''');

    await database.executeCommand('''
      CREATE TABLE classrooms ( 
        classroomid TEXT PRIMARY KEY,
        classroomname TEXT NOT NULL, 
        schoolid TEXT NOT NULL,
        FOREIGN KEY (schoolid) REFERENCES schools(schoolid) ON DELETE CASCADE
      );''');

    await database.executeCommand('''
      CREATE TABLE groups ( 
        groupid TEXT PRIMARY KEY,
        classroomid TEXT NOT NULL,
        groupname TEXT NOT NULL,
        FOREIGN KEY (classroomid) REFERENCES classrooms(classroomid) ON DELETE CASCADE
      );''');

    await database.executeCommand('''
      CREATE TABLE students ( 
        studentid TEXT PRIMARY KEY,
        classid TEXT NOT NULL, 
        name TEXT NOT NULL, 
        groupid TEXT,
        FOREIGN KEY (classid) REFERENCES classrooms(classroomid) ON DELETE CASCADE,        
        FOREIGN KEY (groupid) REFERENCES groups(groupid) ON DELETE CASCADE
      );''');

    await database.executeCommand('''
      CREATE TABLE categories ( 
        categoryid TEXT PRIMARY KEY,
        categoryname TEXT NOT NULL, 
        categorycolor TEXT NOT NULL  
      );''');

    String id = idService.generateId();

    await database.writeData('''
        INSERT INTO categories(categoryid, categoryname, categorycolor) VALUES ('$id', 'parlendas', 'RED');
      ''');

    id = idService.generateId();

    await database.writeData('''
        INSERT INTO categories(categoryid, categoryname, categorycolor) VALUES ('$id', 'rimas', 'GREEN');
      ''');

    id = idService.generateId();

    await database.writeData('''
        INSERT INTO categories(categoryid, categoryname, categorycolor) VALUES ('$id', 'frases', 'BLUE');
      ''');

    id = idService.generateId();

    await database.writeData('''
        INSERT INTO categories(categoryid, categoryname, categorycolor) VALUES ('$id', 'silabas', 'YELLOW');
      ''');

    await database.executeCommand('''
      CREATE TABLE matches ( 
        matchid TEXT PRIMARY KEY,
        status TEXT NOT NULL
      );''');

    await database.executeCommand('''
      CREATE TABLE categories_grade ( 
        categorygradeid TEXT PRIMARY KEY,
        studentid TEXT NOT NULL,
        categoryid TEXT NOT NULL, 
        grade INTEGER,
        matchid TEXT,
        FOREIGN KEY (studentid) REFERENCES students(studentid) ON DELETE CASCADE,        
        FOREIGN KEY (categoryid) REFERENCES categories(categoryid) ON DELETE CASCADE,
        FOREIGN KEY (matchid) REFERENCES matches(matchid) ON DELETE CASCADE
      );''');
  }
}

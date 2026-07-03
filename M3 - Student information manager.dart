/*
#Requirements
- Abstract class (person)
- Student Class
- Constructor
- Encapsulation (priv field)
- functions
- arrow function
- anonymous function
#Features
- Add student
- View students
- Search student
- Delete student
- Exit
 */
import 'dart:io';

//abstract class
abstract class Person {
  String name;
  //Constructor
  Person(this.name);
  void displayInfo();
}

//Student class extends Person and adds encapsulation
class Student extends Person {
  String _studentClass; //private field
  //calls Person's constructor via super
  Student(String name, this._studentClass) : super(name);
  //Getter to safely expose the private field
  String get studentClass => _studentClass;
  void displayInfo() {
    print('Name: $name\t|\tClass: $_studentClass');
  }
}

//Manages the list of students and all operations on them
class StudentManager {
  final List<Student> _students = [];

  //Add student
  void addStudent(Student s) {
    _students.add(s);
    print('${s.name} was added successfully as a student!');
  }

  //Arrow function
  bool isEmpty() => _students.isEmpty;

  //View Students
  void viewStudents() {
    if (isEmpty()) {
      print('No students found');
      return;
    }
    //Anonymous function passed to forEach
    else {
      _students.forEach((student) {
        student.displayInfo();
      });
    }
  }

  //Search Student
  void searchStudent(String name) {
    bool found = false;
    for (var s in _students) {
      if (s.name == name) {
        s.displayInfo();
        found = true;
        break;
      }
    }
    if (!found) {
      print('$name not found');
    }
  }

  //Delete Student
  void deleteStudent(String name) {
    bool removed = false;
    for (int i = 0; i < _students.length; i++) {
      if (_students[i].name == name) {
        _students.removeAt(i);
        removed = true;
        break;
      }
    }
    print(removed ? '$name was deleted from list.' : '$name was not found');
  }
}

void main() {
  final manager = StudentManager();
  bool running = true;
  while (running) {
    print('===== Student Information Manager =====');
    print('''
      1. Add Student
      2. View Students
      3. Search Student
      4. Delete Student
      5. Exit
    ''');
    //Take input
    stdout.write('Option: ');
    final choice = stdin.readLineSync();
    //switch case to invoke the parameters and desired class
    switch (choice) {
      case '1':
        stdout.write('Name: ');
        final name = stdin.readLineSync();
        stdout.write('Class: ');
        final stdClass = stdin.readLineSync();
        manager.addStudent(Student(name!, stdClass!));
        break;
      case '2':
        manager.viewStudents();
        break;
      case '3':
        stdout.write('Enter student\'s name to search: ');
        final searchName = stdin.readLineSync();
        manager.searchStudent(searchName!);
        break;
      case '4':
        stdout.write('Enter Student Name to delete: ');
        final deleteName = stdin.readLineSync();
        manager.deleteStudent(deleteName!);
        break;
      case '5':
        running = false;
        print('Goodbye!');
        break;
      default:
        print('Invalid choice, try again.');
    }
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(20),
            minimumSize: Size(double.infinity, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String studentName = "Asanda";
  String favSubject = "GUID";
  int studentAge = 23;
  int subjectIndex = 0;
  final List<String> mySubjects = const [
    "TPG316",
    "SOD316",
    "CMN316",
    "ITS316",
    "SOE316",
  ];

  void increaseAge() {
    setState(() {
      studentAge++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Card"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => print("SettingsPressed"),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StudentInfoCard(
                  studentName: studentName,
                  favSubject: favSubject,
                  studentAge: studentAge,
                ),
                SizedBox(height: 20),
                StudentInfoCard(
                  studentName: studentName,
                  favSubject: favSubject,
                  studentAge: studentAge,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Change Subject"),
                    onPressed: () => setState(() {
                      subjectIndex = (subjectIndex + 1) % mySubjects.length;
                      favSubject = mySubjects[subjectIndex];
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("FAB Pressed"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({
    super.key,
    required this.studentName,
    required this.favSubject,
    required this.studentAge,
  });

  final String studentName;
  final String favSubject;
  final int studentAge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          Text(
            'Student Name:$studentName',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              decorationThickness: 3,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Favourite Subject:$favSubject',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Text('Age:$studentAge', style: TextStyle(color: Colors.white)),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

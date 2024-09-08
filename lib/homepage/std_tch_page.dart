import 'package:flutter/material.dart';
import 'package:jobastudent/createaccout/createac_professor.dart';
import 'package:jobastudent/createaccout/createac_student.dart';

class StdAndTchpage extends StatefulWidget {
  @override
  _StdAndTchpageState createState() => _StdAndTchpageState();
}

class _StdAndTchpageState extends State<StdAndTchpage> {
  String? _selectedRole; // เก็บค่าที่ผู้ใช้เลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(100.0), // Padding from screen edges
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/thaksinlogo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            padding: EdgeInsets.fromLTRB(50.0, 50.0, 50, 50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white, // Slightly transparent white
            ),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimize size of the Column
                children: [
                  Text(
                    'WHO ARE YOU?',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  RadioListTile<String>(
                    title: const Text('นิสิต'),
                    value: 'student',
                    groupValue: _selectedRole,
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('อาจารย์/หน่วยงาน'),
                    value: 'teacher',
                    groupValue: _selectedRole,
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedRole != null) {
                        // ทำสิ่งที่คุณต้องการเมื่อผู้ใช้เลือกบทบาทเสร็จแล้ว
                        if (_selectedRole == 'student') {
                          // ไปยังหน้าของนิสิต
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateacStudent()),
                          );
                        } else if (_selectedRole == 'teacher') {
                          // ไปยังหน้าของอาจารย์
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateacProfessor()),
                          );
                        }
                      } else {
                        // แสดงข้อความให้ผู้ใช้เลือกบทบาท
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('กรุณาเลือกบทบาทก่อน')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent.shade100,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Send'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

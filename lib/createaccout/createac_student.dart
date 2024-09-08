import 'package:flutter/material.dart';
import 'package:jobastudent/createaccout/createpf_student.dart';

class CreateacStudent extends StatefulWidget {
  const CreateacStudent({super.key});

  @override
  State<CreateacStudent> createState() => _CreateacStudentState();
}

class _CreateacStudentState extends State<CreateacStudent> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedFaculty; // เก็บค่าที่เลือกจาก Dropdown
  String? _selectedMajor;

  // รายการของคณะ
  final List<String> _faculties = [
    'คณะวิทยาศาสตร์และนวัตกรรมดิจิทัล',
    'คณะวิทยาการสุขภาพและการกีฬา',
    'คณะเทคโนโลยีและการพัฒนาชุมชน',
    'คณะวิศวกรรมศาสตร์',
    'คณะพยาบาลศาสตร์',
    'คณะนิติศาสตร์',
    'คณะอุตสาหกรรมเกษตรและชีวภาพ',
    'คณะศึกษาศาสตร์',
    'คณะสหวิทยาการและการประกอบการ',
  ];

// รายการของสาขาที่มีในแต่ละคณะ
  final Map<String, List<String>> _majors = {
    'คณะวิทยาศาสตร์และนวัตกรรมดิจิทัล': [
      'สาขาคณิตศาสตร์และสถิติ',
      'สาขาเคมี',
      'สาขาชีววิทยา',
      'สาขาฟิสิกส์',
      'สาขาเทคโนโลยีสารสนเทศ',
      'สาขาวิทยาการคอมพิวเตอร์',
      'สาขาวิทยาการคอมพิวเตอร์และสารสนเทศ',
      'สาขาวิทยาศาสตร์ชีวภาพและสิ่งแวดล้อม',
      'สาขาวิทยาศาสตร์และคณิตศาสตร์พื้นฐาน',
    ],
    'คณะวิทยาการสุขภาพและการกีฬา': [
      'สาขาสาธารณสุขชุมชน',
      'สาขาวิทยาศาสตร์การกีฬา',
      'สาขาอาชีวอนามัยและความปลอดภัย',
      'สาขาการแพทย์แผนไทย',
    ],
    'คณะเทคโนโลยีและการพัฒนาชุมชน': [
      'สาขาเทคโนโลยีและนวัตกรรมการผลิตพืช',
      'สาขาส่งเสริมการเกษตรและพัฒนาชุมชน',
      'สาขาสัตวศาสตร์',
    ],
    'คณะวิศวกรรมศาสตร์': [
      'สาขาวิศวกรรมเมคคาทรอนิกส์',
      'สาขาวิศวกรรมยางและพอลิเมอร์',
      'สาขาวิศวกรรมเครื่องกล',
    ],
    'คณะพยาบาลศาสตร์': [
      '-',
    ],
    'คณะนิติศาสตร์': [
      '-',
    ],
    'คณะอุตสาหกรรมเกษตรและชีวภาพ': [
      'สาขาวิทยาศาสตร์และเทคโนโลยีอาหาร ',
      'สาขาวิทยาศาสตร์อาหารและโภชนาการ ',
      'สาขาเทคโนโลยีเครื่องสำอางและผลิตภัณฑ์เสริมอาหาร',
      'สาขาเทคโนโลยีเครื่องสำอางและผลิตภัณฑ์เสริมอาหาร ',
    ],
    'คณะศึกษาศาสตร์': [
      'สาขาการวัดและประเมินทางการศึกษา',
      'สาขาการศึกษา วิชาเอกการประถมศึกษา',
      'สาขาการศึกษา วิชาเอกการศึกษาปฐมวัย',
      'สาขาการศึกษา วิชาเอกจิตวิทยาการศึกษาและการแนะแนว',
      'สาขาการศึกษา วิชาเอกเทคโนโลยีและสื่อสารการศึกษา',
      'สาขาคณิตศาสตร์',
      'สาขาชีววิทยา',
      'สาขาพลศึกษา',
      'สาขาฟิสิกส์',
      'สาขาภาษาอังกฤษ',
      'สาขาภาษาไทย',
      'สาขาศิลปศึกษา',
      'สาขาสังคมศึกษา',
      'สาขาเคมี',
      'สาขาเทคโนโลยีและสื่อสารการศึกษา',
    ],
    'คณะสหวิทยาการและการประกอบการ': [
      'วิชาภาษาอังกฤษเพื่อการสื่อสารเชิงประกอบการ',
    ],
  };
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
          child: SingleChildScrollView(
            child: Container(
              width: 500,
              // height: 600, // เพิ่มความสูงของฟอร์ม
              padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white, // Slightly transparent white
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Minimize size of the Column
                  children: [
                    Text(
                      'CREATE ACCOUNT !',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'ชื่อ-นามสกุล',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกชื่อ-นามสกุล';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'email@tsu.ac.th',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกอีเมล';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                            .hasMatch(value)) {
                          return 'กรุณากรอกอีเมลให้ถูกต้อง';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'เบอร์โทรศัพท์',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกเบอร์โทรศัพท์';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _selectedFaculty,
                      hint: Text('เลือกคณะ'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      items: _faculties.map((String faculty) {
                        return DropdownMenuItem<String>(
                          value: faculty,
                          child: Text(faculty),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedFaculty = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณาเลือกคณะ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _selectedMajor,
                      hint: Text('เลือกสาขา'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      items: _selectedFaculty != null
                          ? _majors[_selectedFaculty]!.map((String major) {
                              return DropdownMenuItem<String>(
                                value: major,
                                child: Text(major),
                              );
                            }).toList()
                          : [],
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedMajor = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณาเลือกสาขา';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Distribute space between buttons
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // กลับไปยังหน้าเข้าสู่ระบบ
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent.shade100,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          child: Text('Back'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreatepfProfessor()), // เปลี่ยนเป็นหน้าใหม่
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent.shade100,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          child: Text('Send'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

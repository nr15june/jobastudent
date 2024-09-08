import 'package:flutter/material.dart';
import 'package:jobastudent/createaccout/createpf_professor.dart';

class CreateacProfessor extends StatefulWidget {
  const CreateacProfessor({super.key});

  @override
  State<CreateacProfessor> createState() => _CreateacProfessorState();
}

class _CreateacProfessorState extends State<CreateacProfessor> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedFaculty; // เก็บค่าที่เลือกจาก Dropdown
  String? _selectedAgency;

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

  final List<String> _agencies = [
    'หน่วยงานอิสระ',
    'สำนักงานสภามหาวิทยาลัย',
    'สำนักงานมหาวิทยาลัย',
    'สำนักงานวิทยาเขต',
    'ส่วนงานอื่นๆ',
    'องค์กร/โครงการ/กิจกรรม',
    'เว็บไซต์หน่วยงานเดิม',
  ];

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
              padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white, // Slightly transparent white
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      value: _selectedAgency,
                      hint: Text('หน่วยงาน'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      items: _agencies.map((String agency) {
                        return DropdownMenuItem<String>(
                          value: agency,
                          child: Text(agency),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAgency = newValue;
                          // Clear the selected faculty when an agency is selected
                          if (newValue != '-' && newValue != null) {
                            _selectedFaculty = null;
                          }
                        });
                      },
                      validator: (value) {
                        // Validate agency field only if no faculty is selected
                        if (_selectedFaculty == null &&
                            (value == null || value.isEmpty || value == '-')) {
                          return 'กรุณาเลือกหน่วยงาน';
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
                          // Clear the selected agency when a faculty is selected
                          if (newValue != '-' && newValue != null) {
                            _selectedAgency = null;
                          }
                        });
                      },
                      validator: (value) {
                        // Validate faculty field only if no agency is selected
                        if (_selectedAgency == null &&
                            (value == null || value.isEmpty || value == '-')) {
                          return 'กรุณาเลือกคณะ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

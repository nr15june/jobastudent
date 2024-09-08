import 'package:flutter/material.dart';
import 'dart:io'; // สำหรับการจัดการไฟล์รูปภาพ
//import 'package:image_picker/image_picker.dart'; // สำหรับเลือกรูปภาพจากแกลเลอรี
import 'package:jobastudent/webpage/web_professor.dart';

class CreatepfProfessor extends StatefulWidget {
  const CreatepfProfessor({super.key});

  @override
  State<CreatepfProfessor> createState() => _CreatepfProfessorState();
}

class _CreatepfProfessorState extends State<CreatepfProfessor> {
  final _formKey = GlobalKey<FormState>();
  File? _image; // เก็บรูปภาพโปรไฟล์
  // final picker = ImagePicker();

  // // ฟังก์ชันเปิดแกลเลอรีเพื่อเลือกรูป
  // Future<void> _pickImage() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }

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
              //height: 600, // เพิ่มความสูงของฟอร์ม
              padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white, // Slightly transparent white
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // แสดงรูปโปรไฟล์
                    GestureDetector(
                      //onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                        child: _image == null
                            ? const Icon(Icons.add_a_photo, size: 50)
                            : null,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ช่องกรอก username
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอก Username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // ช่องกรอกรหัสผ่าน
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอก Password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // ปุ่ม Send
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // ถ้าฟอร์มถูกต้อง ให้ไปยังหน้าถัดไป
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WebPerfessorPage()),
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
                      child: const Text('Send'),
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



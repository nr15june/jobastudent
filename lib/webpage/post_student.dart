import 'package:flutter/material.dart';

class CreatePostStudentPage extends StatefulWidget {
  const CreatePostStudentPage({super.key});

  @override
  _CreatePostStudentPageState createState() =>
      _CreatePostStudentPageState();
}

class _CreatePostStudentPageState extends State<CreatePostStudentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60.0, // ความสูงของแถบ
              color: Colors.blue.shade100, // สีของแถบด้านบน
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset(
                      'assets/logo.jpg', // เปลี่ยนเป็นชื่อไฟล์ภาพของคุณ
                      height: 150.0, // ความสูงของภาพ
                      width: 150.0, // ความกว้างของภาพ
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/profile_picture.jpg'), // โปรไฟล์
                      radius: 20.0, // ขนาดของโปรไฟล์
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(30.0), // เพิ่มพื้นที่รอบๆ ListView
                children: [
                  Container(
                    padding: EdgeInsets.all(40.0), // เพิ่มพื้นที่รอบๆ กล่อง
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // ขอบของกล่อง
                      borderRadius: BorderRadius.circular(8.0), // มุมกล่อง
                      color: Colors.white, // สีพื้นหลังของกล่อง
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ชื่อ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'ชื่อ',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16), // เพิ่มระยะห่างระหว่างคอลัมน์
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'นามสกุล',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'นามสกุล',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'คณะ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'คณะ',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16), // เพิ่มระยะห่างระหว่างคอลัมน์
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'สาขา',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'สาขา',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),                                       
                        Text(
                          'ทักษะ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'ทักษะ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'ความสามารถ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'ความสามารถ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'เวลาที่สามารถทำงานได้',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'เวลาที่สามารถทำงานได้',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'ช่องทางการติดต่อ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'ช่องทางการติดต่อ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end, // จัดตำแหน่งไปทางขวา
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent.shade100,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Text('ยืนยัน'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
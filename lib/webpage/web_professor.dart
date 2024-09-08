import 'package:flutter/material.dart';
import 'package:jobastudent/webpage/post_professor.dart'; // เพิ่มการนำเข้าไฟล์ CreatePostPage

class WebPerfessorPage extends StatefulWidget {
  const WebPerfessorPage({super.key});

  @override
  _WebPerfessorPageState createState() => _WebPerfessorPageState();
}

class _WebPerfessorPageState extends State<WebPerfessorPage> {
  bool isPosting = false; // สถานะของการโพสต์

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
                      backgroundImage: AssetImage(
                          'assets/profile_picture.jpg'), // โปรไฟล์
                      radius: 20.0, // ขนาดของโปรไฟล์
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  // ส่วนหลักของโพสต์
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      itemCount: 11, // จำนวนโพสต์ + 1 สำหรับกล่องสร้างโพสต์
                      itemBuilder: (context, index) {
                        // กล่องสร้างโพสต์
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/profile_picture.jpg'), // โปรไฟล์ด้านซ้าย
                                  radius: 30,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // เมื่อกดกล่อง ให้ไปหน้า CreatePostStudentPage ทันที
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreatePostPerfessorPage()),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 8.0,
                                            spreadRadius: 2.0,
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        'What\'s on your mind?', // ข้อความเมื่อยังไม่กดกล่อง
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        // โพสต์อื่นๆ
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 8.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Text(
                                'Post content ${index - 1}'), // index - 1 เพราะ index 0 เป็นกล่องสร้างโพสต์
                          ),
                        );
                      },
                    ),
                  ),
                  // ส่วนที่กรองโพสต์
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    padding: EdgeInsets.all(16.0),
                    color: Colors.blueGrey.shade50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'หน่วยงาน',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'ทั้งหมด',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          items: <String>['Agency 1', 'Agency 2', 'Agency 3']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle filter logic here
                          },
                        ),
                        SizedBox(height: 30),
                        Text(
                          'คณะ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'ทั้งหมด',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          items: <String>[
                            'Department 1',
                            'Department 2',
                            'Department 3'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle filter logic here
                          },
                        ),
                        SizedBox(height: 30),
                        Text(
                          'วัน',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'ทั้งหมด',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          items: <String>['Date 1', 'Date 2', 'Date 3']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle filter logic here
                          },
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

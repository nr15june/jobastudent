import 'package:flutter/material.dart';

class CreatePostPerfessorPage extends StatefulWidget {
  const CreatePostPerfessorPage({super.key});

  @override
  _CreatePostPerfessorPageState createState() =>
      _CreatePostPerfessorPageState();
}

class _CreatePostPerfessorPageState extends State<CreatePostPerfessorPage> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null &&
        (isStartDate ? picked != _startDate : picked != _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

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
                        Text(
                          'ชื่องาน',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'ชื่องาน',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 20), // เพิ่มระยะห่างระหว่างกล่องข้อความ
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'สถานที่',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'สถานที่',
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
                                    'อาคาร',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'อาคาร',
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
                                    'ห้อง',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'ห้อง',
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
                                    'เวลา',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _selectTime(context),
                                    child: AbsorbPointer(
                                      child: TextField(
                                        controller: TextEditingController(
                                          text:
                                              '${_selectedTime.format(context)}',
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'เลือกเวลา',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
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
                                    'วันที่เริ่ม',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _selectDate(context, true),
                                    child: AbsorbPointer(
                                      child: TextField(
                                        controller: TextEditingController(
                                          text: '${_startDate.toLocal()}'
                                              .split(' ')[0],
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'เลือกวันที่เริ่ม',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
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
                                    'วันที่สิ้นสุด',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _selectDate(context, false),
                                    child: AbsorbPointer(
                                      child: TextField(
                                        controller: TextEditingController(
                                          text: '${_endDate.toLocal()}'
                                              .split(' ')[0],
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'เลือกวันที่สิ้นสุด',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 20), // เพิ่มระยะห่างระหว่างกล่องข้อความ
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'จำนวนที่รับ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'จำนวนที่รับ',
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
                                    'สำรอง',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'สำรอง',
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
                          'สวัสดิการ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'การเดินทาง',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'อาหาร',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'ค่าจ้าง',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'รายละเอียดต่างๆ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: double.infinity, // กำหนดความกว้างให้เต็มที่
                          child: TextField(
                            maxLines: 4, // กำหนดจำนวนบรรทัดสูงสุด
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
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
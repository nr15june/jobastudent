import 'package:flutter/material.dart';
import 'package:jobastudent/homepage/forgetpsw_page.dart';
import 'package:jobastudent/homepage/std_tch_page.dart';
//import 'package:jobastudent/webpage/web_professor.dart';
import 'package:jobastudent/webpage/web_student.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _rememberUsername = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(100.0), // ระยะห่างจากขอบหน้าจอ
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/thaksin.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight, // จัดให้อยู่ทางขวาของหน้าจอ
        child: Container(
          padding: EdgeInsets.fromLTRB(60.0, 60.0, 60, 60.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey, // ใช้ GlobalKey สำหรับ Form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'L O G I N',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกชื่อผู้ใช้';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกรหัสผ่าน';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.0,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          value: _rememberUsername,
                          onChanged: (newValue) {
                            setState(() {
                              _rememberUsername = newValue!;
                            });
                          },
                        ),
                      ),
                      Text('Remember Username'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // ถ้าข้อมูลครบถ้วนและถูกต้อง
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WebStudentPage()), // เปลี่ยนเป็นหน้าใหม่
                              );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent.shade100,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ForgetPasswordPage()), // เปลี่ยนไปที่หน้าที่คุณต้องการ
                          );
                        },
                        child: Text(
                          'Forget Username or Password ?',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StdAndTchpage()), // เปลี่ยนไปที่หน้าที่คุณต้องการ
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

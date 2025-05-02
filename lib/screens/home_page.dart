import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ميزان",
                style: TextStyle(
                  fontFamily: "",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Positioned(
                top: 1,
                left: 100,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    "assets/assets/images/logo (2).png",
                  ),
                ),
              ),
              SizedBox(width: 30),
              Container(
                width: 270,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xFFBEC6A0),
                ),
                child: Center(
                  child: Text(
                    "اهلا بك في الميزان يا*****",
                    style: TextStyle(
                      fontFamily: "",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Container(
            width: double.infinity,
            height: 125,
            decoration: BoxDecoration(
              color: Color(0xFF708871),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/assets/images/dolar.png"),
                ),
                SizedBox(width: 10),
                Text(
                  "حساب تحويل العملات الى الدولار",
                  style: TextStyle(
                    fontFamily: "",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 125,
            decoration: BoxDecoration(
              color: Color(0xFF708871),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/assets/images/aqsat.jpg"),
                ),
                SizedBox(width: 10),
                Text(
                  "عرض الاقساط ومواعيدها",
                  style: TextStyle(
                    fontFamily: "",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 125,
            decoration: BoxDecoration(
              color: Color(0xFF708871),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "assets/assets/images/masrouf.png",
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "تنظيم المصروفات بالنسبة لدخلك الشهري",
                  style: TextStyle(
                    fontFamily: "",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 125,
            decoration: BoxDecoration(
              color: Color(0xFF708871),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/assets/images/data.jpg"),
                ),
                SizedBox(width: 10),
                Text(
                  "البيانات الشخصية",
                  style: TextStyle(
                    fontFamily: "",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

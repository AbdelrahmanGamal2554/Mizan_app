import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Color(0xFFFEF3E2) ,
      body: Column(
        children: [
          SizedBox(height: 30),
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
                  color: Colors.lightGreen,
                ),
                child: Text(
                  "في هذه الصفحة يتم عرض افضل نسبة تنظيم مصروفات من خلال مرتبك",
                  style: TextStyle(
                    fontFamily: "",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            height: 100,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "10000",
                style: TextStyle(
                  fontFamily: "",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),

          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(width: 25);
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFFEF3E2),
                    border: Border.all(color: Color(0xFF708871),width: 5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text("data"),
                      SizedBox(height: 30),
                      CircularPercentIndicator(
                        animation: true,
                        radius: 60.0,
                        lineWidth: 5.0,
                        percent: 1.0,
                        center: Text("100%"),
                        progressColor:Color(0xFF708871),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              "assets/assets/images/l1.png",
                            ),
                          ),
                          Text(""),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              "assets/assets/images/l1.png",
                            ),
                          ),
                          Text(""),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              "assets/assets/images/l1.png",
                            ),
                          ),
                          Text(""),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              "assets/assets/images/l1.png",
                            ),
                          ),
                          Text(""),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              "assets/assets/images/l1.png",
                            ),
                          ),
                          Text(""),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

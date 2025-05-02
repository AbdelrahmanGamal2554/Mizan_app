import 'package:flutter/material.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  String? selectedCountry;

  bool isBankVisible = false;
  bool isSalaryVisible = false;

  List<String> countries = [
    'مصر',
    'السعودية',
    'الامارات',
    'البحرين',
    'الكويت',
    'قطر',
    'تونس',
    'سوريا',
    'الجزائر',
    'فلسطين',
    'عُمان',
    'السودان',
    'لبنان',
    'ليبيا',
    'موريتانيا',
    'العراق',
    'الاردن',
    'الصومال',
    'جيبوتى',
    'جزر القمر',
    'المغرب',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF3E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "ميزان",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  height: MediaQuery.of(context).size.height * .65,
                  width: MediaQuery.of(context).size.width * 0.92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFFBEC6A0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        "اسم المستخدم",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "البريد الإلكتروني",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF708871),
                        ),
                        child: const Text(
                          "البلد",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("تعديل البيانات الشخصية"),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    buildTextField("ادخل اسمك", "الاسم"),
                                    buildTextField(
                                      "ادخل بريدك الإلكتروني",
                                      "البريد الإلكتروني",
                                    ),
                                    buildTextField(
                                      "ادخل حسابك البنكي",
                                      "الحساب البنكي",
                                      isPassword: true,
                                      isVisible: isBankVisible,
                                      onEyePressed: () {
                                        setState(() {
                                          isBankVisible = !isBankVisible;
                                        });
                                      },
                                    ),
                                    buildTextField(
                                      "ادخل راتبك الشهري",
                                      "الراتب الشهري",
                                      isPassword: true,
                                      isVisible: isSalaryVisible,
                                      onEyePressed: () {
                                        setState(() {
                                          isSalaryVisible = !isSalaryVisible;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Text(
                                          ":اختر الدولة",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        DropdownButton<String>(
                                          value: selectedCountry,
                                          hint: const Text("اختر"),
                                          items: countries.map((country) {
                                            return DropdownMenuItem<String>(
                                              value: country,
                                              child: Text(country),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              selectedCountry = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text(
                                    "إلغاء",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(
                                      const Color(0xFF606676),
                                    ),
                                  ),
                                  child: const Text(
                                    "حفظ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFEF3E2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "تعديل",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -75,
                  left: MediaQuery.of(context).size.width * .25,
                  child: const CircleAvatar(
                    radius: 85,
                    backgroundColor: Color(0xFFBEC6A0),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage("assets/images/slogan.gif"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String hint,
    String label, {
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onEyePressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        obscureText: isPassword ? !isVisible : false,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          labelText: label,
          fillColor: const Color.fromARGB(135, 158, 158, 158),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onEyePressed,
                )
              : null,
        ),
      ),
    );
  }
}

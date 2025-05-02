import 'package:flutter/material.dart';
import 'package:mizan/databases/sqflite.dart';
import 'package:mizan/models/payment_model.dart';

class LoansScreen extends StatefulWidget {
  const LoansScreen({super.key});

  @override
  State<LoansScreen> createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  TextEditingController paymentController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  List<PaymentModel> payments = [];
  void insert(PaymentModel payment) async {
    await SqlHelper().insertData(payment);
  }

  getData() async {
    payments = await SqlHelper().getData();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    paymentController.dispose();
    dateController.dispose();
    notesController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF3E2),
      appBar: AppBar(title: Text("ميزان"), backgroundColor: Color(0xFFFEF3E2)),
      body: Stack(
        alignment: Alignment.center,

        children: [
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets/images/logo(2).png"),
            ),
          ),
          Positioned(
            top: 40,
            left: 5,
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width - 90,
              decoration: BoxDecoration(
                color: Color(0xFFBEC6A0),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "فى هذه الغرفة يتم عرض او اضافة او حذف الاقساط الملتزم بها حاليا",
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'ملاحظات',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'الميعاد',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'القسط الشهرى',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows:
                  payments.map((e) {
                    return DataRow(
                      cells: [
                        DataCell(Text(e.notes)),
                        DataCell(Text(e.date)),
                        DataCell(Text(e.payment)),
                      ],
                    );
                  }).toList(),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      //surfaceTintColor: Color(0xFFBEC6A0),
                      backgroundColor: Color(0xFFBEC6A0),
                      title: Text("إضافة قسط جديد", textAlign: TextAlign.right),
                      content: Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              controller: paymentController,
                              decoration: InputDecoration(
                                label: Text("القسط الشهرى"),
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              controller: dateController,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                label: Text("الميعاد"),
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              controller: notesController,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                label: Text("ملاحظات"),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  insert(
                                    PaymentModel(
                                      payment: paymentController.text,
                                      date: dateController.text,
                                      notes: notesController.text,
                                    ),
                                  );
                                  paymentController.clear();
                                  dateController.clear();
                                  notesController.clear();
                                  getData;
                                  //setState(() {});

                                  Navigator.of(context).pop();
                                },
                                child: Text("إضافة"),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("إلغاء"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

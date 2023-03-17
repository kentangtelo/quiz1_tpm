import 'package:flutter/material.dart';

class CountTriangle extends StatefulWidget {
  const CountTriangle({super.key});

  @override
  State<CountTriangle> createState() => _CountTriangleState();
}

class _CountTriangleState extends State<CountTriangle>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  TextEditingController panjangAlasController = TextEditingController();
  TextEditingController panjangTinggiController = TextEditingController();
  TextEditingController panjangMiringController = TextEditingController();
  String resultText = '';
  String tipeText = '';
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        FocusManager.instance.primaryFocus?.unfocus();
        panjangAlasController.text = '';
        panjangTinggiController.text = '';
        panjangMiringController.text = '';
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 18, left: 18),
              alignment: Alignment.centerLeft,
              child: Text(
                tipeText,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 18, left: 18),
              alignment: Alignment.centerRight,
              child: Text(
                resultText,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                      border: Border.all(color: Colors.black),
                    ),
                    child: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            30.0,
                          ),
                          color: Colors.blue,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(
                            text: 'Keliling',
                          ),
                          Tab(
                            text: 'Luas',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 40,
                            right: 40,
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: panjangAlasController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Panjang Alas',
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: panjangTinggiController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Panjang Tinggi',
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: panjangMiringController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Panjang Miring',
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  var alas =
                                      int.parse(panjangAlasController.text);
                                  var tinggi =
                                      int.parse(panjangTinggiController.text);
                                  var miring =
                                      int.parse(panjangMiringController.text);
                                  var result = alas + tinggi + miring;
                                  setState(() {
                                    tipeText = 'Keliling';
                                    resultText = result.toString();
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Keliling',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 40,
                            right: 40,
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: panjangAlasController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Panjang Alas',
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: panjangTinggiController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Panjang Tinggi',
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  var alas =
                                      int.parse(panjangAlasController.text);
                                  var tinggi =
                                      int.parse(panjangTinggiController.text);
                                  var result = 1 / 2 * alas * tinggi;
                                  setState(() {
                                    tipeText = 'Luas';
                                    resultText = result.toString();
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Luas',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

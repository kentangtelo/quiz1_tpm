import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CountKite extends StatefulWidget {
  const CountKite({super.key});

  @override
  State<CountKite> createState() => _CountKiteState();
}

class _CountKiteState extends State<CountKite>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController diagonal1Controller = TextEditingController();
  TextEditingController diagonal2Controller = TextEditingController();
  TextEditingController panjangSisiPertamaController = TextEditingController();
  TextEditingController panjangSisiKeduaController = TextEditingController();
  String resultText = '';
  String tipeText = '';

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        FocusManager.instance.primaryFocus?.unfocus();
        diagonal1Controller.text = '';
        diagonal2Controller.text = '';
        panjangSisiPertamaController.text = '';
        panjangSisiKeduaController.text = '';
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
                                controller: panjangSisiPertamaController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Panjang Pasang Sisi Pertama',
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: panjangSisiKeduaController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Panjang Pasang Sisi Kedua',
                                ),
                              ),
                              const SizedBox(
                                height: 30,
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
                                  var panjangSisiPertama = int.parse(
                                      panjangSisiPertamaController.text);
                                  var panjangSisiKedua = int.parse(
                                      panjangSisiKeduaController.text);
                                  var result = 2 *
                                      (panjangSisiPertama + panjangSisiKedua);
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
                                controller: diagonal1Controller,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Diagonal Pertama',
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: diagonal2Controller,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Diagonal Kedua',
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
                                  var diagonal1 =
                                      int.parse(diagonal1Controller.text);
                                  var diagonal2 =
                                      int.parse(diagonal2Controller.text);
                                  var result = 1 / 2 * diagonal1 * diagonal2;
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




import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender { unknown, cowok, cewek }

class _MyHomePageState extends State<MyHomePage> {
  final namaDepanCtrl = TextEditingController();
  final namaBelakangCtrl = TextEditingController();
  Gender gender = Gender.unknown;

  bool isSehat = false;
  String namaDepan = "", namaBelakang = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    namaDepanCtrl.dispose();
    namaBelakangCtrl.dispose();
    super.dispose();
  }

  String getGender(Gender? value) {
    if (value == Gender.cowok) {
      return "Emyumania";
    } else if (value == Gender.cewek) {
      return "Emyumanita";
    }
    return "Emyupelangi";
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1915026037_Ananta")
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(' Data Fans Baru'),
              Text(' $namaDepan =>Korwil $namaBelakang'),
              Text('Saya ${getGender(gender)} '),
              Text('Saya ${isSehat ? "Siap puasa gelar" : "Tidak Siap puasa gelar"}'),
              const SizedBox(height: 5), 
              TextField(
                maxLines: 10,
                controller: namaDepanCtrl,
                decoration: const InputDecoration(
                  
                  border: OutlineInputBorder(),
                  labelText: "Nama",
                  hintText: 'Isi Nama Depan Kalian',
                ),
              ),
              const SizedBox(height: 20), 
              TextFormField(
                maxLines: 2,
                controller: namaBelakangCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nama Wilayah',
                  labelText: "Isi Nama Korwil "
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text("Laki-laki"),
                      leading: Radio(
                        groupValue: gender,
                        value: Gender.cowok,
                       
                        onChanged: (Gender? value) {
                          setState(() {
                           
                            gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text("Perempuan"),
                      leading: Radio(
                        groupValue: gender,
                        value: Gender.cewek,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text("Siap Puasa Gelar?"),
                leading: Checkbox(
                  value: isSehat,
                  onChanged: (bool? value) {
                    setState(() {
                      isSehat = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                namaDepan = namaDepanCtrl.text;
                namaBelakang = namaBelakangCtrl.text;
              });
            },
            child: const Text("Daftar sekarang"),
          ),
        ],
      ),
    );
  }
}
import "package:flutter/material.dart";
import 'package:flutter_ironsource_x/ironsource.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ironsrc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Watch Ads",
      home: GreetingPage(),
    );
  }
}

class GreetingPage extends StatelessWidget with IronSourceListener {
  const GreetingPage({super.key});

  initState() {
    init();
  }

  void init() async {
    await IronSource.validateIntegration();
    await IronSource.setUserId("277097");
    await IronSource.initialize(
      appKey: "192b4a10d",
      listener: this,
      gdprConsent: true,
      ccpaConsent: false,
    );
    Fluttertoast.showToast(msg: "IronSource initialized");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Card(
          margin:
              const EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "DEMO ADS APP",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: MaterialButton(
                  color: Colors.teal[100],
                  elevation: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/googleimage.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Next Page"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const IronRewarded(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
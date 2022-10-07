import 'package:flutter/material.dart';
import 'package:john_deere_spa/views/user.view.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxHeight: 600.00, maxWidth: 600.0),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/jhon_logo.gif',
                          ),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        constraints: BoxConstraints(maxHeight: 50.0, maxWidth: 100.0),
                        padding: EdgeInsets.only(bottom: 110.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const UserView()));
                          },
                          child: Text(
                            "Solve Issues",
                            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

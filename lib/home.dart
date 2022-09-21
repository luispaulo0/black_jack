import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class home_game extends StatefulWidget {
  const home_game({Key? key}) : super(key: key);

  @override
  State<home_game> createState() => _home_gameState();
}

class _home_gameState extends State<home_game> {
  double _volumeListenerValue = 0;
  double _getVolume = 0;
  double _setVolumeValue = 0;

  @override
  void initState() {
    super.initState();
    // Listen to system volume change
    VolumeController().listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });

    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroud.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 25.0, top: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'SONIDO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 18,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Slider(
                            activeColor: Colors.white,
                            min: 0,
                            max: 1,
                            onChanged: (double value) {
                              setState(() {
                                _setVolumeValue = value;
                                VolumeController().setVolume(_setVolumeValue);
                              });
                            },
                            value: _setVolumeValue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 15.0),
                          child: LiteRollingSwitch(
                            value: true,
                            textOn: "ON",
                            textOff: "OFF",
                            colorOn: Colors.black.withOpacity(0.5),
                            colorOff: Colors.black.withOpacity(0.5),
                            iconOn: Icons.done,
                            iconOff: Icons.music_off,
                            textSize: 18.0,
                            onChanged: (bool position) {
                              print("El boton esta $position");
                            },
                            textOnColor: Colors.white,
                            textOffColor: Colors.white,
                            onDoubleTap: () {},
                            onSwipe: () {},
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0,
                                    )),
                                minimumSize: const Size(220.0, 50.0),
                                primary: Color.fromARGB(255, 255, 255, 255),
                                backgroundColor: Colors.black.withOpacity(0.5),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Restablecer Saldo",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 17,
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 25.0, top: 15.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Apuesta Mínima ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0,
                                    )),
                                minimumSize: const Size(180.0, 50.0),
                                primary: Color.fromARGB(255, 255, 255, 255),
                                backgroundColor: Colors.black.withOpacity(0.5),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "50",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 17,
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 25.0, top: 15.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Apuesta Máxima',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0,
                                    )),
                                minimumSize: const Size(180.0, 50.0),
                                primary: Color.fromARGB(255, 255, 255, 255),
                                backgroundColor: Colors.black.withOpacity(0.5),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "500",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 62, 182, 234),
                                      width: 3.0,
                                    )),
                                minimumSize: const Size(220.0, 50.0),
                                primary: Color.fromARGB(255, 255, 255, 255),
                                backgroundColor: Colors.black.withOpacity(0.5),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0),
                                    child: Image.asset(
                                      'assets/images/corona.png',
                                      width: 25.0,
                                      height: 25.0,
                                    ),
                                  ),
                                  const Text(
                                    "VERSIÓN PRO",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0),
                                    child: Image.asset(
                                      'assets/images/corona.png',
                                      width: 25.0,
                                      height: 25.0,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}

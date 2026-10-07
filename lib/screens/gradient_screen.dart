import 'package:flutter/material.dart';

class GradientScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<GradientScreen> createState() => _GradientScreen();
}

class _GradientScreen extends State<GradientScreen> {
  final List<String> gambar = ["milesmorales.png", "spiderman.png"];
  static const Map<String, Color> colors = {
    'milesmorales': Color(0xFF2DB569),
    'spiderman': Color(0xFFF386B8),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [Colors.white, Colors.purpleAccent, Colors.deepPurple],
          ),
        ),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: gambar.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
              child: Material(
                elevation: 8.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Hero(
                      tag: gambar[i],
                      child: Material(
                        child: InkWell(
                          child: Flexible(
                            flex: 1,
                            child: Container(
                              color: colors.values.elementAt(i),
                              child: Image.asset(
                                "img/${gambar[i]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Halamandua(
                                gambar: gambar[i],
                                colors: colors.values.elementAt(i),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Halamandua extends StatelessWidget {
  const Halamandua({super.key, required this.gambar, required this.colors});
  final String gambar;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BT21"), backgroundColor: Colors.purpleAccent),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                colors: [Colors.purple, Colors.white, Colors.deepPurple],
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: gambar,
              child: ClipOval(
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Flexible(
                        flex: 1,
                        child: Container(
                          color: colors,
                          child: Image.asset("img/$gambar", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

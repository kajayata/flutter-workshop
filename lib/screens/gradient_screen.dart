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
                          child: Container(
                            color: colors.values.elementAt(i),
                            child: Image.asset(
                              "assets/img/${gambar[i]}",
                              fit: BoxFit.cover,
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

class Halamandua extends StatefulWidget {
  const Halamandua({super.key, required this.gambar, required this.colors});
  final String gambar;
  final Color colors;

  @override
  State<Halamandua> createState() => _HalamanduaState();
}

class _HalamanduaState extends State<Halamandua> {
  Color warna = Colors.grey;

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("BT21"),
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          new PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context) {
              return ListPilihan.map((Pilihan x) {
                return new PopupMenuItem<Pilihan>(
                  value: x,
                  child: new Text(x.teks),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                colors: [Colors.purple, Colors.white, Colors.deepPurple],
              ),
            ),
          ),
          new Center(
            child: new Hero(
              tag: widget.gambar,
              child: new ClipOval(
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: new Material(
                    child: new InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: new Flexible(
                        flex: 1,
                        child: Container(
                          color: widget.colors,
                          child: new Image.asset(
                            "assets/img/${widget.gambar}",
                            fit: BoxFit.cover,
                          ),
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

// menambah class pilihan
class Pilihan {
  const Pilihan({required this.teks, required this.warna});
  final String teks;
  final Color warna;
}

List<Pilihan> ListPilihan = <Pilihan>[
  const Pilihan(teks: 'Pilihan 1', warna: Colors.red),
  const Pilihan(teks: 'Pilihan 2', warna: Colors.green),
  const Pilihan(teks: 'Pilihan 3', warna: Colors.blue),
];

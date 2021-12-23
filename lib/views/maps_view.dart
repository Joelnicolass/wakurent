// ignore_for_file: annotate_overrides

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/globals.dart' as g;

class  Maps_View extends StatelessWidget {
  Maps_View({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: NeumorphicAppBar(actions: []),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Column(
        children: <Widget>[
          Text('Maps', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
          

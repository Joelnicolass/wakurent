import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';

import '../globals.dart' as g;

class GuestsInfo_View extends StatefulWidget {
  const GuestsInfo_View({Key? key}) : super(key: key);

  @override
  State<GuestsInfo_View> createState() => _GuestsInfo_ViewState();
}

class _GuestsInfo_ViewState extends State<GuestsInfo_View> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: const Center(
        child: guestInfo_card(),
      ),
    );
  }
}

class guestInfo_card extends StatelessWidget {
  const guestInfo_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get arguments to previous view
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print('args');
    print(args);

    return Container(
      width: g.width * 0.8,
      height: g.height * 0.6,
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(0),
          )),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const Icon(Icons.person, color: Colors.grey, size: 30),
                    const SizedBox(width: 10),
                    Text(args['name'] + ' ' + args['surname'],
                        style: const TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.mail_rounded, color: Colors.grey, size: 30),
                    const SizedBox(width: 10),
                    Text(args['email'],
                        style: const TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children:[
                    const Icon(Icons.map, color: Colors.grey, size: 30),
                    const SizedBox(width: 10),
                    Text(args['address'],
                        style: const TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.grey, size: 30),
                    const SizedBox(width: 10),
                    Text(args['phone'],
                        style: const TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

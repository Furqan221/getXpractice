import 'package:getx/export_all.dart';

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292929),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(2),
        height: 400,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xffaa5b5e),
                  Color(0xff242424),
                  Color(0xff242424),
                ])),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xff242424),
          ),
        ),
      )),
    );
  }
}

import 'package:getx/export_all.dart';

class STMExample04 extends StatelessWidget {
  STMExample04({super.key});

  final ExampleFourController controller = Get.put(ExampleFourController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Example no 4")),
        body: ListView.builder(
            itemCount: controller.fruits.length,
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: () {
                    controller.setFavourite(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue, width: 2)),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.fruits[index].toString()),
                        Obx(
                          () => Icon(
                            Icons.favorite,
                            color: controller.favfruit
                                    .contains(controller.fruits[index])
                                ? Colors.red
                                : Colors.black.withOpacity(0.1),
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}

import '../../exports.dart';

class GamePlate extends StatelessWidget {
  const GamePlate({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 1.5,
      width: size.width,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(50),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.xoList0.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => controller.onTap(index, context),
          child: Container(
            width: size.width / 3 - 10,
            height: size.width / 3 - 10,
            decoration: BoxDecoration(
              border: getBorder(index, context),
            ),
            child: Center(
              child: Text(
                controller.xoList0[index],
                style: TextStyle(
                    color: controller.xoList0[index] == "X"
                        ? const Color.fromARGB(255, 255, 120, 120)
                        : controller.xoList0[index] == "O"
                            ? const Color.fromARGB(255, 116, 186, 255)
                            : null,
                    fontSize: 32,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Border getBorder(int index, BuildContext context) {
    Border border = Border(
        bottom: index == 6 && index == 7 && index == 8
            ? const BorderSide(color: Colors.transparent, width: 0)
            : BorderSide(
                color: (Theme.of(context).textTheme.bodyMedium!.color)!,
                width: 0.5),
        top: index == 0 && index == 1 && index == 2
            ? const BorderSide(color: Colors.transparent, width: 0)
            : BorderSide(
                color: (Theme.of(context).textTheme.bodyMedium!.color)!,
                width: 0.5),
        left: index == 1 && index == 3 && index == 6
            ? const BorderSide(color: Colors.transparent, width: 0)
            : BorderSide(
                color: (Theme.of(context).textTheme.bodyMedium!.color)!,
                width: 0.5),
        right: index == 2 && index == 5 && index == 8
            ? const BorderSide(color: Colors.transparent, width: 0)
            : BorderSide(
                color: (Theme.of(context).textTheme.bodyMedium!.color)!,
                width: 0.5));
    return border;
  }
}

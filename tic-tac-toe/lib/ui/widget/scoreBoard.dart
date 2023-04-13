import '../../exports.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Controller controller = Provider.of<Controller>(context);
    return SizedBox(
      width: size.width / 1.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "Player O",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                controller.OScore.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
          Column(
            children: [
              Text(
                "Player X",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(controller.XScore.toString(),
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          )
        ],
      ),
    );
  }
}

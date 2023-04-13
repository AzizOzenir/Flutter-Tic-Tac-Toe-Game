import 'package:ttt/exports.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GetBody(),
    );
  }
}

class GetBody extends StatelessWidget {
  const GetBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Controller controller = Provider.of(context);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ScoreBoard(),
          const GamePlate(),
          Center(
            child: Text(
              "It's Turn Of ${!(controller.isXTurn) ? "X" : "O"} ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ttt/exports.dart';

class Controller extends ChangeNotifier {
  int XScore = 0;
  int OScore = 0;
  bool isVisible = false;
  bool isXTurn = true;
  List xoList0 = ["", "", "", "", "", "", "", "", ""];

  onTap(int index, BuildContext context) {
    xoList0[index] == "" ? isXTurn = !isXTurn : null;
    if (isXTurn) {
      xoList0[index] == "" ? xoList0[index] = "X" : null;
    } else {
      xoList0[index] == "" ? xoList0[index] = "O" : null;
    }

    checkWinner(context);

    xoList0.every((element) => element != "")
        ? winDiaolog(context, "No One Winned")
        : null;
    xoList0.every((element) => element != "") ? isVisible = true : null;
    notifyListeners();
  }

  checkWinner(BuildContext context) {
    //first row
    if (xoList0[0] == xoList0[1] &&
        xoList0[0] == xoList0[2] &&
        xoList0[0] != "") {
      if (isXTurn) {
        winDiaolog(context, "X Wins");
      } else {
        winDiaolog(context, "O Wins");
      }
      isVisible = true;
    }
    //second row
    else if (xoList0[3] == xoList0[4] &&
        xoList0[3] == xoList0[5] &&
        xoList0[3] != "") {
      if (isXTurn) {
        winDiaolog(context, "X Wins");
      } else {
        winDiaolog(context, "O Wins");
      }
      isVisible = true;
    }
    //third row
    else if (xoList0[6] == xoList0[7] &&
        xoList0[6] == xoList0[8] &&
        xoList0[6] != "") {
      if (isXTurn) {
        winDiaolog(context, "X Wins");
      } else {
        winDiaolog(context, "O Wins");
      }
      isVisible = true;
    }
    //first column
    else if (xoList0[0] == xoList0[3] &&
        xoList0[0] == xoList0[6] &&
        xoList0[0] != "") {
      if (isXTurn) {
        winDiaolog(context, "X Wins");
      } else {
        winDiaolog(context, "O Wins");
      }
      isVisible = true;
    }
    //second column
    else if (xoList0[1] == xoList0[4] &&
        xoList0[1] == xoList0[7] &&
        xoList0[1] != "") {
      if (isXTurn) {
        winDiaolog(context, "X Wins");
      } else {
        winDiaolog(context, "O Wins");
      }
      isVisible = true;
    }

    //third column
    else if (xoList0[2] == xoList0[5] &&
        xoList0[2] == xoList0[8] &&
        xoList0[2] != "") {
      if (isXTurn) {
        winDiaolog(context, "X Wins");
      } else {
        winDiaolog(context, "O Wins");
      }
      isVisible = true;
    }

    //topleft-bottomright
    else if (xoList0[0] == xoList0[4] &&
        xoList0[0] == xoList0[8] &&
        xoList0[0] != "") {
      if (isXTurn) {
        winDiaolog(context, "X Wins");
      } else {
        winDiaolog(context, "O Wins");
      }
      isVisible = true;
    }
    //topright-bottomleft
    else if (xoList0[2] == xoList0[4] &&
        xoList0[2] == xoList0[6] &&
        xoList0[2] != "") {
      if (isXTurn) {
        winDiaolog(context, "X Wins");
      } else {
        winDiaolog(context, "O Wins");
      }
      isVisible = true;
    }
  }

  winDiaolog(BuildContext context, String text) {
    text == "X Wins"
        ? XScore++
        : text == "O Wins"
            ? OScore++
            : null;

    return showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: AlertDialog(
          insetPadding:
              const EdgeInsets.only(right: 40, left: 40, top: 250, bottom: 250),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor:
              const Color.fromARGB(255, 80, 80, 80).withOpacity(0.8),
          elevation: 0,
          content: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              Colors.cyan, Colors.red,

                              //add more color here.
                            ],
                          ).createShader(
                              const Rect.fromLTWH(150, 150, 100.0, 100.0))),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            restartGame();
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                "Replay",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop');
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 255, 17, 0),
                                  width: 0.5),
                            ),
                            child: const Center(
                              child: Text(
                                "Quit",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 0),
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  restartGame() {
    xoList0.clear();
    xoList0.addAll(["", "", "", "", "", "", "", "", ""]);
    isXTurn = true;
    isVisible = false;
    notifyListeners();
  }
}

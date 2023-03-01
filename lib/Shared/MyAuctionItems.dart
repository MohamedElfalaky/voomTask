import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voom_task/helpers/my_application.dart';
import 'package:voom_task/style/icons_file.dart';

class MyAuctionItems extends StatefulWidget {
  final String? img;
  final String? title;
  final String? id;
  final String? model;
  final String? passenger;
  final String? price;
  final int? seconds;

  MyAuctionItems(
      {super.key,
      this.img,
      this.title,
      this.id,
      this.model,
      this.passenger,
      this.price,
      this.seconds = 172800});

  @override
  State<MyAuctionItems> createState() => _MyAuctionItemsState();
}

class _MyAuctionItemsState extends State<MyAuctionItems> {
  late CountdownTimerController controller;
  @override
  initState() {
    // TODO: implement initState
    super.initState();

    controller = CountdownTimerController(
      endTime: DateTime.now().millisecondsSinceEpoch + 1000 * widget.seconds!,
      onEnd: () {
        print(controller.isRunning.toString());
        print("controller.isRunning");
        Future.delayed(Duration(milliseconds: 1), () {
          setState(() {});
        });
      },
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller.start();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      // height: 380,
      // width: 330,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.img ?? defaultHouse),
                      fit: BoxFit.fill),
                  // color: Colors.green,
                ),
                height: MyApplication.hightClc(context, 176),
              ),
            ],
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title ?? "Verna Marcides ",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.insert_drive_file,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(widget.id ?? "12548")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(widget.model ?? "2020")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(widget.passenger ?? "6")
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 12,
                      ),
                      child: Text(
                        widget.price != null ? "${widget.price}\$" : "20000 \$",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 34, 2, 195)),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color: controller.isRunning == true
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          controller.isRunning == true ? "Open" : "Closed",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(255, 255, 55, 0))),
                      child: CountdownTimer(
                        controller: controller,
                        // onEnd: () {
                        //   // setState(() {});
                        //   print(controller.isRunning.toString());
                        //   print("controller.isRunning");
                        // }
                        // setState(() {});

                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        endWidget: const Text(
                          "00:00:00",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        // widgetBuilder: (context, time) {
                        //   if (time == null) {
                        //     return Text("00:00:00");
                        //   } else {
                        //     return Text(
                        //         'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
                        //   }
                        // },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

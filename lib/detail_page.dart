import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paint_app/config.dart';
import 'package:paint_app/my_data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.data);
  final MyData data;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color? color = Colors.purple[800];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: data.title.toString(),
              child: Stack(
                children: [
                  Container(
                    height: height / 1.9,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(data.asset!), fit: BoxFit.cover)),
                  ),
                  Material(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Container(
                      height: 35,
                      width: 35,
                      margin: const EdgeInsets.only(top: 8, left: 8),
                      child: InkWell(
                        onTap: Navigator.of(context).pop,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(.3),
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title!,
                        style: TextStyle(
                          color: Colors.black.withOpacity(.6),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Hero(
                        tag: "${data.title}${data.price}",
                        child: Material(
                          color: Colors.transparent,
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  data.fav = !data.fav;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(.5),
                                          offset: const Offset(1, 1),
                                          blurRadius: 5,
                                        )
                                      ],
                                      gradient: LinearGradient(
                                          colors: [color!, primaryColor]),
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Icon(
                                    data.fav
                                        ? FontAwesomeIcons.solidHeart
                                        : FontAwesomeIcons.heart,
                                    color: data.fav ? Colors.red : Colors.white,
                                    size: 18,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    r"$" + data.price!,
                    style: TextStyle(
                        color: Colors.grey.withOpacity(.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: const [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage("assets/images/user.jpg"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "OnProgramme",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
                    style: TextStyle(color: Colors.grey.withOpacity(.8)),
                  ),
                ],
              ),
            )),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color!.withOpacity(.6), primaryColor],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "ADD TO CARD",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }
}

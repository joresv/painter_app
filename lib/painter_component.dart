import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paint_app/my_data.dart';

class PainterComponent extends StatelessWidget {
  const PainterComponent(
      {Key? key,
      required this.data,
      this.prevData,
      required this.index,
      this.onTap})
      : super(key: key);
  final MyData data;
  final MyData? prevData;
  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (index % 2 != 0 && prevData != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${prevData!.price}",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                Text(
                  "${prevData!.title}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          SizedBox(
            height: index != 1 ? 195 : 235,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                    tag: data.title.toString(),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(data.asset!),
                              fit: BoxFit.cover)),
                    )),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Hero(
                    tag: "${data.title}${data.price}",
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
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(.3)),
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
          ),
          if (index % 2 == 0)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "\$${data.price}",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                Text(
                  "${data.title}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                )
              ],
            ),
        ],
      ),
    );
  }
}

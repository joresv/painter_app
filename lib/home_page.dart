import 'package:flutter/material.dart';
import 'package:paint_app/config.dart';
import 'package:paint_app/detail_page.dart';
import 'package:paint_app/my_data.dart';
import 'package:paint_app/painter_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MyData> datas = [];
    for (var i = 0; i < 8; i++) {
      datas.add(MyData(
          asset: "assets/images/i${i + 1}.jpg",
          price: "${500 * (i + 1)}",
          title: "The smyle lady ${i + 1}"));
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Explorer",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.settings_input_component_sharp,
                      color: primaryColor,
                    ),
                    border: defaultBorder,
                    enabledBorder: defaultBorder,
                    focusedBorder: defaultBorder,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text("Sort by Relevance"),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .74,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 5),
                itemCount: datas.length + 2,
                itemBuilder: (context, index) {
                  if (datas.length > index) {
                    final data = datas[index];
                    return PainterComponent(
                      data: data,
                      index: index,
                      prevData: index < 2 ? null : datas[index - 2],
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailPage(data),
                        ));
                      },
                    );
                  }
                  return index > datas.length
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${datas.last.price}",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            Text("${datas.last.title}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16))
                          ],
                        )
                      : Container();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

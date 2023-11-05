import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late Future sliderFuture;
  @override
  void didChangeDependencies() {
    sliderFuture = Provider.of<SliderProvider>(context).getSlider();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: FutureBuilder(
        future: sliderFuture,
        initialData: const [],
        builder: (context, snapshot) {
          var sliderData = [];
          if (snapshot.hasData) {
            sliderData = snapshot.data! as List;
          } else {
            return Container(
              child: Text(snapshot.error.toString()),
            );
          }
          return snapshot.hasData
              ? CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                  ),
                  items: sliderData.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(i.image),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                )
              : const Text('No data !');
        },
      ),
    );
  }
}

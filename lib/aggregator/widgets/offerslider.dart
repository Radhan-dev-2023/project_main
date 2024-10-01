import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class OfferSlider extends StatelessWidget {
  const OfferSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 230.0,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: ImageSlideshow(
              indicatorBackgroundColor: Colors.white,
              indicatorColor: Colors.orange,
              height: 240,
              autoPlayInterval: 3000,
              indicatorRadius: 0,
              isLoop: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Image.network(
                    "https://www.finfresh.in/img/bank/f-card2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Image.network(
                    "https://www.finfresh.in/img/bank/f-card2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Image.network(
                    "https://www.finfresh.in/img/bank/f-card2.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        )

    );

  }
}
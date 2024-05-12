import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ImageCaroselWidget extends StatelessWidget {
  final List<String> picsList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FlutterCarousel(
          items: picsList
              .map(
                (e) => Stack(
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: e,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        placeholder: (context, url) =>
                            Icon(Icons.timelapse_rounded),
                        errorWidget: (context, url, err) =>
                            Icon(Icons.error_rounded),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Pet Gogu",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
          options: CarouselOptions(
            enableInfiniteScroll: true,
          ),
        ),
      ),
    );
  }

  const ImageCaroselWidget({
    super.key,
    required this.picsList,
  });
}

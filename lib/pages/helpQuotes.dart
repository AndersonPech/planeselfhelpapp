import 'package:flutter/material.dart';

class HelpQuotes extends StatefulWidget {
  const HelpQuotes({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HelpQuotesState();
  }
}

class _HelpQuotesState extends State<HelpQuotes> {
  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController(initialItem: 1);
    final double height = MediaQuery.sizeOf(context).height;

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    return Scaffold(
      body: Center(
        //Make a button that goes to before flight page
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: height / 2),
                  child: CarouselView.weighted(
                    controller: controller,
                    itemSnapping: true,
                    flexWeights: const <int>[1, 7, 1],
                    children:
                        ImageInfo.values.map((ImageInfo image) {
                          return HeroLayoutCard(imageInfo: image);
                        }).toList(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height/ 15
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum ImageInfo {
  image0(
    'The Flow',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_1.png',
  ),
  image1(
    'Through the Pane',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_2.png',
  ),
  image2(
    'Iridescence',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_3.png',
  ),
  image3(
    'Sea Change',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_4.png',
  ),
  image4(
    'Blue Symphony',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_5.png',
  ),
  image5(
    'When It Rains',
    'Sponsored | Season 1 Now Streaming',
    'content_based_color_scheme_6.png',
  );

  const ImageInfo(this.title, this.subtitle, this.url);
  final String title;
  final String subtitle;
  final String url;
}

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({super.key, required this.imageInfo});

  final ImageInfo imageInfo;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        Container(width: width, color: Colors.lightGreen),
        ClipRect(
          child: OverflowBox(maxWidth: width * 7 / 8, minWidth: width * 7 / 8),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                imageInfo.title,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                imageInfo.subtitle,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

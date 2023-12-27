import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../res/m_colors.dart';
import '../../../../../common_utils/image_loader.dart';
import '../../../../../shared/image_view_screen.dart';
import '../../../../product_details/data/product_details_entity.dart';
import '../../../../product_details/presentation/widgets/image_dialog.dart';
import '../../../../product_details/presentation/widgets/video_dialog.dart';

class TopDetailsPart extends StatefulWidget {
  const TopDetailsPart({Key? key, required this.productDetailsRow})
      : super(key: key);
  final ProductDetailsDataRow? productDetailsRow;

  @override
  State<TopDetailsPart> createState() => _TopDetailsPartState();
}

class _TopDetailsPartState extends State<TopDetailsPart> {
  String getYoutubeThumbnail(String videoUrl) {
    final Uri? uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return '';
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }

  int _currentPage = 0;

  List<String> images() {
    List<String> allImages = [];
    if (widget.productDetailsRow?.youtube != null) {
      allImages
          .add(getYoutubeThumbnail(widget.productDetailsRow?.youtube ?? ''));
    }
    if (widget.productDetailsRow?.media?.type == 'image') {
      allImages.add(widget.productDetailsRow?.media?.url ?? '');
    }
    if (widget.productDetailsRow!.galleries!.isNotEmpty) {
      for (int i = 0; i < widget.productDetailsRow!.galleries!.length; i++) {
        if (widget.productDetailsRow?.galleries?[i].media?.type == 'image') {
          allImages
              .add(widget.productDetailsRow?.galleries?[i].media?.url ?? '');
        }
      }
    }
    return allImages;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      height: 350.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300.w,
            height: 400.h,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                (images().isNotEmpty)
                    ? Center(
                        child: CarouselSlider(
                          items: images().map((item) {
                            return InkWell(
                              onTap: () {
                                if (item.contains('youtube')) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return VideoDialog(
                                          youtubeUrl: widget
                                                  .productDetailsRow?.youtube ??
                                              '',
                                        );
                                      });
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ImageDialog(
                                          imgUrl: item,
                                        );
                                      });
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => ImageViewerScreen(
                                  //           imgUrl:item
                                  //       )),
                                  // );
                                }
                              },
                              child: item.contains('youtube')
                                  ? Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ImageLoader.loadDefaultWithPlaceHolder(
                                            item,
                                            fit: BoxFit.contain),
                                        const Icon(
                                          Icons.slow_motion_video_sharp,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                                  : ImageLoader.loadDefaultWithPlaceHolder(item,
                                      fit: BoxFit.contain),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            disableCenter: true,
                            enableInfiniteScroll: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 1200),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            height: 300,
                            onPageChanged: (index, _) =>
                                setState(() => _currentPage = index),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageViewerScreen(
                                    imgUrl:
                                        widget.productDetailsRow?.media?.url ??
                                            '')),
                          );
                        },
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: ImageLoader.loadDefaultWithPlaceHolder(
                              widget.productDetailsRow?.media?.url ?? '',
                              fit: BoxFit.cover),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: images().map((url) {
                    int index = images().indexOf(url);
                    return Container(
                      width: index == _currentPage ? 20 : 12,
                      height: 12.0,
                      margin: const EdgeInsets.all(4.0),
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: _currentPage == index
                            ? MColors.colorPrimary
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 65,
            child: Scrollbar(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 0),
                shrinkWrap: true,
                itemCount: images().isEmpty ? 1 : images().length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      if (images()[i].contains('youtube')) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return VideoDialog(
                                youtubeUrl:
                                    widget.productDetailsRow?.youtube ?? '',
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ImageDialog(
                                imgUrl: images()[i],
                              );
                            });
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                          border: Border.all(
                              width: 2,
                              color: i == _currentPage
                                  ? MColors.colorPrimary
                                  : MColors.colorPrimaryLight),
                        ),
                        margin: const EdgeInsets.all(4),
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: images()[i].contains('youtube')
                              ? Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ImageLoader.loadDefaultWithPlaceHolder(
                                        images()[i],
                                        fit: BoxFit.fill),
                                    const Icon(
                                      Icons.slow_motion_video_sharp,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              : ImageLoader.loadDefaultWithPlaceHolder(
                                  images()[i],
                                  fit: BoxFit.fill),
                        )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

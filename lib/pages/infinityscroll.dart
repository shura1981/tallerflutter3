import 'package:flutter/material.dart';

class InfintyScroll extends StatefulWidget {
  const InfintyScroll({Key? key}) : super(key: key);

  @override
  State<InfintyScroll> createState() => _InfintyScrollState();
}

class _InfintyScrollState extends State<InfintyScroll> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  ScrollController controller = ScrollController();

  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      final pos = controller.position.pixels;
      final max = controller.position.maxScrollExtent;
      // print('position: $pos, maxScroll: $max');
      if (pos + 500 >= max) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await pause(2);
    imagesIds.clear();
    imagesIds.addAll( [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                itemCount: imagesIds.length,
                itemBuilder: (context, index) {
                  return FadeInImage(
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      placeholder: Image.asset("assets/loading.gif").image,
                      image: Image.network(
                              'https://picsum.photos/500/300?image=${imagesIds[index]}')
                          .image);
                },
              ),
            ),
            if (isLoading)
              //  _Loading()
              _LoadingIcon()
          ],
        ),
      ),
    );
  }

  pause([seconds = 10]) => Future.delayed(Duration(seconds: seconds));

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await pause(3);
    add10();
    isLoading = false;
    setState(() {});

    _animateScroll();
  }

  void add10() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) => lastId + e));
    // setState(() {});
  }

  void _animateScroll() {
    if (controller.position.pixels + 100 <=
        controller.position.maxScrollExtent) {
      return;
    }
    final to = controller.position.pixels + 120;
    controller.animateTo(to,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "cargando datos...",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            CircularProgressIndicator(),
          ],
        ));
  }
}

class _LoadingIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const sizeBox = 40.0;

    _getHalf(value) => value * 0.5;

    return Positioned(
      bottom: 20,
      left: _getHalf(size.width) - _getHalf(sizeBox),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: sizeBox,
        width: sizeBox,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.9), shape: BoxShape.circle),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}

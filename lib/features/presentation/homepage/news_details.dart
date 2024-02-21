import 'package:flutter/material.dart';
import 'package:forestvpn_test/features/Domain/entities/article.dart';

class NewsDetails extends StatelessWidget {
  final Article? article;

  const NewsDetails({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  height: 500,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: Colors.black.withOpacity(0.8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(article!.imageUrl))),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context)),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 10,
                  child: Text(
                    softWrap: true,
                    article!.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 28),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                article!.description.toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

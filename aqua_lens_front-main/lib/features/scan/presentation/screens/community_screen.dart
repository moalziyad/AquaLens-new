import 'package:aqua_lens/features/scan/domain/detection_result.dart';
import 'package:aqua_lens/features/scan/domain/post.dart';
import 'package:aqua_lens/features/scan/presentation/widgets/upgrade_banner.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            const UpgradeBanner(),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Most Viewed Products",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return WaterBrandCard(
                      brandName: "Aqua Water", rating: index + 3.0);
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ListView.builder(
              itemCount: myPosts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SocialMediaPostCard(
                  post: myPosts[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WaterBrandCard extends StatelessWidget {
  final String brandName;
  final double rating;

  const WaterBrandCard({
    super.key,
    required this.brandName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              "assets/water.png",
              height: 100,
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  brandName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaPostCard extends StatefulWidget {
  final Post post;
  const SocialMediaPostCard({super.key, required this.post});

  @override
  _SocialMediaPostCardState createState() => _SocialMediaPostCardState();
}

class _SocialMediaPostCardState extends State<SocialMediaPostCard> {
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.post.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.post.userAvatarUrl),
                  radius: 20.0,
                ),
                const SizedBox(width: 10.0),
                Text(
                  widget.post.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                _isLiked = !_isLiked;
              });
            },
            child: Image.network(
              widget.post.postImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.post.postName,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const detectionResult = DetectionResult(
    itemCount: 0,
    averageAccuracy: 0,
    minAccuracy: 0,
    maxAccuracy: 0,
    imagePath: '');
final myPosts = [
  const Post(
      userName: 'david1',
      userAvatarUrl:
          "https://www.popsci.com/wp-content/uploads/2020/01/07/WMD5M52LJFBEBIHNEEABHVB6LA.jpg",
      postImageUrl:
          "https://static.scientificamerican.com/sciam/cache/file/B7B4EC45-7FAF-4A26-B4AE872ABC0DD2CF_source.jpg?w=1200",
      postName: "Look what I found in my fish",
      isLiked: true,
      detectionResult: detectionResult),
  const Post(
      userName: 'sarah13',
      userAvatarUrl:
          "https://ih1.redbubble.net/image.1765102240.0417/raf,360x360,075,t,fafafa:ca443f4786.u1.jpg",
      postImageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqkhTo9oVa1N2nBq7HRJzndtcMRYlY5WIdCQ&s",
      postName: "this lake in Madrid doesn't look good, be careful",
      isLiked: true,
      detectionResult: detectionResult),
];

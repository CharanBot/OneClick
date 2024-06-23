import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_click/features/shop/home/widgets/service_list_page.dart';
import 'package:only_click/nav_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatelessWidget {
  final Product product;

  PortfolioPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;
    final navigationController = Get.find<NavigationController>();

    // Dummy user reviews
    final List<UserReview> userReviews = [
      UserReview(
        userProfilePic: 'assets/icons/mostbooked/laptop_repair.jpg',
        userName: 'John Doe',
        reviewDate: 'June 20, 2024',
        starRating: 5,
        reviewText:
            'Excellent service! The technician was very professional and fixed my AC in no time. Highly recommended.',
        likes: 15,
        dislikes: 2,
      ),
      UserReview(
        userProfilePic: 'assets/icons/mostbooked/laptop_repair.jpg',
        userName: 'Jane Smith',
        reviewDate: 'June 18, 2024',
        starRating: 4,
        reviewText:
            'Very satisfied with the plumbing service. They arrived on time and solved the issue efficiently.',
        likes: 10,
        dislikes: 1,
      ),
      UserReview(
        userProfilePic: 'assets/icons/mostbooked/laptop_repair.jpg',
        userName: 'Michael Brown',
        reviewDate: 'June 15, 2024',
        starRating: 3,
        reviewText:
            'Good work overall, but there were some delays in the service delivery.',
        likes: 7,
        dislikes: 3,
      ),
    ];

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
        iconTheme: const IconThemeData(color: Colors.teal),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: darkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bug_report),
            onPressed: () {
              // Implement bug report functionality here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text('Bug report functionality yet to be implemented.'),
                ),
              );
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'share',
                child: Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(width: 8),
                    Text('Share'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'favorites',
                child: Row(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 8),
                    Text('Add to Favorites'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'report',
                child: Row(
                  children: [
                    Icon(Icons.report),
                    SizedBox(width: 8),
                    Text('Report Provider'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'share':
                  // Implement share functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Share functionality yet to be implemented.'),
                    ),
                  );
                  break;
                case 'favorites':
                  // Implement add to favorites functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Add to Favorites functionality yet to be implemented.'),
                    ),
                  );
                  break;
                case 'report':
                  // Implement report provider functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Report Provider functionality yet to be implemented.'),
                    ),
                  );
                  break;
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkMode ? Colors.grey[800] : Colors.grey[300],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      product.imageAssetPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Location: ${product.location}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(height: 4),
                      Text(
                        product.rating.toString(),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    color: darkMode
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                    thickness: 1,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.work, color: Colors.teal),
                      const SizedBox(height: 4),
                      Text(
                        '${product.experience} yrs',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    color: darkMode
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                    thickness: 1,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      product.isAvailable
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                      const SizedBox(height: 4),
                      Text(
                        product.isAvailable ? 'Available' : 'Not Available',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Call and Chat buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: product.phoneNumber,
                    );
                    await launchUrl(launchUri); // Launch phone call
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  icon: Icon(Icons.call,
                      color: darkMode ? Colors.white : Colors.white),
                  label: Text(
                    'Call',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: darkMode ? Colors.white : Colors.white,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    navigationController.goToChats();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  icon: Icon(Icons.chat,
                      color: darkMode ? Colors.white : Colors.white),
                  label: Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: darkMode ? Colors.white : Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // About Me Section with Brief Intro
            Text(
              'About me',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: darkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This product is one of the best in the market. It offers unparalleled performance and reliability. With years of experience in the industry, we guarantee satisfaction and high-quality service.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),

            // Skills Section
            Text(
              'Skills',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: darkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: productSkills.map((skill) {
                return Chip(
                  label: Text(
                    skill,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: darkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  backgroundColor: darkMode ? Colors.teal : Colors.teal,
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // User Reviews Section
            Text(
              'User Reviews',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: darkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: userReviews.map((review) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(review.userProfilePic),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  review.userName,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color:
                                        darkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                                Text(
                                  review.reviewDate,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  review.starRating.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color:
                                        darkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              review.reviewText,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.thumb_up,
                                    color: Colors.green, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  review.likes.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color:
                                        darkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(Icons.thumb_down,
                                    color: Colors.red, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  review.dislikes.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color:
                                        darkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Booking Section
            Text(
              'Book Service',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: darkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'To book this service provider, please click the button below:',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: darkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement booking functionality here
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Booking functionality to be implemented.'),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: darkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy skills data for demonstration
final List<String> productSkills = [
  'AC Repairing',
  'Purifier Repair',
  'Wood Work',
  'Plumbing',
];

// Dummy user review model
class UserReview {
  final String userProfilePic;
  final String userName;
  final String reviewDate;
  final int starRating;
  final String reviewText;
  final int likes;
  final int dislikes;

  UserReview({
    required this.userProfilePic,
    required this.userName,
    required this.reviewDate,
    required this.starRating,
    required this.reviewText,
    required this.likes,
    required this.dislikes,
  });
}

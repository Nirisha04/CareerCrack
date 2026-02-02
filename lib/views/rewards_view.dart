import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rewards_controller.dart';

class RewardsView extends StatelessWidget {
  final RewardsController controller = Get.put(RewardsController());

  RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rewards & Achievements'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Progress'),
              Tab(text: 'Badges'), // Placeholder for now
              Tab(text: 'Leaderboard'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildProgressTab(context),
            _buildBadgesTab(),
            _buildLeaderboardTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressTab(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStatCard('XP', '${controller.xp.value}', Colors.amber),
            const SizedBox(height: 16),
            _buildStatCard('Level', '${controller.level.value}', Colors.blue),
            const SizedBox(height: 16),
            _buildStatCard(
              'Streak',
              '${controller.streak.value} Days',
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgesTab() {
    // Placeholder as controller doesn't supply rewards list yet
    return Center(child: Text('Badges coming soon details in Firestore!'));
  }

  Widget _buildLeaderboardTab() {
    // Mock leaderboard using new XP value
    return Obx(() {
      List<Map<String, dynamic>> leaderboard = [
        {'name': 'Alice', 'points': 2500, 'avatar': 'A'},
        {'name': 'Bob', 'points': 2200, 'avatar': 'B'},
        {'name': 'You', 'points': controller.xp.value, 'avatar': 'Y'},
        {'name': 'Charlie', 'points': 2000, 'avatar': 'C'},
      ];

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: leaderboard.length,
        itemBuilder: (context, index) {
          var user = leaderboard[index];
          bool isCurrentUser = user['name'] == 'You';
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isCurrentUser
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                child: Text(
                  user['avatar'],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                user['name'],
                style: TextStyle(
                  fontWeight: isCurrentUser
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              trailing: Text(
                '${user['points']} XP',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          );
        },
      );
    });
  }
}

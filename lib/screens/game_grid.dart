// game_grid_component.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smileapp/screens/game_play.dart';

class GameGrid extends StatelessWidget {
  const GameGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final List<_GameMatch> games = [
      _GameMatch(
          icon: FontAwesomeIcons.dragon, title: 'Apex Legends', match: 89),
      _GameMatch(
          icon: FontAwesomeIcons.robot,
          title: 'Horizon Forbidden West',
          match: 87),
      _GameMatch(
          icon: FontAwesomeIcons.gamepad, title: 'Apex Legends', match: 85),
      _GameMatch(
          icon: FontAwesomeIcons.crosshairs, title: 'Apex Legends', match: 85),
      _GameMatch(
          icon: FontAwesomeIcons.skull, title: 'Apex Legends', match: 85),
      _GameMatch(
          icon: FontAwesomeIcons.ghost, title: 'Apex Legends', match: 85),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Select Games"),
      ),
      body: Container(
        color: theme.surface,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: games.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final game = games[index];
                      return _GameCard(game: game);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.expand_more),
                  label: const Text('Show more'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primary,
                    foregroundColor: theme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GameMatch {
  final IconData icon;
  final String title;
  final int match;

  const _GameMatch({
    required this.icon,
    required this.title,
    required this.match,
  });
}

class _GameCard extends StatelessWidget {
  final _GameMatch game;

  const _GameCard({required this.game});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const GamePlayPanel())
        );
      },
      child: Card(
        color: theme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Center(
              child: FaIcon(
                game.icon,
                size: 48,
                color: theme.primary,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.tertiary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${game.match}% match',
                  style: TextStyle(
                    color: theme.onTertiary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  game.title,
                  style: TextStyle(
                    color: theme.onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
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

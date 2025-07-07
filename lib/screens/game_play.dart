// car_sound_panel.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GamePlayPanel extends StatelessWidget {
  const GamePlayPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: theme.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),

          // Car Icon Placeholder
          FaIcon(
            FontAwesomeIcons.car,
            size: 120,
            color: theme.primary,
          ),

          const SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _SoundButton(
                  label: 'break',
                  icon: FontAwesomeIcons.pause,
                ),
                _SoundButton(
                  label: 'horn',
                  icon: FontAwesomeIcons.bullhorn,
                ),
                _SoundButton(
                  label: 'speed',
                  icon: FontAwesomeIcons.gaugeHigh,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SoundButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const _SoundButton({
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      children: [
        InkWell(
          onTap: () {
            // You could add sound playback logic here
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: theme.primary, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: FaIcon(
              icon,
              size: 28,
              color: theme.primary,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: theme.onBackground,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

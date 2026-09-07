import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The outer shell — consistent gradient card with shimmer stripe
class CardShell extends StatelessWidget {
  final Color primaryColor;
  final Widget child;

  const CardShell({super.key, required this.primaryColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            primaryColor.withOpacity(0.85),
            primaryColor.withOpacity(0.7),
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.4),
            blurRadius: 24,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: primaryColor.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Ambient glow elements inside the card
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            left: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          // Shimmer stripe top
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0),
                  ],
                ),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
            child: child,
          ),
        ],
      ),
    );
  }
}

/// Muted label above the hero value
class CardLabel extends StatelessWidget {
  final String label;
  final Color onPrimary;
  const CardLabel({super.key, required this.label, required this.onPrimary});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: onPrimary.withOpacity(0.75),
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
      ),
    );
  }
}

/// Large hero number
class CardHeroValue extends StatelessWidget {
  final String value;
  final Color onPrimary;
  const CardHeroValue({super.key, required this.value, required this.onPrimary});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: onPrimary,
        fontSize: 40,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        height: 1.1,
      ),
    );
  }
}

/// Two-column stat row with center divider (for income/expense style)
class CardDividerRow extends StatelessWidget {
  final Widget left;
  final Widget right;
  final Color onPrimary;
  const CardDividerRow({super.key, required this.left, required this.right, required this.onPrimary});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: left),
        Container(width: 1, height: 52, color: onPrimary.withOpacity(0.2)),
        Expanded(child: right),
      ],
    );
  }
}

/// Reusable vertical divider
class VerticalDivider extends StatelessWidget {
  final Color onPrimary;
  const VerticalDivider({super.key, required this.onPrimary});

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 48, color: onPrimary.withOpacity(0.2));
  }
}

/// Unified stat item: icon + label + value
class StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color onPrimary;

  const StatItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.onPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: onPrimary.withOpacity(0.65),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: onPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}


/// Bottom pill badge (e.g. "12 transactions")
class CardPill extends StatelessWidget {
  final String label;
  final Color onPrimary;
  const CardPill({super.key, required this.label, required this.onPrimary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: onPrimary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: onPrimary.withOpacity(0.85),
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

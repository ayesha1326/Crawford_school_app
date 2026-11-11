import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../data/mock_database.dart';
import '../../models/school_event.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    final events = MockDatabase.events;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Events & Extracurriculars'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        separatorBuilder: (context, index) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final event = events[index];
          return _buildEventCard(event);
        },
      ),
    );
  }

  Widget _buildEventCard(SchoolEvent event) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGrey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Header Ribbon
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.darkNavy,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded, color: AppColors.primaryRed, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      event.date,
                      style: const TextStyle(
                        color: AppColors.pureWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    event.category,
                    style: const TextStyle(
                      color: AppColors.pureWhite,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded, size: 14, color: AppColors.secondaryText),
                    const SizedBox(width: 6),
                    Text(
                      event.time,
                      style: const TextStyle(fontSize: 11, color: AppColors.secondaryText),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.location_on_outlined, size: 14, color: AppColors.secondaryText),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        event.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11, color: AppColors.secondaryText),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  event.description,
                  style: const TextStyle(fontSize: 12, color: AppColors.secondaryText, height: 1.4),
                ),
                const Divider(height: 20),

                // RSVP Action
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      event.isRsvpRegistered ? 'RSVP: Attending' : 'RSVP: Open',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: event.isRsvpRegistered ? AppColors.successGreen : AppColors.secondaryText,
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: event.isRsvpRegistered ? AppColors.darkNavy : AppColors.primaryRed,
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      ),
                      icon: Icon(
                        event.isRsvpRegistered ? Icons.check_circle_rounded : Icons.how_to_reg_rounded,
                        size: 16,
                      ),
                      label: Text(
                        event.isRsvpRegistered ? 'Registered' : 'Register RSVP',
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        setState(() {
                          event.isRsvpRegistered = !event.isRsvpRegistered;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              event.isRsvpRegistered
                                  ? 'RSVP registered for ${event.title}'
                                  : 'RSVP canceled.',
                            ),
                            backgroundColor: event.isRsvpRegistered
                                ? AppColors.successGreen
                                : AppColors.darkNavy,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

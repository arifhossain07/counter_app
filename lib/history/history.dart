import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../provider/counter_provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.watch<CounterProvider>().history;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => context.read<CounterProvider>().clearHistory(),
          ),
        ],
      ),
      body: history.isEmpty
          ? const Center(child: Text("No History Yet"))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: history.length,
              separatorBuilder: (_, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = history[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: colorScheme.primary,
                        child: Text(
                          "${item.value}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Count Value: ${item.value}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                            const Text(
                              "Click",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        DateFormat('EEEE, MMM d, yyyy').format(item.timestamp),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

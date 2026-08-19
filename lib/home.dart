import 'package:counter_app/ui/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/counter_provider.dart';
import 'history/history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CounterProvider>();
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Start Counter",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryPage(),
                      ),
                    ),
                    icon: const Icon(Icons.history, size: 18),
                    label: const Text("History"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colorScheme.primary,
                      side: BorderSide(
                        color: colorScheme.primary.withValues(alpha: 0.5),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              "${provider.counter}",
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.w500,
                color: colorScheme.primary,
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ActionButton(
                        icon: Icons.add,
                        label: "Plus",
                        onTap: () =>
                            context.read<CounterProvider>().increment(),
                      ),
                      Container(
                        width: 1,
                        height: 150,
                        color: Colors.grey.shade300,
                      ),
                      ActionButton(
                        icon: Icons.remove,
                        label: "Minus",
                        onTap: () =>
                            context.read<CounterProvider>().decrement(),
                      ),
                    ],
                  ),
                  Container(height: 1, color: Colors.grey.shade300),
                  Row(
                    children: [
                      ActionButton(
                        icon: Icons.save_alt,
                        label: "Save",
                        onTap: () {
                          context.read<CounterProvider>().save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Count saved to history"),
                            ),
                          );
                        },
                      ),
                      Container(
                        width: 1,
                        height: 150,
                        color: Colors.grey.shade300,
                      ),
                      ActionButton(
                        icon: Icons.restart_alt,
                        label: "Reset",
                        onTap: () => context.read<CounterProvider>().reset(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

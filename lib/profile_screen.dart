import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/ImanAbdurrahman.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 90,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          'Iman Abdurrahman',
                          style: TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '123200167',
                          style: TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'IF-A',
                          style: TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Bermain game',
                          style: TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

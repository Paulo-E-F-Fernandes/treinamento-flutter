import 'package:flutter/material.dart';

/* *** Versão 002 *** */
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Transferências'),
          ),
          body: Column(
            children: const [
              Card(
                child: ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('100.0'),
                  subtitle: Text('1000'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('200.0'),
                  subtitle: Text('2000'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => print('teste'),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

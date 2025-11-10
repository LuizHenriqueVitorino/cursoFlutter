import 'package:flutter/material.dart';

void main() {
  runApp(const LunaRuanApp());
}

class LunaRuanApp extends StatefulWidget {
  const LunaRuanApp({super.key});

  @override
  State<LunaRuanApp> createState() => _LunaRuanAppState();
}

class _LunaRuanAppState extends State<LunaRuanApp> {
  bool isRuan = true; // alterna entre temas

  List<String> perguntasRuan = [];
  List<String> perguntasLuna = [];

  final TextEditingController perguntaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = isRuan
        ? const ColorScheme.light(
            primary: Color(0xFFB3E5FC), // Azul bebê
            secondary: Color(0xFF81D4FA),
            surface: Color(0xFFE1F5FE),
            onPrimary: Colors.black,
          )
        : const ColorScheme.light(
            primary: Color(0xFFF8BBD0), // Rosa claro
            secondary: Color(0xFFF48FB1),
            surface: Color(0xFFFCE4EC),
            onPrimary: Colors.black,
          );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: scheme, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            isRuan ? "App do Ruan 💙" : "App da Luna 💗",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: scheme.primary,
          actions: [
            IconButton(
              icon: Icon(isRuan ? Icons.boy : Icons.girl),
              onPressed: () {
                setState(() => isRuan = !isRuan);
              },
              tooltip: "Trocar para ${isRuan ? 'Luna' : 'Ruan'}",
            ),
          ],
        ),
        body: Container(
          color: scheme.surface,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Informações do tema atual
              Card(
                elevation: 4,
                color: scheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: scheme.secondary,
                    child: Text(isRuan ? "R" : "L",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  title: Text(
                    isRuan ? "Ruan Levi 🍼" : "Luna Dominique 🌸",
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(isRuan
                      ? "Ruan é um bebê alegre e curioso!"
                      : "Luna é uma menina criativa e carinhosa!"),
                ),
              ),
              const SizedBox(height: 20),

              // Campo para adicionar perguntas
              TextField(
                controller: perguntaController,
                decoration: InputDecoration(
                  labelText: "Digite uma pergunta para ${isRuan ? 'Ruan' : 'Luna'}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                  final texto = perguntaController.text.trim();
                  if (texto.isEmpty) return;
                  setState(() {
                    if (isRuan) {
                      perguntasRuan.add(texto);
                    } else {
                      perguntasLuna.add(texto);
                    }
                    perguntaController.clear();
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text("Adicionar Pergunta"),
              ),
              const SizedBox(height: 20),

              // Lista de perguntas
              Expanded(
                child: perguntasAtuais().isEmpty
                    ? Center(
                        child: Text(
                          "Nenhuma pergunta ainda para ${isRuan ? 'Ruan' : 'Luna'} 💭",
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        itemCount: perguntasAtuais().length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: scheme.secondary.withOpacity(0.3),
                            child: ListTile(
                              title: Text(perguntasAtuais()[index]),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () {
                                  setState(() {
                                    perguntasAtuais().removeAt(index);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> perguntasAtuais() {
    return isRuan ? perguntasRuan : perguntasLuna;
  }
}

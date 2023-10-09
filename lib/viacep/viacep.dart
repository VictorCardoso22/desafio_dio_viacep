import 'package:desafio_dio_viacep/model/viacep_model.dart';
import 'package:desafio_dio_viacep/viacep/viacep_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Viacep extends StatefulWidget {
  const Viacep({super.key});

  @override
  State<Viacep> createState() => _ViacepState();
}

class _ViacepState extends State<Viacep> {
  TextEditingController cepController = TextEditingController();
  String cep = '';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViacepViewlModel>.reactive(
        viewModelBuilder: () => ViacepViewlModel(),
        builder: (context, model, child) {
          return Column(children: [
            TextField(
              maxLength: 8,
              keyboardType: TextInputType.number,
              controller: cepController,
              onChanged: (String value) async {
                cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  model.getCEP(cep);
                } else {}
              },
            ),
            Row(
              children: [
                Text("cidade: ${model.cidade}"),
                TextButton.icon(
                    onPressed: () {
                      model.saveCEP(ViacepModel());
                    },
                    icon: const Icon(Icons.save),
                    label: const Text("Salvar"))
              ],
            ),
            Center(child: Text('Meus ceps salvos:')),
            SizedBox(
              width: 350,
              height: 200,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: model.listCep.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text('Cidade: ${model.listCep[index].cidade}'),
                              ],
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Icon(Icons.delete),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ]);
        });
  }
}

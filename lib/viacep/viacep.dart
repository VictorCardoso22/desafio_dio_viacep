import 'package:desafio_dio_viacep/viacep/viacep_viewmodel.dart';
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite o CEP',
              ),
              onChanged: (String value) async {
                cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  model.getCEP(cep);
                } else {}
              },
            ),
            model.viacepModel.localidade != null
                ? Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nome: ${model.viacepModel.localidade}"),
                                Text("CEP: ${model.viacepModel.cep}"),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        TextButton.icon(
                            onPressed: () async {
                              await model.saveCEP(model.viacepModel);
                            },
                            icon: const Icon(Icons.save),
                            label: const Text("Salvar"))
                      ],
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 12,
            ),
            const Center(
                child: Text(
              'Meus ceps salvos:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
            const SizedBox(height: 8),
            SizedBox(
              width: 450,
              height: 400,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: model.listCep.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Nome: ${model.listCep[index].localidade}'),
                                  Text(
                                    'Logradouro: ${model.listCep[index].logradouro}',
                                    softWrap: true,
                                    maxLines: 2,
                                  ),
                                  Text('ddd: ${model.listCep[index].ddd}'),
                                ],
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () async {
                                await model
                                    .deleteCEP(model.listCep[index].objectId!);
                              },
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

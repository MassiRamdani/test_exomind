import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:test_exomind/components/item_result.dart';
import 'package:test_exomind/controllers/progress_controller.dart';
import '../components/custom_linear_progress_indicator.dart';

// Cette classe représente l'écran de progression de l'application.
class ProgressScreen extends GetView<ProgressController> {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Écran de progression')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Affiche la liste des résultats lorsque le chargement est terminé.
            buildResultsList(),

            const SizedBox(height: 16),
            // Affiche le message de progression lors du chargement.
            Obx(
              () => Visibility(
                visible: controller.isProgress.value,
                child: buildTextMessage(),
              ),
            ),
            const SizedBox(height: 16),
            // Affiche la jauge de progression pendant le chargement.
            Obx(
              () => Visibility(
                visible: controller.isProgress.value,
                child: buildLinearProgress(),
              ),
            ),
            const SizedBox(height: 16),
            // Affiche le bouton de redémarrage lorsque le chargement est terminé.
            Obx(
              () => Visibility(
                visible: !controller.isProgress.value,
                child: buildButtonRestart(context),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  // Construit la jauge de progression personnalisée.
  Widget buildLinearProgress() {
    return Obx(() => CustomLinearProgressIndicator(
          value: controller.progress.value,
        ));
  }

  // Construit le message de progression.
  Widget buildTextMessage() {
    return Obx(
      () => Text(
          controller.progressMessages.isNotEmpty
              ? controller
                  .progressMessages[controller.currentMessageIndex.value]
              : 'Message de progression',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.purple)),
    );
  }

  // Construit le bouton de redémarrage.
  Widget buildButtonRestart(context) {
    return ElevatedButton(
      onPressed: () {
        controller.restartProgress(); // Redémarre le processus de progression.
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.resolveWith(
            (states) => Size(MediaQuery.of(context).size.width, 50.0)),
      ),
      child: const Text('Recommencer'),
    );
  }

  // Construit la liste des résultats météo.
  Widget buildResultsList() {
    return Expanded(
      child: Obx(
        () => !controller.isProgress.value
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.weatherDataList.length,
                itemBuilder: (context, index) => ItemResult(
                  weatherData: controller.weatherDataList[index],
                ),
              )
            : Center(
                child: LoadingAnimationWidget.hexagonDots(
                color: const Color(0xFFEA3799),
                size: 50,
              )),
      ),
    );
  }
}

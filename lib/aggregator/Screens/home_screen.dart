import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:finfresh_mobile/aggregator/Screens/provider_class.dart';
import 'package:finfresh_mobile/aggregator/Screens/web_view.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utilities/constant/snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  Future<void> _sendSms() async {
    final mobileNumberProvider = Provider.of<TransactionProvider>(context, listen: false);
    final transactionProvider = Provider.of<TransactionProvider>(context, listen: false);

    transactionProvider.setLoading(true);
    transactionProvider.setSmsSent(true);

    final dashBoardController = Provider.of<DashBoardController>(context, listen: false);
    final String? phoneNumber = dashBoardController.dashBoardModel?.result?.data?.phoneNumber;

    if (phoneNumber == null || phoneNumber.isEmpty) {
      transactionProvider.setLoading(false);
      transactionProvider.setSmsSent(false);
      showSnackBar(context, "Mobile number is not available");
      return;
    }

    final String? url = await mobileNumberProvider.generatedUrl(phoneNumber);

    transactionProvider.setLoading(false);

    if (url != null) {
      showSnackBar(context, 'You will need to complete Digitap Verification');
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WebViewExample(url: url)),
      );
    } else {
      showSnackBar(context, "Failed to Digitap Verification");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<DashBoardController>(
          builder: (context, dashBoardController, _) {
            return Consumer<TransactionProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.42,
                      color: const Color(0xFF4D84BD),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildIncomeExpenseContainer(
                                  context: context,
                                  icon: Icons.account_balance_wallet_outlined,
                                  text1: provider.isSmsSent
                                      ? "Wait for 5 min....Please Look on other Features"
                                      : (provider.phoneNumber?.isEmpty ?? true)
                                      ? "Click here to link your BANK account"
                                      : (provider.isReportLoading==true)
                                      ? "Please Check Your Mobile Number"
                                      : "Error in Phone Number",

                                  title: "Income",
                                ),
                                buildIncomeExpenseContainer(
                                  context: context,
                                  icon: Icons.account_balance_wallet,
                                  text1:provider.isSmsSent
                                      ? "Wait for 5 min....Please Look on other Features"
                                      : (provider.phoneNumber?.isEmpty ?? true)
                                      ? "Click here to link your BANK account"
                                      : "Please Check Your Mobile Number",
                                  title: "Expense",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "NOTE:    ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Please avoid selecting ICICI Bank as we are facing difficulties fetching the data.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white30,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            color: Colors.grey,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.007,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildContainer(
                                context: context,
                                icon: Icons.health_and_safety,
                                iconColor: Colors.red,
                                description: "Track your Insurance datas",
                                title: "Insurance Track",
                              ),
                              buildContainer(
                                context: context,
                                icon: Icons.cases_outlined,
                                iconColor: Colors.red,
                                description: "Link Your Account",
                                title: "Portfolio Track",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildContainer(
                                context: context,
                                icon: Icons.credit_card,
                                iconColor: Colors.red,
                                description: "Categorize your Credited money",
                                title: "Credit Track",
                              ),
                              buildContainer(
                                context: context,
                                icon: Icons.motion_photos_on_outlined,
                                iconColor: Colors.red,
                                description: "Track your PF datas",
                                title: "Track PF",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildIncomeExpenseContainer({
    required BuildContext context,
    required IconData icon,
    required String text1,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * 0.23,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            _isLoading
                ? const CircularProgressIndicator()
                : AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  text1,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.red.shade900,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
              onTap: _isLoading
                  ? null
                  : () async {
                await _sendSms();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Please wait for a while...',
                    ),
                  ),
                );
              },
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String description,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * 0.23,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Icon(Icons.arrow_drop_down_circle_outlined,
                        color: Colors.grey),
                    const SizedBox(width: 2),
                  ],
                ),
                Icon(icon, size: 45, color: iconColor),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: const Center(
                child: Text(
                  "COMING SOON",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


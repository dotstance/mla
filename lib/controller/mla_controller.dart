import 'package:get/get.dart';
import 'package:mla/models/mla_model.dart';

import '../constants/firebase_credentials.dart';
import '../models/mla_opponents_model.dart';

class MlaController extends GetxController{
    static MlaController instance = Get.find();

    RxList<MlaModel> allMlaList = RxList<MlaModel>([]);

    var selectedMlaModel = "https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/mla%20Image2023-11-18%2011%3A41%3A24.318?alt=media&token=4ee48516-b957-486a-b21a-52695e94022e".obs;

    RxList<MlaOpponentModel> selectedOpponentList = RxList<MlaOpponentModel>([]);

    void getMlaaModel(String newModle){
        selectedMlaModel.value = newModle;
        print("selectedMlaModel : ${selectedMlaModel.value}");
    }

    var slectedMlaName = "RRR".obs;
    var slectedMlaImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Kalvakuntla_Chandrashekar_Rao.png/220px-Kalvakuntla_Chandrashekar_Rao.png".obs;

    var selectedMlaManifesto = "some data".obs;

    var selectedMlaPartySymbol = "".obs;

    void getMlaData(String newMlaName, String newManifesto, List<MlaOpponentModel> newMlaOpponets,String newMlaiamge){
        selectedOpponentList.value.clear();
        slectedMlaName.value = newMlaName;

        selectedMlaManifesto.value = newManifesto;

        selectedOpponentList.value.addAll(newMlaOpponets);

        slectedMlaImage.value = newMlaiamge;

        print("opponent List :${selectedOpponentList.value}");
    }

    @override
    void onReady() {
        allMlaList.bindStream(
            getMlas());
        print("All MLa List $allMlaList");
        super.onReady();
    }

    Stream<List<MlaModel>> getMlas() =>
        firebaseFirestore
            .collection("MLAList")/*.where("partyName",isEqualTo: "Congress")*/
            .snapshots()
            .map((query) =>
            query.docs.map((item) => MlaModel.fromMap(item)).toList());

    getAllMlaList() {
        try {
            allMlaList.bindStream(getMlas());
            print("All MLa List from getAllMlaList ${allMlaList.value[0].mlaName}");
        } on Exception catch (e) {
            print(e);
        }
    }
}
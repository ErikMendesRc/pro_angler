import '../Models/user.dart';
import 'mock_champion_trophys.dart';
import 'mock_personal_achiviementes.dart';

class MockUsers {
  static List<User> getAllUsers() {
    return [
      User(
        id: '1',
        name: 'Erik Mendes',
        email: 'erik@teste.com',
        password: '*****',
        city: 'Rio Claro-SP',
        photo:
            'https://scontent.fsod8-1.fna.fbcdn.net/v/t39.30808-6/352534722_630875185763465_7425860999607094935_n.jpg?_nc_cat=100&cb=99be929b-59f725be&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHFTybivfe4l2WzMcxLIeQc_GuYq-PdV5H8a5ir491XkZMsGjHHT3KjwBc7Xxwcg1GaCqEx8_bh3vubn3Y-IF9S&_nc_ohc=j83erq402XoAX_Baj1U&_nc_ht=scontent.fsod8-1.fna&oh=00_AfDO_CuF9bGwPwmkK7Z4K7MV8So__zMey9YxYwPzQO7y8w&oe=64B2C39F',
        championTrophys: MockChampionTrophys.getAllChampionTrophys(),
        personalAchiviements:
            MockPersonalAchievements.getAllPersonalAchievements(),
      ),
      User(
        id: '2',
        name: 'Ricado',
        email: 'ricardo@example.com',
        password: '******',
        city: 'Santa Gertrudes-SP',
        photo:
            'https://scontent.fsod8-1.fna.fbcdn.net/v/t39.30808-6/355024003_3043145519162181_2217104128214503138_n.jpg?stp=cp6_dst-jpg&_nc_cat=108&cb=99be929b-59f725be&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHpp9qNtKhEKVmobnXHYs_K5LsCf5QXH-LkuwJ_lBcf4mycRb15hy4JR_V-48R2ff2KkgYZUbcUy53shwEnXRR4&_nc_ohc=DXX4AA5NLXcAX9wFs7j&_nc_ht=scontent.fsod8-1.fna&oh=00_AfBpPAH9w_o6gzrgMyTcUl1JOo3F1uvn-ZbsJuAKfE8Kog&oe=64B3544D',
      ),
      User(
        id: '3',
        name: 'Adriel Melle',
        email: 'melle@example.com',
        password: '******',
        city: 'Rio Claro-SP',
        photo:
            'https://scontent.fsod8-1.fna.fbcdn.net/v/t1.18169-9/12042759_881830171899826_4317096933916506145_n.jpg?_nc_cat=101&cb=99be929b-59f725be&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeFDMzJITp1faFSvSU4wz1KAxelXeDSE2VbF6Vd4NITZVhZoHZ_lZ94x1pI4Iq0J40hrfDoJKTgkl6FBR_7OxdYt&_nc_ohc=qvWg5WLopGIAX-iCSvr&_nc_ht=scontent.fsod8-1.fna&oh=00_AfA0FlOW_3zBn0qdhvg-ddQRHj6Sd-y48jHz6t5WSZ_w-g&oe=64D52334',
        championTrophys: MockChampionTrophys.getAllChampionTrophys(),
        personalAchiviements:
            MockPersonalAchievements.getAllPersonalAchievements(),
      ),
      User(
        id: '4',
        name: 'Fernando',
        email: 'fer@example.com',
        password: '********',
        city: 'Santa Gertrudes-SP',
        photo:
            'https://pps.whatsapp.net/v/t61.24694-24/202417519_122146223743868_4346542240291590897_n.jpg?ccb=11-4&oh=01_AdTkzligJld0g8d3oCcox0xS-YYf3sVtMTg-mih8qCx-vA&oe=64B5E4AC',
      ),
    ];
  }

  static User getUserById(String userId) {
    for (User user in getAllUsers()) {
      if (user.id == userId) {
        return user;
      }
    }
    // Caso não encontre o usuário, pode retornar null ou um objeto vazio
    return User(
      id: '',
      name: '',
      email: '',
      password: '',
      city: '',
    );
  }
}

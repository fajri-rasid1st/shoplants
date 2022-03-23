import 'package:shoplants/data/models/plant.dart';

class Const {
  // base URL for assets
  static const String baseUrl =
      "https://raw.githubusercontent.com/fajri-rasid1st/assets/main/plants";

  // default user id/key
  static const String userId = "user";

  // default cart id/key
  static const String cartId = "cart";

  // default profile picture path
  static const String profilePath = "assets/img/user_pict.png";

  // banner URLs
  static const List<String> imgBannerUrls = <String>[
    "$baseUrl/banner_1.jpg",
    "$baseUrl/banner_2.jpg",
    "$baseUrl/banner_3.jpg",
  ];

  // list of plants
  static const List<Plant> plants = [
    Plant(
      name: "Alocasia Plant",
      alias: "Alocasia",
      price: 65,
      about:
          "Alocasia are stunning tropical plants with arrowhead-shaped leaves. Find a warm, bright area in your home for these beauties.",
      characteristics: <String>[
        "Drained",
        "Normal Light",
        "60 x 100 cm",
        "20-25 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_alocasia-removebg-preview.png",
        "$baseUrl/plant_alocasia.png",
      ],
    ),
    Plant(
      name: "Aloe Vera Plant",
      alias: "Lidah Buaya",
      price: 50,
      about:
          "The aloe vera plant is an easy, attractive succulent that makes for a great indoor companion. Aloe vera plants are also useful, as the juice from their leaves can be used to relieve pain from scrapes and burns when applied topically.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "30 x 50 cm",
        "13-27 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_aloe_vera-removebg-preview.png",
        "$baseUrl/plant_aloe_vera.jpg",
      ],
    ),
    Plant(
      name: "Areca Palm Plant",
      alias: "Palem Kuning",
      price: 48,
      about:
          "Areca palm (Chrysalidocarpus lutescens) is one of the most widely used palms for bright interiors. It features feathery, arching fronds, each with up to 100 leaflets. These big, bold plants command attention.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "80 x 120 cm",
        "18-25 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_areca_palm-removebg-preview.png",
        "$baseUrl/plant_areca_palm.jpg",
      ],
    ),
    Plant(
      name: "Asparagus Fern Plant",
      alias: "Asparagus Hias",
      price: 35,
      about:
          "The asparagus fern plant (Asparagus aethiopicus) is normally found in a hanging basket, decorating the deck or patio in summer and helping to clean indoor air in winter.",
      characteristics: <String>[
        "Moistened",
        "Low Light",
        "40 x 80 cm",
        "10-18 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_asparagus_fern-removebg-preview.png",
        "$baseUrl/plant_asparagus_fern.jpg",
      ],
    ),
    Plant(
      name: "Banana Tree Plant",
      alias: "Pohon Pisang Hias",
      price: 25,
      about:
          "Banana trees generally have a fast growth rate and should be planted in the spring. Plus, they can make good houseplants with enough light, though they typically don't bear fruit indoors.",
      characteristics: <String>[
        "Moistened",
        "Normal Light",
        "68 x 124 cm",
        "23-32 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_banana_tree-removebg-preview.png",
        "$baseUrl/plant_banana_tree.jpg",
      ],
    ),
    Plant(
      name: "Cactus Plant",
      alias: "Kaktus Hias",
      price: 68,
      about:
          "Cactus are some of the most unusual and elegant plants in the world, with bold shapes of all kinds and beautiful green colour variations. They fit into many different home decor styles.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "30 x 60 cm",
        "18-40 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_cactus-removebg-preview.png",
        "$baseUrl/plant_cactus.jpg",
      ],
    ),
    Plant(
      name: "Chinese Money Plant",
      alias: "Pilea Peperomioides",
      price: 42,
      about:
          "The Chinese money is a popular houseplant thanks to its attractive coin-shaped foliage and ease of care.",
      characteristics: <String>[
        "Weted",
        "Low Light",
        "25 x 50 cm",
        "11-18 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_chinese_money-removebg-preview.png",
        "$baseUrl/plant_chinese_money.png",
      ],
    ),
    Plant(
      name: "Snake Plant",
      alias: "Dracaena Trifasciata",
      price: 32,
      about:
          "Dracaena trifasciata, or snake plant, is an evergreen ornamental houseplant with long sword-like variegated green and yellow leaves.",
      characteristics: <String>[
        "Drained",
        "Normal Light",
        "30 x 60 cm",
        "13-25 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_dracaena_trifasciata-removebg-preview.png",
        "$baseUrl/plant_dracaena_trifasciata.jpg",
      ],
    ),
    Plant(
      name: "Fiddle-Leaf Fig Plant",
      alias: "Kimunding",
      price: 40,
      about:
          "Also called Ficus lyrata, gives off a simplistic & modern plant design that pairs nicely with neutral colors and trendy interior decorations.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "45 x 75 cm",
        "18-27 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_ficus_lyrata-removebg-preview.png",
        "$baseUrl/plant_ficus_lyrata.jpg",
      ],
    ),
    Plant(
      name: "Fishbone Cactus Plant",
      alias: "Disocactus Anguliger",
      price: 75,
      about:
          "This tropical, epiphytic cactus is native to Mexico, and is perfect for those cactus lovers that don't have the right conditions to keep the typical desert cacti alive.",
      characteristics: <String>[
        "Moistened",
        "Low Light",
        "30 x 60 cm",
        "13-32 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_fishbone_cactus-removebg-preview.png",
        "$baseUrl/plant_fishbone_cactus.png",
      ],
    ),
    Plant(
      name: "Leyland Cypress Plant",
      alias: "Pohon Cemara Leyland",
      price: 65,
      about:
          "Flat stems of feathery, blue-green foliage and ornamental combine to make Leyland cypress an appealing choice for medium to large landscapes.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "80 x 200 cm",
        "10-20 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_leyland_cypress-removebg-preview.png",
        "$baseUrl/plant_leyland_cypress.jpg",
      ],
    ),
    Plant(
      name: "Swiss Cheese Plant Asiap",
      alias: "Ceriman",
      price: 56,
      about:
          "Monstera deliciosa are species of evergreen tropical vines and shrubs that are native to Central America. They are famous for their natural leaf-holes, which has led to the rise of their nickname, Swiss Cheese Plant.",
      characteristics: <String>[
        "Weted",
        "Low Light",
        "40 x 60 cm",
        "15-24 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_monstera_deliciosa-removebg-preview.png",
        "$baseUrl/plant_monstera_deliciosa.png",
      ],
    ),
    Plant(
      name: "Flapjack Paddle Plant",
      alias: "Kalanchoe Thyrsiflora",
      price: 25,
      about:
          "Flapjack paddle plant (Kalanchoe thyrsiflora), this succulent kalanchoe plant has with thick, rounded, paddle-shaped leaves.",
      characteristics: <String>[
        "Moistened",
        "Normal Light",
        "28 x 40 cm",
        "18-27 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_paddle_removebg-preview.png",
        "$baseUrl/plant_paddle.jpg",
      ],
    ),
    Plant(
      name: "Spider Plant",
      alias: "Chlorophytum Comosum",
      price: 39,
      about:
          "The spider plant is considered one of the most adaptable of houseplants and the easiest to grow. This plant can grow in a wide range of conditions and suffers from few problems.",
      characteristics: <String>[
        "Drained",
        "Normal Light",
        "60 x 90 cm",
        "18-25 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_spider-removebg-preview.png",
        "$baseUrl/plant_spider.png",
      ],
    ),
    Plant(
      name: "Bunny Ear Cactus Plant",
      alias: "Opuntia Microdasys",
      price: 99,
      about:
          "The bunny ear cactus (Opuntia microdasys) is a popular houseplant that is not only attractive but is also low-maintenance.",
      characteristics: <String>[
        "Drained",
        "Full Light",
        "30 x 60 cm",
        "18-40 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_red_hat_bunny_cactus-removebg-preview.png",
        "$baseUrl/plant_red_hat_bunny_cactus.jpg",
      ],
    ),
    Plant(
      name: "Velvet Calathea Plant",
      alias: "Opuntia Microdasys",
      price: 99,
      about:
          "The most tactile of houseplants, the leaves do really feel like the softest velvet. Not as bright as a lot of this family the leaves are a rich green on the top and a dark burgundy underneath for the purple varietal.",
      characteristics: <String>[
        "Drained",
        "Normal Light",
        "50 x 75 cm",
        "18-37 °c",
      ],
      imgUrls: <String>[
        "$baseUrl/plant_velvet_calathea-removebg-preview.png",
        "$baseUrl/plant_velvet_calathea.jpg",
      ],
    ),
  ];
}

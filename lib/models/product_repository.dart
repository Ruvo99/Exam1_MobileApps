import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

enum ProductType { BEBIDAS, GRANO, POSTRES }

class ProductRepository {
  static List<dynamic> loadProducts(ProductType prodType) {
    // ----------------------              ----------------------------//
    // ----------------------       Tazas      ----------------------------//
    // ----------------------              ----------------------------//

    if (prodType == ProductType.POSTRES) {
      return <ProductDessert>[
        ProductDessert(
          productTitle: "Pastel de Chocolate",
          productDescription:
              "Delicioso pastel de chocolate con betún sabor chocolate ",
          productImage:
              "https://lh3.googleusercontent.com/proxy/azLpX9gvywvQIi_6lSoNQ0_CMxHfAzxgqK1H9Qkq_PodorLQD9RyHtFXUTgi0hnrw0U_H6yAF0MuZ33K03auzf80lcF2LiDcdiBJtuccsWyq16Pgk4DFZKZeyxRROV-reY3kI-YSSOFLFN1hu50kT7SKWYIKp0escw",
          productStyle: ProductStyle.REBANADA,
          productAmount: 0,
          productLiked: false,
        ),
        ProductDessert(
          productTitle: "Pastel de tres leches",
          productDescription: "Delicioso pastel tradicional de tres leches ",
          productImage:
              "https://www.casadelcafe.com.ni/wp-content/uploads/2018/02/tres-leches-1.png",
          productStyle: ProductStyle.REBANADA,
          productAmount: 0,
          productLiked: false,
        ),
        ProductDessert(
          productTitle: "Tiramisú",
          productDescription:
              "El tiramisú (del italiano tiramisù) es un pastel frío que se monta en capas.",
          productImage:
              "https://freepikpsd.com/wp-content/uploads/2019/10/tiramisu-png-1.png",
          productStyle: ProductStyle.REBANADA,
          productAmount: 0,
          productLiked: false,
        ),
        ProductDessert(
          productTitle: "Flan",
          productDescription:
              "El flan es un delicioso postre que se prepara con huevos enteros, leche y azúcar.",
          productImage:
              "https://static.wixstatic.com/media/01d7e2_fcd8abc10d94492692239832c862d94d~mv2.png/v1/fill/w_560,h_320,al_c,q_85,usm_0.66_1.00_0.01/Flan.webp",
          productStyle: ProductStyle.REBANADA,
          productAmount: 0,
          productLiked: false,
        ),
        ProductDessert(
          productTitle: "Pastel de fresa",
          productDescription: "Pastel sabor fresa endulzado con splenda.",
          productImage:
              "https://www.lazarza.com.mx/admin/img/productos/interna/interna_1576265055.png",
          productStyle: ProductStyle.REBANADA,
          productAmount: 0,
          productLiked: false,
        )
      ];
    }

    // ----------------------              ----------------------------//
    // ----------------------       Granos      ----------------------------//
    // ----------------------              ----------------------------//
    if (prodType == ProductType.GRANO)
      return <ProductGrains>[
        ProductGrains(
          productTitle: "Lavazza",
          productDescription: "Endulzado con aromas florales.",
          productImage:
              "https://www.lavazza.it/content/dam/lavazza/products/caffe/macinato/moka/qualitaoro/new_render/tin_250_en/Tin-oro-en-250-thumb.png",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
          productLiked: false,
        ),
        ProductGrains(
          productTitle: "Guilis",
          productDescription: "La mezcla de cinco orígenes diferentes.",
          productImage:
              "https://www.cafesguilis.com/wp-content/uploads/2018/08/mezcla_especial_1Kg.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
          productLiked: false,
        ),
        ProductGrains(
          productTitle: "Illy",
          productDescription:
              "Con toque de chocolate, miel, caramelo y un cierto amargor. ",
          productImage:
              "https://http2.mlstatic.com/illy-cafe-en-grano-etiopia-arabica-seleccion-de-un-solo-or-D_NQ_NP_987783-MLM31233980209_062019-F.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
          productLiked: false,
        ),
        ProductGrains(
          productTitle: "Sanani",
          productDescription:
              "Tiene un muy buen sabor intenso y con fuerte acidez.",
          productImage:
              "https://http2.mlstatic.com/cafe-tostado-en-granos-1kg-origen-colombia-maquinas-express-D_NQ_NP_947249-MLA31115265526_062019-Q.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
          productLiked: false,
        ),
        ProductGrains(
          productTitle: "La Mexicana",
          productDescription:
              "Es un café único por la manera en la que están tostados sus granos.",
          productImage:
              "https://www.lamexicana.es/404-large_default/cafe-1890-mezcla-suave.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
          productLiked: false,
        ),
      ];
    // ----------------------              ----------------------------//
    // ----------------------       Bebida caliente      ----------------------------//
    // ----------------------              ----------------------------//
    if (prodType == ProductType.BEBIDAS)
      return <ProductHotDrinks>[
        ProductHotDrinks(
          productTitle: "Ristretto",
          productDescription: "Expresso con una proporción menor de agua.",
          productImage:
              "https://ineedcoffee.com/wp-content/uploads/2007/09/IMG_9259.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Americano",
          productDescription:
              "Derivado del espresso, con mayor cantidad de agua.",
          productImage:
              "https://cafe.omcns.com/wp-content/uploads/2018/08/Americano-2.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Expresso",
          productDescription:
              "Uno de los tipos de café más básicos y sencillos.",
          productImage:
              "https://cdn.cnn.com/cnnnext/dam/assets/200120171537-espresso-machine-stock-large-169.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Lungo",
          productDescription:
              "Aquí es directamente la infusión la que se produce en mayor cantidad.",
          productImage:
              "https://coffeegearx.com/wp-content/uploads/2019/08/What-Does-a-Lungo-Taste-Like.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Café bombón",
          productDescription:
              "Se sustituye la leche normal por la leche condensada.",
          productImage: "https://ua.all.biz/img/ua/catalog/4944889.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Mocca",
          productDescription:
              "Además de leche y café se emplea Mocolate o cacao.",
          productImage:
              "https://www.juanvaldezcafe.com/sites/default/files/mocca_grande.png",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Café con leche",
          productDescription: "Incorporación de leche al café.",
          productImage:
              "https://www.goodfood.com.au/content/dam/images/3/f/6/p/i/image.related.articleLeadwide.620x349.3f2ru.png/1411331099390.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Café vienés",
          productDescription: "Se acompaña en vez de leche con crema o nata.",
          productImage:
              "https://www.hogarmania.com/archivos/201105/vienes-xl-668x400x80xX.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Macchiato",
          productDescription: "Expresso con una ligera cantidad de leche.",
          productImage:
              "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Macchiato.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Cappuccino",
          productDescription: "Un tercio de café y el resto leche.",
          productImage:
              "https://www.perfectdailygrind.com/wp-content/uploads/2019/02/cappuccino-1.png",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
        ProductHotDrinks(
          productTitle: "Azteca",
          productDescription:
              "Además de café, hielo y leche una o más bolas de helado.",
          productImage:
              "https://www.gastronomiavasca.net/uploads/image/file/6838/w700_caf__azteca.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
          productLiked: false,
        ),
      ];
    return List(); // otherwise empty list
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hant', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HantText = '',
    String? zh_HansText = '',
  }) =>
      [enText, zh_HantText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'miv2ce0h': {
      'en': '\nIntroducing a festive collaboration with \nSuna Fujita',
      'zh_Hans': '推出节日合作\n藤田沙奈',
      'zh_Hant': '推出節慶合作\n藤田沙奈',
    },
    'gry3y3jj': {
      'en': '          SS24 \nPRECOLLECTION',
      'zh_Hans': 'SS24\n预收',
      'zh_Hant': 'SS24\n預收',
    },
    'ih4wrc3i': {
      'en': 'Women',
      'zh_Hans': '女性',
      'zh_Hant': '女性',
    },
    'iusf9swj': {
      'en': 'Men',
      'zh_Hans': '男士',
      'zh_Hant': '男士',
    },
    'yyyisxnl': {
      'en': 'Discover the collection',
      'zh_Hans': '探索该系列',
      'zh_Hant': '探索該系列',
    },
    'po6jc7vz': {
      'en': 'Characterful additions',
      'zh_Hans': '特色添加',
      'zh_Hant': '特色添加',
    },
    'jcl14gxr': {
      'en':
          'Japanese ceramic studio Suna Fujita animates \n  SS24 precollection ready-to-wear, bags, and \n     accessories, alongside the new  season’s \n    statement pieces and everyday essentials.',
      'zh_Hans':
          '日本陶瓷工作室 Suna Fujita 制作动画\n  SS24 早春系列成衣、包袋和\n     配饰，以及新一季的\n    个性单品和日常必需品。',
      'zh_Hant':
          '日本陶瓷工作室 Suna Fujita 製作動畫\n  SS24 早春系列成衣、包包和\n     配件，以及新一季的\n    個性單品和日常必需品。',
    },
    '1q7jxt7r': {
      'en': 'Bags',
      'zh_Hans': '包',
      'zh_Hant': '包包',
    },
    'nj2u9qm4': {
      'en': 'Womenswear',
      'zh_Hans': '女装',
      'zh_Hant': '女裝',
    },
    'zdzo3tau': {
      'en': 'Shoes',
      'zh_Hans': '鞋',
      'zh_Hant': '鞋',
    },
    'vyq2p32a': {
      'en': '\nThe LOEWE gift guide is here',
      'zh_Hans': 'LOEWE罗意威礼品指南就在这里',
      'zh_Hant': 'LOEWE羅意威禮物指南就在這裡',
    },
    'rp2oxkeg': {
      'en': 'Holidays 2023',
      'zh_Hans': '2023 年假期',
      'zh_Hant': '2023 年假期',
    },
    'yx6i012s': {
      'en': 'Gifting selection',
      'zh_Hans': '你好世界',
      'zh_Hant': '你好世界',
    },
    'rxr2t53v': {
      'en': 'Gifts for her',
      'zh_Hans': '你好世界',
      'zh_Hant': '你好世界',
    },
    'iky79e2g': {
      'en': 'Gifts for him',
      'zh_Hans': '你好世界',
      'zh_Hant': '你好世界',
    },
    'guyv65es': {
      'en': 'Gift a little something great',
      'zh_Hans': '赠送一些很棒的东西',
      'zh_Hant': '贈送一些很棒的東西',
    },
    'h8fp95yu': {
      'en':
          'Small-scale gifts and stocking fillers, from handcrafted\n                           wallets to playful charms.',
      'zh_Hans': '手工制作的小型礼品和圣诞袜填充物\n                           钱包到俏皮的魅力。',
      'zh_Hant': '手工製作的小型禮品和聖誕襪填充物\n                           皮夾到俏皮的魅力。',
    },
    'gyu5if7c': {
      'en': 'Explore the \n  selection',
      'zh_Hans': '探索\n  选择',
      'zh_Hant': '探索\n  選擇',
    },
    'w84138eu': {
      'en': 'Small leather\n      goods',
      'zh_Hans': '小皮革\n      商品',
      'zh_Hant': '小皮革\n      商品',
    },
    'x8e9bfxv': {
      'en': 'Accessories\n',
      'zh_Hans': '配件',
      'zh_Hant': '配件',
    },
    'chozok0h': {
      'en': 'Explore all',
      'zh_Hans': '探索全部',
      'zh_Hant': '探索全部',
    },
    '7peo3gvi': {
      'en': 'Holiday packaging',
      'zh_Hans': '节日包装',
      'zh_Hant': '節日包裝',
    },
    'ynbtg5iu': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    'e92tar97': {
      'en': 'Heliday services',
      'zh_Hans': '假日服务',
      'zh_Hant': '假日服務',
    },
    'xczvbc4n': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    '54pevovn': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    'ow93ybc8': {
      'en':
          'Receive first access to the very best of LOEWE\nproducts, inspiration and services. ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    'k5g2ccwm': {
      'en': 'See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    '4unnghm4': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    'ordgjwqy': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    'aghki8x8': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    'bbrs7ryp': {
      'en': 'Prefer not to say*',
      'zh_Hans': '宁愿不说*',
      'zh_Hant': '寧願不說*',
    },
    'irrktf3z': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    'st0e0gd7': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    'i7y25pkh': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    'b66qsbh5': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    'bj6js186': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    'fehc3ihm': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'tyisgyzb': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    'a61h8h91': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    '6e1wfpil': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    '58m45ja4': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    '0txlqh1l': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    '22csaodn': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    'y8xjp97r': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    '8y9v9qg6': {
      'en': ' Hong Kong SAR ',
      'zh_Hans': '香港特别行政区',
      'zh_Hant': '香港特別行政區',
    },
    'bztmrqy1': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    'd6s2cy26': {
      'en': ' English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'qs6a3yz1': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    'd8we7zvm': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    '47khjwmz': {
      'en': 'Twitter',
      'zh_Hans': '推特',
      'zh_Hant': '推特',
    },
    'e7jr8wlu': {
      'en': 'YouTube',
      'zh_Hans': 'YouTube',
      'zh_Hant': 'Youtube',
    },
    'm7trscl1': {
      'en': 'Pinterest',
      'zh_Hans': '兴趣',
      'zh_Hant': '興趣',
    },
    'me407g5i': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ymisc4cy': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2jbjh4w5': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '33nygf0x': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'i8eou9zg': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zftmvnpx': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'iz59nbcl': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9icqvwur': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tso5357a': {
      'en': 'Shipping to United Kingdom-English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ey5twy59': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tuxv6sm7': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ljj9fj6h': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'yny4j2pk': {
      'en': 'Freen shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '39ax0s7z': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'psp21b6w': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // HoildayPackaging
  {
    '6p182xty': {
      'en': 'Holiday packaging',
      'zh_Hans': '节日包装',
      'zh_Hant': '節日包裝',
    },
    'n8zos9db': {
      'en':
          'A menagerie of animals and plants by Japanese ceramic \n     studio Suna Fujita animate our festive packaging, \n   creating playful moments across boxes, bags, tissue \n   paper, ribbons, and paper tags for in-store purchases \n                             and loewe.com orders.',
      'zh_Hans':
          '日本陶瓷打造的动植物动物园\n     工作室 Suna Fujita 为我们的节日包装设计了动画，\n   在盒子、袋子、纸巾上创造有趣的时刻\n   用于店内购买的纸张、丝带和纸质标签\n                             和 loewe.com 订单。',
      'zh_Hant':
          '日本陶瓷打造的動植物動物園\n     工作室 Suna Fujita 為我們的節日包裝設計了動畫，\n   在盒子、袋子、紙巾上創造有趣的時刻\n   用於店內購買的紙張、緞帶和紙質標籤\n                             和 loewe.com 訂單。',
    },
    'h6d2hpn9': {
      'en': 'Download LOEWE x Suna Fujita wallpaper',
      'zh_Hans': '下载LOEWE x 藤田沙奈壁纸',
      'zh_Hant': '下載LOEWE x 藤田沙奈壁紙',
    },
    'uj7blghj': {
      'en': 'Holiday services',
      'zh_Hans': '假期服务',
      'zh_Hant': '假期服務',
    },
    'fgw907mv': {
      'en':
          'Discover a range of seasonal services and\ninformation designed to help you find the \n     perfect gifts and make your holiday \n      shopping experience as smooth as \n                              possible. ',
      'zh_Hans':
          '探索一系列季节性服务和\n旨在帮助您找到的信息\n     完美的礼物，让您的假期更加美好\n      购物体验如\n                              可能的。',
      'zh_Hant':
          '探索一系列季節性服務和\n旨在幫助您找到的信息\n     完美的禮物，讓您的假期更加美好\n      購物體驗如\n                              可能的。',
    },
    'ip7vt3w7': {
      'en': 'Last delivery day',
      'zh_Hans': '最后交货日',
      'zh_Hant': '最後交貨日',
    },
    'ablb9d67': {
      'en':
          ' Please complete your purchase before \n15th December to receive your order in \ntime for Christmas. ',
      'zh_Hans': '请先完成您的购买\n12 月 15 日收到您的订单\n圣诞节的时间到了。',
      'zh_Hant': '請先完成您的購買\n12 月 15 日收到您的訂單\n聖誕節的時間到了。',
    },
    'uh7bzc2p': {
      'en': 'Holiday gifts',
      'zh_Hans': '节日礼物',
      'zh_Hant': '節日禮物',
    },
    'b409o7r5': {
      'en':
          'Uplifting colour, seasonal sparkle, and the timeless\nmagic of craft.',
      'zh_Hans': '令人振奋的色彩、季节性的光芒和永恒的魅力\n工艺的魔力。',
      'zh_Hant': '令人振奮的色彩、季節性的光芒和永恆的魅力\n工藝的魔力。',
    },
    'zcf9yvn9': {
      'en': 'Gifts for her',
      'zh_Hans': '给她的礼物',
      'zh_Hant': '給她的禮物',
    },
    'w8qif70t': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    'r1cirtig': {
      'en': 'Gifts for her',
      'zh_Hans': '给她的礼物',
      'zh_Hant': '給她的禮物',
    },
    'w9p1ycak': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    '8sk3ri4o': {
      'en':
          'Receive first access to the very best of LOEWE\nproducts, inspiration and services.  ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    'b8y49hoo': {
      'en': 'See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    'lcrku7as': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    'cwiuh6jz': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    '160wu5qj': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    '94c557r9': {
      'en': 'Prefer not to say*',
      'zh_Hans': '宁愿不说*',
      'zh_Hant': '寧願不說*',
    },
    'ublwjvf5': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    'ovgcklsh': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    '4s2jzpe7': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    'ia6pxanw': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    'nbcot74j': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    '1tb17eng': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'zqzaqzi4': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    'rc81wht5': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    'spba87um': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    'qlbzoy84': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    '3gmszztf': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    'x8b9fcf5': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    'yhezbnms': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    'r0vy15ow': {
      'en': ' Hong Kong SAR ',
      'zh_Hans': '香港特别行政区',
      'zh_Hant': '香港特別行政區',
    },
    'n8v9tsre': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    '79si0qxm': {
      'en': ' English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'njnafwfr': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    '9jwn6b0m': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    '8mim2228': {
      'en': 'Twitter',
      'zh_Hans': '推特',
      'zh_Hant': '推特',
    },
    'xg4x775k': {
      'en': 'YouTube',
      'zh_Hans': 'YouTube',
      'zh_Hant': 'Youtube',
    },
    '4dbctm7g': {
      'en': 'Pinterest',
      'zh_Hans': '兴趣',
      'zh_Hant': '興趣',
    },
    'sq6mumi7': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jpxf4obl': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9zznfxnp': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'h25xyw0x': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'dij4li55': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'klkif4j9': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7i8k2jnk': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3lcoeb1t': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tkq7elzy': {
      'en': 'Shipping to United Kingdom-English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qm686yhp': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5o31qvpl': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qqdvk576': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '41t12srg': {
      'en': 'Freen shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2ex0abpr': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3cu0xbld': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // HolidayServices
  {
    'y893ufsh': {
      'en': 'Holiday services',
      'zh_Hans': '假期服务',
      'zh_Hant': '假期服務',
    },
    '1wsrp9t8': {
      'en':
          'A menagerie of animals and plants by Japanese ceramic \n     studio Suna Fujita animate our festive packaging, \n   creating playful moments across boxes, bags, tissue \n   paper, ribbons, and paper tags for in-store purchases \n                             and loewe.com orders.',
      'zh_Hans':
          '日本陶瓷打造的动植物动物园\n     工作室 Suna Fujita 为我们的节日包装设计了动画，\n   在盒子、袋子、纸巾上创造有趣的时刻\n   用于店内购买的纸张、丝带和纸质标签\n                             和 loewe.com 订单。',
      'zh_Hant':
          '日本陶瓷打造的動植物動物園\n     工作室 Suna Fujita 為我們的節日包裝設計了動畫，\n   在盒子、袋子、紙巾上創造有趣的時刻\n   用於店內購買的紙張、緞帶和紙質標籤\n                             和 loewe.com 訂單。',
    },
    's9364r6i': {
      'en': 'Last delivery day',
      'zh_Hans': '最后交货日',
      'zh_Hant': '最後交貨日',
    },
    'rj7mbxkp': {
      'en':
          ' Please complete your purchase before \n15th December to receive your order in \ntime for Christmas. ',
      'zh_Hans': '请先完成您的购买\n12 月 15 日收到您的订单\n圣诞节的时间到了。',
      'zh_Hant': '請先完成您的購買\n12 月 15 日收到您的訂單\n聖誕節的時間到了。',
    },
    'b9l05kql': {
      'en': 'Holiday packaging',
      'zh_Hans': '节日包装',
      'zh_Hant': '節日包裝',
    },
    'aaxc3y5u': {
      'en':
          '\nA menagerie of animals and plants by \nJapanese ceramic studio Suna Fujita \nanimate our festive packaging, creating \nplayful moments across boxes, bags, \ntissue paper, ribbons, and paper tags for \nin-store purchases and loewe.com \norders.\n',
      'zh_Hans':
          '动物和植物的动物园\n日本陶瓷工作室Suna Fujita\n使我们的节日包装充满活力，创造\n跨越盒子、袋子的俏皮时刻，\n薄纸、丝带和纸标签\n店内购买和 loewe.com\n命令。',
      'zh_Hant':
          '動物和植物的動物園\n日本陶瓷工作室Suna Fujita\n讓我們的節日包裝充滿活力，創造\n跨越盒子、袋子的俏皮時刻，\n薄紙、緞帶和紙標籤\n店內購買和 loewe.com\n命令。',
    },
    'cqvvilk8': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    'w748fiec': {
      'en': 'Gifting ideas',
      'zh_Hans': '送礼创意',
      'zh_Hant': '送禮創意',
    },
    'kzmztndd': {
      'en':
          'A hand-chosen selection of holiday gifts, from iconic\nbags and the latest ready-to-wear.',
      'zh_Hans': '精心挑选的节日礼物，来自标志性的\n包袋和最新成衣。',
      'zh_Hant': '精心挑選的節日禮物，來自標誌性的\n包款和最新成衣。',
    },
    'mnphdzj9': {
      'en': 'Gifts for her',
      'zh_Hans': '给她的礼物',
      'zh_Hant': '給她的禮物',
    },
    'rdqmdvjj': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    '9wybwvza': {
      'en': 'Gifts for her',
      'zh_Hans': '给她的礼物',
      'zh_Hant': '給她的禮物',
    },
    'eb2h22sr': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    '3ddyfa7h': {
      'en':
          'Receive first access to the very best of LOEWE\nproducts, inspiration and services. ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    't5racxwu': {
      'en': 'See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    'lotgks70': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    'yzxp5mq1': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    '7e923qxf': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    '1co0ibj7': {
      'en': 'Prefer not to say*',
      'zh_Hans': '宁愿不说*',
      'zh_Hant': '寧願不說*',
    },
    'kn1t36tx': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    'fl1e90ih': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    'g5i2315m': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    '0k15oa44': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    '3elygmga': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    '4f704npr': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'tbtwsq4j': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    'igif39hy': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    'l4mzkw8b': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    '7dkylf8l': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    'tobq0yoi': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    'bqfvgrk1': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    'nwdahqg4': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    'ru24udv4': {
      'en': ' Hong Kong SAR ',
      'zh_Hans': '香港特别行政区',
      'zh_Hant': '香港特別行政區',
    },
    'p8p2vf3w': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    'drffpddl': {
      'en': ' English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'ibmcfvpj': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    'd20fnqpf': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    '3mji92dp': {
      'en': 'Twitter',
      'zh_Hans': '推特',
      'zh_Hant': '推特',
    },
    '2xzb619f': {
      'en': 'YouTube',
      'zh_Hans': 'YouTube',
      'zh_Hant': 'Youtube',
    },
    'ey2un5s5': {
      'en': 'Pinterest',
      'zh_Hans': '兴趣',
      'zh_Hant': '興趣',
    },
    '8jdu37ds': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'trnwsa0v': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    's2195lv3': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'f22hq2lf': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'liux7ir9': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'auiukz5m': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gtht3ecj': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'x1z2fcf0': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '25jc8ed9': {
      'en': 'Shipping to United Kingdom-English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'as0sz5dn': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9605d34d': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0wq8z15w': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5xuze87j': {
      'en': 'Freen shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'cxawik4w': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9km09u5o': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // ExploreAll
  {
    '0q3sczdh': {
      'en': 'Gift a little something great',
      'zh_Hans': '赠送一些很棒的东西',
      'zh_Hant': '贈送一些很棒的東西',
    },
    '14k68yyk': {
      'en':
          'Discover our edit of gift ideas, from design classics to\n joyful accessories to make your loved ones smile.',
      'zh_Hans': '探索我们的礼品创意精选，从经典设计到\n 令人愉悦的配饰，让您所爱的人微笑。',
      'zh_Hant': '探索我們的禮物創意精選，從經典設計到\n 令人愉悅的配件，讓您所愛的人微笑。',
    },
    '0ockx7f4': {
      'en': 'Gift a smile',
      'zh_Hans': '赠送微笑',
      'zh_Hant': '贈送微笑',
    },
    'pkjy2tax': {
      'en':
          'Charming characters and handcrafted details \ncombine in whimsical accessories and meticulously \nconstructed wallets designed with ceramics studio \nSuna Fujita.',
      'zh_Hans': '迷人的角色和手工制作的细节\n巧妙地结合异想天开的配件\n与陶瓷工作室设计的钱包\n藤田砂奈.',
      'zh_Hant': '迷人的角色和手工製作的細節\n巧妙地結合異想天開的配件\n與陶瓷工作室設計的錢包\n藤田砂奈.',
    },
    '9zf0typg': {
      'en': 'Bags',
      'zh_Hans': '包',
      'zh_Hant': '包包',
    },
    '42wwcr1w': {
      'en': 'Wallets & small leather goods',
      'zh_Hans': '钱包和小皮具',
      'zh_Hant': '錢包和小皮具',
    },
    '7haxndtb': {
      'en': 'Charms',
      'zh_Hans': '护身符',
      'zh_Hant': '護身符',
    },
    '1d1676i2': {
      'en': 'Gift  essentials',
      'zh_Hans': '送礼必备品',
      'zh_Hant': '送禮必備品',
    },
    '4jpqdklo': {
      'en':
          'Timeless and functional accessories including cosy \nscarves, beautifully crafted wallets, belts and \nsneakers with a LOEWE twist.',
      'zh_Hans': '永不过时的实用配饰，包括舒适的配饰\n围巾、制作精美的钱包、腰带和\n带有 LOEWE 风格的运动鞋。',
      'zh_Hant': '永不過時的實用配件，包括舒適的配件\n圍巾、精心製作的皮夾、皮帶和\n帶有 LOEWE 風格的運動鞋。',
    },
    '6ueqhzl0': {
      'en': 'Accessories',
      'zh_Hans': '配件',
      'zh_Hant': '配件',
    },
    'nnkmv1bf': {
      'en': 'Wallets',
      'zh_Hans': '钱包',
      'zh_Hant': '錢包',
    },
    'jtinilfr': {
      'en': 'Sneakers',
      'zh_Hans': '运动鞋',
      'zh_Hant': '運動鞋',
    },
    '6i03kevw': {
      'en': 'Gift colour',
      'zh_Hans': '礼品颜色',
      'zh_Hant': '禮品顏色',
    },
    'exeuzr79': {
      'en':
          'Spread seasonal joy with uplifting gifts in rich colour. \nChoose from handcrafted wallets, pouches and \naccessories in leather to inflated \nsunglasses and sumptuous scarves.',
      'zh_Hans': '用色彩丰富的令人振奋的礼物传播季节性的欢乐。\n选择手工制作的钱包、小袋和\n皮革配件充气\n太阳镜和华丽的围巾。',
      'zh_Hant': '用色彩豐富的令人振奮的禮物傳播季節性的歡樂。\n選擇手工製作的皮夾、小袋子和\n皮革配件充氣\n太陽眼鏡和華麗的圍巾。',
    },
    'mpm547u9': {
      'en': 'Scarves',
      'zh_Hans': '围巾',
      'zh_Hant': '圍巾',
    },
    'f9l26gwl': {
      'en': 'Accessories',
      'zh_Hans': '配件',
      'zh_Hant': '配件',
    },
    '12k0l99a': {
      'en': 'Wallets',
      'zh_Hans': '钱包',
      'zh_Hant': '錢包',
    },
    'y3kcg4kn': {
      'en': 'Gift craft and design',
      'zh_Hans': '礼品工艺与设计',
      'zh_Hant': '禮品工藝與設計',
    },
    'zz9xzgyq': {
      'en':
          'Classic and enduring designs for the home, from \ncolourful candles and blankets to indulgent \naccessories in leather.',
      'zh_Hans': '经典而持久的家居设计，来自\n色彩缤纷的蜡烛和毯子让您尽情享受\n皮革配饰。',
      'zh_Hant': '經典而持久的家居設計，來自\n色彩繽紛的蠟燭和毛毯讓您盡情享受\n皮革配件。',
    },
    '9n9jtbpt': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
    'c7cednmj': {
      'en': 'Candles',
      'zh_Hans': '蜡烛',
      'zh_Hant': '蠟燭',
    },
    'idcap01j': {
      'en': 'Gift sparkle',
      'zh_Hans': '礼物闪闪发光',
      'zh_Hant': '禮物閃閃發光',
    },
    'dldr0pvx': {
      'en':
          'Celebrate the holidays with sparkle. Gift yourself or a \nfriend glitter-embellished pumps for party nights or \ncrystal-studded sunglasses in a range of colours.',
      'zh_Hans': '用闪闪发光的方式庆祝节日。赠送自己或\nfriend 亮片装饰高跟鞋，适合派对之夜或\n多种颜色的镶水晶太阳镜。',
      'zh_Hant': '用閃閃發光的方式慶祝節日。贈送自己或\nfriend 亮片裝飾高跟鞋，適合派對之夜或\n多種顏色的鑲水晶太陽眼鏡。',
    },
    'i6hxncm5': {
      'en': 'Sunglasses',
      'zh_Hans': '太阳镜',
      'zh_Hant': '太陽眼鏡',
    },
    'm8vhflyt': {
      'en': 'Shoes',
      'zh_Hans': '鞋',
      'zh_Hant': '鞋',
    },
    'ehl7p3fz': {
      'en': 'Holiday shopping services',
      'zh_Hans': '假日购物服务',
      'zh_Hant': '假日購物服務',
    },
    '1ne8a9fy': {
      'en':
          'Find out about our holiday shopping services and \ndiscover this year’s festive packaging, featuring \nartwork by Suna Fujita.',
      'zh_Hans': '了解我们的假日购物服务以及\n探索今年的节日包装，包括\n藤田砂奈的艺术作品。',
      'zh_Hant': '了解我們的假期購物服務以及\n探索今年的節日包裝，包括\n藤田砂奈的藝術作品。',
    },
    'b3z0vfzl': {
      'en': 'Holiday packaging',
      'zh_Hans': '节日包装',
      'zh_Hant': '節日包裝',
    },
    'xm62kmqw': {
      'en': 'Explore more',
      'zh_Hans': '探索更多',
      'zh_Hant': '探索更多',
    },
    'bvbozfak': {
      'en': 'Holiday services',
      'zh_Hans': '假期服务',
      'zh_Hant': '假期服務',
    },
    'xt6igdkj': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    'a4nik9m3': {
      'en':
          'Receive first access to the very best of LOEWE\nproducts, inspiration and services. ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    'k728t1hi': {
      'en': 'See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    'shii6i2a': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    '9xxiqfm8': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    'pupyel92': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    '3h5uawd7': {
      'en': 'Prefer not to say*',
      'zh_Hans': '宁愿不说*',
      'zh_Hant': '寧願不說*',
    },
    'dcnnpg31': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    '4iseby82': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    'q6xbh39g': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    'dtxy89ej': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    'ps3ppjbs': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    'k7mwbo15': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'p9hrpo2d': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    '2pqbksc8': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    'js9ac4pq': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    'j123tzz5': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    '59d5tqf9': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    'aiqvaj5m': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    '3gbttz0f': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    'zp3g6zyg': {
      'en': ' Hong Kong SAR ',
      'zh_Hans': '香港特别行政区',
      'zh_Hant': '香港特別行政區',
    },
    'mj70b8oy': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    'sso4xe9i': {
      'en': ' English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'wzqikw6o': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    'vfcomnfx': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    'n2tsptr1': {
      'en': 'Twitter',
      'zh_Hans': '推特',
      'zh_Hant': '推特',
    },
    'iztbquie': {
      'en': 'YouTube',
      'zh_Hans': 'YouTube',
      'zh_Hant': 'Youtube',
    },
    'lkx7kmj9': {
      'en': 'Pinterest',
      'zh_Hans': '兴趣',
      'zh_Hant': '興趣',
    },
    'g8k8jtv5': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'j6azv618': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'a1dzx775': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'sppsb7rq': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '4cxczavh': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'pytyp0xb': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'blsx5ytu': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jrcsxi59': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'he3v0nj5': {
      'en': 'Shipping to United Kingdom-English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kus04g6l': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'et2pk9d5': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5inf9eng': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ugy9iv9w': {
      'en': 'Freen shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'n5njg2fo': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9o1t2e6i': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // MySelection
  {
    'sjtpkwxc': {
      'en': 'MY SELECTION',
      'zh_Hans': '我的选择',
      'zh_Hant': '我的選擇',
    },
    '8cym3hun': {
      'en': 'You have 0 items in your selection',
      'zh_Hans': '您的选择中有 0 件商品',
      'zh_Hant': '您的選擇中有 0 件商品',
    },
    'yof2wjhp': {
      'en': 'Discover our most iconic lines',
      'zh_Hans': '探索我们最具标志性的产品线',
      'zh_Hant': '探索我們最具代表性的產品線',
    },
    'ifru71yb': {
      'en': 'Find your own ideal iconic bag',
      'zh_Hans': '找到您自己理想的标志性包袋',
      'zh_Hant': '找到您自己理想的標誌性包款',
    },
    '5jtmm3l4': {
      'en': 'Puzzle Bags',
      'zh_Hans': '拼图袋',
      'zh_Hant': '拼圖袋',
    },
    'lz2a1ni7': {
      'en': 'See all Puzzle',
      'zh_Hans': '查看所有拼图',
      'zh_Hant': '看所有拼圖',
    },
    '0d1wehqc': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    'p3i3i4dk': {
      'en':
          'Receive first access to the very best of LOEWE\nproducts, inspiration and services. ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    '738q3cww': {
      'en': 'See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    'xb9bl5ay': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    'fcctfth4': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    'iat93v0q': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    '7ou4nbi1': {
      'en': 'Prefer not to say*',
      'zh_Hans': '宁愿不说*',
      'zh_Hant': '寧願不說*',
    },
    'kxjmf9os': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    'ttlmuk2o': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    'f9xgl6t2': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    'rv9pstif': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    'oef650ln': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    'l0ae3a4z': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'rh0zrdmr': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    'c08lmond': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    'xechm6iv': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    'wrrot4e9': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    'dm278eij': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    'yonca7qm': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    'iwgjr4xc': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    'y18s714m': {
      'en': ' Hong Kong SAR ',
      'zh_Hans': '香港特别行政区',
      'zh_Hant': '香港特別行政區',
    },
    '234nl9zw': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    'zne1iwux': {
      'en': ' English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'b2kk8h58': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    'fjmfkss5': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    '4tjmptwi': {
      'en': 'Twitter',
      'zh_Hans': '推特',
      'zh_Hant': '推特',
    },
    '7zr82ki6': {
      'en': 'YouTube',
      'zh_Hans': 'YouTube',
      'zh_Hant': 'Youtube',
    },
    '7jhvp8w7': {
      'en': 'Pinterest',
      'zh_Hans': '兴趣',
      'zh_Hant': '興趣',
    },
    '7aa67sl2': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    't6eazpad': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '63tkwlle': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'rg1oq79h': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ip4cu3xr': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0y5gj1hi': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7vs9qq3f': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'c2b4w8hk': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3dy3lmgh': {
      'en': 'Shipping to United Kingdom-English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2ed55jis': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'hzfurim0': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vsh49xn1': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'mgdz3o9h': {
      'en': 'Freen shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    't8g7k4oj': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'j9phpsm5': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // Deliveryestimation
  {
    'aa5591q0': {
      'en': 'Shipping lead times:',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'udcmz8ic': {
      'en': 'Europe',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tbl7ygyz': {
      'en': 'Spain (Mainland and Balearic Islands): 2-6 business days.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'a5htx74f': {
      'en':
          'Andorra, Austria, Belgium, Bulgaria, Croatia, Cyprus, Czech \nRepublic, Denmark, Estonia, Finland, Metropolitan France, \nGermany, Greece, Hungary, Ireland, Italy, Latvia, Lithuania, \nLuxembourg, Malta, Monaco, Netherlands, Norway, Poland, \nPortugal, Romania, Slovakia, Slovenia, Sweden, Switzerland, \nUnited Kingdom: 2-7 business days.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ulqc1u6k': {
      'en': 'Asia, Middle East',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '4xhvi2e4': {
      'en':
          'Bahrain, Brunei, Hong Kong SAR, India, Indonesia, Israel, \nJapan, Jordan, Kuwait, Lebanon, Macao SAR, Malaysia, Oman, \nPhilippines, Qatar, Saudi Arabia, South Korea, Singapore, \nTaiwan Region, Thailand, UAE: 2-7 business days',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'e93c4zqx': {
      'en': 'America, Oceania',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0uoau2u5': {
      'en':
          'Australia, Canada, Chile, Colombia, Mexico, New Zealand, \nPuerto Rico, United States of America: 2-7 business days',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gn7a8ffa': {
      'en': 'Africa',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5qcl7i3f': {
      'en':
          'Ivory Coast, Kenya, Mauritius, Morocco, Nigeria, Senegal, \nSouth Africa: 2-7 business days',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'z0fysu3j': {
      'en': 'Click & Collect',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '6e9kfhuo': {
      'en':
          'We offer the possibility to pick up your loewe.com order in \nthe selected store of your choice rather than have it sent as a \ndelivery. This service is always complimentary. You will \nreceive an email confirmation when your order is ready to be\ncollected from the store.  ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wy06fcgc': {
      'en': 'here.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'd1he6214': {
      'en':
          'Please visit the selected store within 15 days after this email is \nsent to collect your order.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'iban94zu': {
      'en': 'How to return',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'v5o7js6n': {
      'en':
          'Free returns are available within 14 days of your online order \ndelivery date.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kjj4l0ni': {
      'en': 'Simply enter on My Account or click ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9ad8owvs': {
      'en': 'Here.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '947szbq1': {
      'en':
          'Please note that the items must be in re-saleable condition \nand that personalised items are non-exchangeable, non-\nrefundable.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'mqp4ewpa': {
      'en': 'How to change to another size or color',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'dy3ek8nm': {
      'en':
          'You can exchange your order within 30 days of your online\npurchase at any of our retail stores worldwide.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '6fdbckfq': {
      'en':
          'Simply check for a convenient option from our list of stores \nand their opening times ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ahuykkl9': {
      'en': 'here.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '8anbkffx': {
      'en':
          'Please ensure that you bring the delivery note included with \nyour package with you to the store.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9zaji861': {
      'en': 'Sending a gift',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jbpdu7ev': {
      'en':
          'All items purchased as a gift are gift-wrapped on a \ncomplimentary basis, and include a personalised note that \nyou specify when confirming your purchase.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2y7b3n0j': {
      'en':
          'Gifts are shipped in brand-free boxing and no price is \nincluded in the delivery documentation.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7djgrucd': {
      'en':
          'Items may be exchanged in retail stores within 30 days of the \nonline purchase date.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1wjr851k': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // FreeShippingReturns
  {
    'o6ikacvp': {
      'en': 'Free shipping',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3g1bb137': {
      'en': 'How long will it take to arrive',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'mn4fobwl': {
      'en':
          'Please complete your purchase before 15th December \nto receive your order in time for Christmas.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'apfntyc5': {
      'en':
          'For shippings to Australia or New Zealand, please complete \nyour purchase before 13th December to receive your order in \ntime for Christmas.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'amk96sbz': {
      'en': '2-7 business days',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5u24axi4': {
      'en': 'Check the international shipping lead times here',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '8srhmkjl': {
      'en': 'How to return',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '57r0tzx0': {
      'en': 'Returns can be requested until the 15th of January.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'w2f8f1b4': {
      'en': 'Simply enter on My Account or click ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '946heyri': {
      'en': 'Here.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'q61oh1am': {
      'en': 'How to change to another size or color',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'sd5ypk1g': {
      'en':
          'You can exchange your order within within 30 days at our \noffline stores (except for department stores, outlets, \nwholesalers and franchises) within the same country of \npurchase.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ypk2cu20': {
      'en':
          'Simply check for a convenient option from our list of stores \nand their opening times ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wnh0z7xr': {
      'en': 'here.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '8et6jwq6': {
      'en':
          'Please ensure that you bring the delivery note included within \nyour package with you to the store.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kujbwlxk': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // ContactUs
  {
    '9608hhyc': {
      'en': 'Need help?',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'fjkij6v4': {
      'en':
          'Call us 10am - 7pm (HKT) Monday to Saturday,\nexcept public holidays in Hong Kong',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'cmyj0p9w': {
      'en': '+852 25629980',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'updepp8d': {
      'en': '2-7 business days',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'mun8i6ig': {
      'en': 'Email us ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'i6nuo2rg': {
      'en': 'clientservices@hk.loewe.com',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'cdrlx5un': {
      'en': 'OTHER REGIONS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2otm7vpo': {
      'en':
          'Call us +1 888 710 0009 toll free 10am- 7pm (EDT) Monday to \nSaturday',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'x3u6hgx6': {
      'en': '+44 2 074 991 284 10am - 7pm (GMT+1) Monday to \nSaturday',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'i6wus4re': {
      'en': 'Email us ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9yw7hinz': {
      'en': 'clientservices_eu@loewe.com',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jju2zsj9': {
      'en': 'Mssage us using the form',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'k00zfcqe': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // Search
  {
    'vfceclb4': {
      'en': '                                        Search',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ug5iearv': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'avv3nrhp': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'flmni2gc': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'hkochx49': {
      'en': 'Freen shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'k73y3aql': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wc0c1ed6': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // Miscellaneous
  {
    '5vmk5yyu': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'nz9idcy2': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xvnh83fe': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bolpkgp3': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1f069neg': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'v0jfab1c': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'a5rzanj6': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tbsp1rgq': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xnijjgnw': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3t2enj1p': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '944bcc5q': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kxnuwnje': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1iezby4e': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kwd0n5fm': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'd3k6lrxe': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tt91ml34': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'rsi7dute': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zcajz2z6': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vyha33b9': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'byhrsux9': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'fk36pxkb': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'w0s6ds1q': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'oc3b6qsf': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));

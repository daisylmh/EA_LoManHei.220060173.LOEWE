'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"version.json": "35cf0e0b3ac306e08e9d58441f92af39",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"index.html": "22a47767e4363f46f695ad6ee38103db",
"/": "22a47767e4363f46f695ad6ee38103db",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "f25e8e701660fb45e2a81ff3f43c6d5c",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "f2163b9d4e6f1ea52063f498c8878bb9",
"assets/NOTICES": "261fcd4f4467c6de9a6352f111aa5c2b",
"assets/AssetManifest.json": "050c1395c21530ac80c9a05dd246fc20",
"assets/AssetManifest.bin.json": "e3aca82e1c143ec3539d2cd3beadc2e1",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/_(1).png": "9eb88f3c35cd90d03cc1e239f56c595f",
"assets/assets/images/download-3.webp": "d7769304d812fe93c918d8723c8814b3",
"assets/assets/images/download-11.webp": "6edda97a17aef625fcbb38819967e800",
"assets/assets/images/download-1.jpg": "9db2a16f26148b20c4b69ad98240fc30",
"assets/assets/images/download_copy.png": "77a54d52ddf80f78a8a3652e824d9e91",
"assets/assets/images/download-12.webp": "85116ac31990af09dfa43798162d58c2",
"assets/assets/images/download-17.webp": "52facc64451e505bc4a743b7ba0764dd",
"assets/assets/images/download.webp": "f54b6c4068cb1eda9181d107a5d5339c",
"assets/assets/images/download-6.webp": "b6dfe74c56eb81994b5fa2d744e23b5d",
"assets/assets/images/download-9.webp": "b25988a306e21671ad6815b22b70b755",
"assets/assets/images/download-18.webp": "d2b59e0a0e3c27ad7274463d7a0c4b1d",
"assets/assets/images/Screenshot_2023-11-23_at_3.15.21_PM.png": "30d0f6a8fc0f9e9d78ae34dbd4d7dbc3",
"assets/assets/images/Screenshot_2023-11-23_at_3.09.29_PM.png": "cfb0d40852429df9b52d5b822cd54d4f",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/download-8.webp": "0ed7517e3ca58ea39239c0fd0b1356dc",
"assets/assets/images/Screenshot_2023-11-23_at_3.12.30_PM.png": "84fb3e87735f7fb1626415188612a92f",
"assets/assets/images/download.png": "a7921d67f98ff38f99e05d160230a990",
"assets/assets/images/download-15.webp": "477e19c4ffbdf10be10cdb21de9ca151",
"assets/assets/images/download-2.jpg": "98ddb8fa26961fe8aca1d51063308d23",
"assets/assets/images/download-10.webp": "8a559b9384339a983ed161084fa7dc6f",
"assets/assets/images/download-13.webp": "dc7ca8f3272873139c758ba363dc5c1f",
"assets/assets/images/Screenshot_2023-11-23_at_3.12.17_PM.png": "feb746e4898123e26fbdff7dd2fdde46",
"assets/assets/images/download-2.webp": "783d73db9d9904c9367c89b7d8d89fab",
"assets/assets/images/download.jpg": "409d99ad3fcb54fd2bf9ddb36a86da38",
"assets/assets/images/download-3.jpg": "0f518529b0aa01bd350998c2e046fbf8",
"assets/assets/images/Screenshot_2023-11-23_at_3.12.47_PM.png": "361acec190491cbd03584892f322d0b6",
"assets/assets/images/download-5.webp": "7703e5f27800cee9f7c359c0475c113c",
"assets/assets/images/download-14.webp": "5a9b0ea3cf958f7f603ec3ecc055dd3c",
"assets/assets/images/download-4.webp": "204067de4d79b78d3f7cbb70e6cc7985",
"assets/assets/images/XMAS2023-SS24_SUNA-FUJITA_CRM_WALLPAPERS_2250x30002_ok.webp": "70b42f904f0dd17b6235d749aa777b88",
"assets/assets/images/LOEWE_SS24_PRECO_GIFTING_RTW_RGB_CROPPED_2880x1620_10.webp": "6634f53e4f2dbfd10c06d389862ba37b",
"assets/assets/images/download-1.webp": "3fd0ca1c093eae381db79aeae64fdc56",
"assets/assets/images/download-16.webp": "420ff58566f09c0198152d6992366fd7",
"assets/assets/images/download-7.webp": "06a956d5818c2062b3e9bf4b71a6f17e",
"assets/assets/images/HP_Services_Footer_Windows_3000x2250.webp": "7c6889ed3e8b8f5b11a1436e3a0ff23e",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/AssetManifest.bin": "7daaec7ec994b4516e8f497cfbdfef9c",
"assets/fonts/MaterialIcons-Regular.otf": "9590f6690eb72afc419771366a764fb3",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"main.dart.js": "090a26b51bc761b2c22a3647526db306"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

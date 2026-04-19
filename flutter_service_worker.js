'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "4c15b4ad091a732ba5fa10fed0511425",
"version.json": "19d57a8c3bc70c69f0d9f966afd2c94b",
"index.html": "504643a8e102dac212d2759aa39d455f",
"/": "504643a8e102dac212d2759aa39d455f",
"main.dart.js": "3986a21f3601c004b4d508b624aa1465",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "f4eaeeeabe842ae198d702553def1a2c",
".git/config": "d62fb8655a9d05e7b812fd583267327a",
".git/objects/66/889b5a4ce77821bc775ecdfc29c2b675851654": "eea3dc9ae2feb19f337f6d4175255fec",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/93/84eff9b9448078cbf136ca92a09bd3d2b52a64": "9e254862d3d18987ad8ce1b22509202c",
".git/objects/94/d259e2e190435cd5030719870c0803890c32bb": "08307d083e39b6544a11fc34a639d243",
".git/objects/34/4eda339d67b03530125a0acdffb26c8faf7184": "5b26759683877d35dd68806272c2ed6b",
".git/objects/b5/8d52b3e99104343498a96b246e51221d90088e": "0691b55596ffc3f09731412ed6a52655",
".git/objects/d9/1ab06be8da1c24de5c358d18d0139ef942ed95": "8412aeb1eef204792334dd8cdcb774aa",
".git/objects/ad/85c0718a49001f914b8df23f11e1d274d3bf28": "2ba66fbb1ff8f804569fb2617b08e7d3",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/e2/14d686f4ec77a98d1054150d639c44114a1f77": "573d34a82af279609086988dfa4a9be3",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c7/98cd31728013cab0935a9c49b832dcad63fd3f": "0aa2baac67898c19e443b29c2b55175e",
".git/objects/ee/dee3fb0565c1915841a5e79a0c31d9376db3e8": "f8bae0a0109caf23c61623f67a3543db",
".git/objects/ee/0e319c5539dbb17d9167d3b7194b5e1a963b42": "b8904b0dc33f998f23b01fa587059178",
".git/objects/c9/b649b73c52a0a47e02bbeae980721498fd52d5": "18226f195d2a121cd7a747a2edf4c1a8",
".git/objects/fc/94ff9d2a626c05e8ecb1e5c91950eff91f335c": "3c7de30f2eb55801afa236bfcee0b2e7",
".git/objects/fc/5d3dd3e813eda3b1167244a990a6e9106db2ae": "9b25e8902c26f3a5ae620f22174c13e5",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/c8/bd43121df42d6d03a50f743d4674833b45eab5": "d7079818b7afffefc7a7a53ff5e30c21",
".git/objects/ed/478860638051d0c4b104ffeafca4019829c914": "6bad8c68f7262bb79e38e84de1ac32a2",
".git/objects/27/d197f2194501c46848042ce4f0feae7df8832b": "86a569dbfe33cabc2a394cbbf97725bd",
".git/objects/4b/9119dfee260787a9ca8b2c8f22b03a61629aa4": "d3677d51d68893827d287e1a53ca0314",
".git/objects/7c/b2bee9a440759492aa6f2751a6e71418a3bada": "fe05deba309404135852613c9aa668f6",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/8a/0a9d5cc58914162b23d807e11e20e4fcd9fb37": "c2353e01615473fe46c87e93585221c9",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/4c/7e6727aa496e1db7fade62e6d2374a1f89d604": "e06633bec56edbc9cdfb620d728cb5a6",
".git/objects/2f/f0a9b41e1ffcdda46c81b50a4c7a48bd7c8654": "07384bbffbb0fa4d2c4ad20d28502fd0",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/9f/9574c2f1b657965ed9a7a2a3481ff96f215db9": "1e92c5f1d71bd701b9f43dbf520d4730",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/00/f61e9ef4d08d1482ea547fd3cfe4cd79ed2f8d": "2e2f1d5611e463a6a74f3215a9a848c9",
".git/objects/00/a3066763dfaa2ed0b8e8e2a7f6440d768f0006": "259ae2b5a822a90ac6368ad4ac3efb5d",
".git/objects/6e/952fe96208226907c74dfe2b92504dda73bcea": "e8b127e910c25fe271ad896aa9cb5256",
".git/objects/09/1122828bac8796a0cc242754b4b30fe441c8c6": "617eae33c70071a575a91a36bb74034d",
".git/objects/09/33a2666235b6e45cedf9ca6028b38895f274ff": "502cec6946d2baa22d2e53fc488ea9cb",
".git/objects/96/dcb124329388a359e9a3e55abd2fcebbac5531": "6d47a146115f276713629afbe6e99e4f",
".git/objects/98/11446da98951b2ea91a99caabaa97fe2663356": "3a0c7c7aae558cdf474aa6b0259eede2",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/3f/9477ec9f770f6eb7e0d7f34717b60274fd060f": "6a351520840c730f2c1095d84b6d9a55",
".git/objects/37/fcd9c581a7efce123f899c493709e522ce9292": "5b5ab2811112cc6eb0760aace22bb513",
".git/objects/01/e17c95cd253ebc74435e0fde3485eb52703cd1": "76ed11a9a896256f44773e8737f660fb",
".git/objects/39/894033df48142e598cee7e61f28e0b229b9ce6": "3696c9e1900e1fe8c24da12cb02e051d",
".git/objects/63/7e63751e29860d16c5072789b626036ca00b76": "c62526b3413f41bd820230cb3fcb1108",
".git/objects/63/c23f9402948ec3a38021127ef020ff0dcfd830": "a1c1d393022ff1f52002e85598956955",
".git/objects/63/5f669c08e0a4fc4ef02ffedd7db2804a519cd2": "271dfac5e72cc01772ff8f56c9f569a6",
".git/objects/0a/cdca51513ef6a4fcda4c57d0cb5cc3d49a1619": "a39b5b4ad71f677d4dc37f620b141acc",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/ad7878a36b029024ac64c501f7584b93330853": "72a6200838d30858bdd2414b6babfa69",
".git/objects/a7/1ba276964acb0e3f9703d85b18e273ebc253db": "6487b23451c3a0e767a1d77ebdba1d19",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/de/daced0f1ac170348f57491c4b7734e80f982ab": "26a6c0112314f54d0be4459050dd1d28",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/cc/3b5c59c5f0e354b2d9e994bab71791b557bff2": "8403a5c1bb9900ad8e463186b9964457",
".git/objects/cc/3f75b5f1c64fa60bb84608b9938d5280719fa1": "d4310e5b864d3700b37b35009dcc5c96",
".git/objects/e6/8f3fe74f866aec34bca77342268b2a99a43f7f": "5e8f8bc10378e7543384d5aaf09a18ff",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/e9/605a7de2c2f6eb70fc03877fa11d7c15ace64e": "ddc4f1238bef8dccac98ff725077073a",
".git/objects/ce/5c0c8090bf7911a69390f9fe2771c62db9ebb5": "c4febcd0c6441a545471bcb7e0dec080",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/70/a3b3cfcb1bbcce1fa85a38a9332b6e6e371706": "43de2665fcf2b07e67725a1224a61a86",
".git/objects/84/b86329c24773df654b8e953d98f25ad0877d5a": "9c296f403d900a0c7fa2bd227405be15",
".git/objects/4a/ffc543348bb75527de47fee8ad6232de606a35": "da8d7461874677f24ce0c540fcea354b",
".git/objects/85/9f518dc556d08b8396f68314a850ee1a09f511": "60b8580524de24ef2add167320c96487",
".git/objects/2b/273a0f4238e0e66641d21084f9b40e811c1cd6": "6b4dbebe53ee58cb5693e72804557893",
".git/objects/47/9a601187f874ff8036384f2c3b067f39cd4601": "1fa4efda69aaf60281b476ef61344d23",
".git/objects/47/8a16e387c7f83fa8f287490a6b3935dbf7a405": "13b7c610d00fe8eeb91df2a78272dd58",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "6678b72f7fc6b909a39ac78e0ef08a41",
".git/logs/refs/heads/gh-pages": "5540a7efa9a13e22906751b3abc923f6",
".git/logs/refs/remotes/origin/gh-pages": "7c39afb7c00a5ff4d7b24587c8924ea7",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "b86852cf6171715bae2292a6f990957c",
".git/refs/remotes/origin/gh-pages": "b86852cf6171715bae2292a6f990957c",
".git/index": "80eddaac318f298269f5c282282c7b49",
".git/COMMIT_EDITMSG": "da1d1403bcb784bcfa59366553b78140",
"assets/AssetManifest.json": "1542411dc1b2a32e1be1f8b5529689a9",
"assets/NOTICES": "c2d43e32437337f7034c9b579a1ef777",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "78271ffe1d44835f50c92dcd64d95b64",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c2d278b5a4339454e8fb0c2d8ecba952",
"assets/fonts/MaterialIcons-Regular.otf": "a64e7af651c8903ee02b2b5e75967055",
"assets/assets/images/cert-freelance-caffe.jpg": "ca25d0587bfa7d6ae4bc0da27b1b0d58",
"assets/assets/images/gdsc-certificate.jpg": "47609779ac1c72299aac31c463ea3811",
"assets/assets/images/cert-depi.jpg": "9df9be18845b4c2103297c64382b9aa0",
"assets/assets/images/cert-cls-small.jpg": "5544278ac57035737f762bf86386158b",
"assets/assets/images/cert-udemy-oop.jpg": "91d44e11f4785b9be638ba839925f223",
"assets/assets/images/cert-app-brewery.jpg": "ea340c9a644a6ee5b9cd39de4763f3ba",
"assets/assets/images/dash_characters/dash-official.png": "6f3904b90988e6dbee00b651d2c3fdb9",
"assets/assets/images/dash_characters/dash-unicorn.png": "372c02c65c74d99c786090cac51bc81c",
"assets/assets/images/dash_characters/dash-2.png": "d744440971931f937269e060e720f5a7",
"assets/assets/images/dash_characters/dash-avatar.png": "adf03c5e3c90d4e867f7116a3a331ba1",
"assets/assets/images/cert-raly.jpg": "eba8c837bcb44260989fb09b4ee9e526",
"assets/assets/images/profile.jpg": "898ec09bb613380fa8f07c8f89ea3e0a",
"assets/assets/images/cert-cls-appreciation.jpg": "5044735a27fe2d256bbd1822ccf87638",
"assets/assets/images/cert-udemy-flutter.jpg": "2aa1d3657a7d88b5a5136808be06d776",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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

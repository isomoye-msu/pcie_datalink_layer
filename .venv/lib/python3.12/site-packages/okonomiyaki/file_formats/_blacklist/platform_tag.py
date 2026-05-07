import os.path


_EGG_PLATFORM_BLACK_LIST = {
    "7z-9.20-1.egg": {
        "0c288adacaa1f4e3aa7a32cbd8fb72b1e33277e147b9326f9c7487f69971d62d":
            "win-64",
        "d5c942864c78593c23808d7445bd634eeedff869fbb891382bdc8e6b44782115":
            "win-32",
    },
    "_registry_path-1.0-2.egg": {
        "9f040cbe901c0f827e5993a8476e768c40a399d69edde567610d59a3848530aa":
            "win-64",
        "21e03dd728f91b4bd59ad80e73ada7d5c5cea6acf2a7f7e3d25a92ba9992f07c":
            "win-32",
    },
    'Bottleneck-0.6.0-2.egg': {
        '21f2d25b125716d08a67afc1b705ba41cdc35c4db47b30b75bca54d9c02e98d3':
        'win-64',
        '320b659b45401289ddb9854a8c43e93c02088381060e6f3df3d9f9ebbda7abb1':
        'win-32'
    },
    'GDAL-1.9.0-3.egg': {
        '4339aca2d63b45354f7895bdeaa398dac38daa5cb7ca5973d7eae9e3dff1acf2':
        'win-64',
        'dd4ae8f13309013c21bb3d1d4434795d8fe5fca89fa97d271ce233d9d16a21be':
        'win-32'
    },
    'Pycluster-1.50-5.egg': {
        '102b5b9257ce825b780d466012359c2bcd329d45f9afe1f3e29b1bdc63e60b01':
        'win-64',
        '349f33f6d06c22326d4510a5ca4538a1218dc153ee678efdcaa0fab371069428':
        'win-32'
    },
    'ScientificPython-2.9.0-6.egg': {
        '256408fff88d35e4288c5dddb626cded3296777576c35ec9f7d3781ced5fdb6d':
        'win-64',
        '65157420002a4cbea9f3bb8d2630607dd80ae84b576d851c10e0e7b3d6d0b62a':
        'win-32'
    },
    'Shapely-1.2.17-1.egg': {
        '7e294807a9d5b82b4f85c69ac1143c837387fe50d0780c7d157db55ccdbe908e':
        'win-64',
        '8d387c4f7b9e19cff88ac38879cd23b486940fa248a40496602e889debeaca10':
        'win-32'
    },
    'Twisted-14.0.2-1.egg': {
        'facc0c9235335a47cc07f5242eb6671586b7ad7840707eb2552db9cd994987c2':
        'rh5-32'
    },
    'basemap-1.0.6-1.egg': {
        '144c062cfd023c29756d44b958ef2e7d724e9862de9d8f3fff7ba8b433fb1ecf':
        'win-64',
        '55116979a15cd89554f78f2631d5b58e3f7110642cc370799de0a9273005a885':
        'win-32'
    },
    'basemap-1.0.6-2.egg': {
        '3271d6fe10ae1cf00f557405c9050990d3495779413fa9ff8dd1163c6d803afe':
        'win-64',
        'b67182c422fc608628de26d46c458fb3f20bb11967bf47f751e88cd6876e0990':
        'win-32'
    },
    'basemap-1.0.6-3.egg': {
        '3e0a5b14c09ec57a68f34f4094f6ed8be414cc7c62c51fef8cac6caddb05659e':
        'win-32',
        'f907b39cbba66a80ce7353cf045ebfe0e435c445e02f1cbbc5487a39153af810':
        'win-64'
    },
    'biopython-1.59-2.egg': {
        '0bf0fd738b4f05bf999d412287821f6ba9cffcae6d7bdffef2b52ca6c983b634':
        'win-64',
        'ee869e4a7b2fd067d38302343bc81d124f5bdc031807e94303dbfeeb0ce1c286':
        'win-32'
    },
    'blockcanvas-4.0.3-1.egg': {
        '94dfe203885edad187ec85912dcfeccccc28def38e6c00430ddaf7618f851f01':
        'win-32',
        'cf99e5f0d83d26284de93a043aab3a2512b8206b3c049b902f5b71f8c9744bab':
        'win-64'
    },
    'cartopy-0.11.0-1.egg': {
        'ac776a3d7639df993c999fecc8be5ad12b4eddcbab10aae0b2da463f969179f1':
        'rh5-32'
    },
    'casuarius-1.1-1.egg': {
        '48e3c85075365505a198ffaf81a9dc54e43a06f6dec4db3b139c598098e15841':
        'win-64',
        'fa818e6c6e139f7a6dddb3cf7eeb8f1a494311b15d3331b908efe708c4097668':
        'win-32'
    },
    'chaco-4.3.0-1.egg': {
        'cfacab2ec0f9c08521bb0ca358efa5d27e8a7eee0bd108ce6c54bdb00b308956':
        'win-32',
        'd41814c213b0900abdb8e0860982897090d843b77d5494a58aba42376213801d':
        'win-64'
    },
    'chaco-4.3.0-2.egg': {
        '1424bcd3480d9791fa199d8a678c00a2f0887464c81d7ff8b04a7bf569b06c4c':
        'win-64',
        '81ae0c93c996e40009bde0b5414ad98155c85d6d26daafc15e6fbc9f33a65a81':
        'win-32'
    },
    "cmake-3.0.2-1.egg": {
        "9bbe16ce22a5a6c10c270ebff4ce9e3aeef50c0378fcd9a2f6d20a57b1920605":
            "win-64",
        "647bd9ac546629915587c2ee2fcf485f0478b043692be15a9ee81ef2a10bed3e":
            "win-32",
    },
    "cmake-3.0.2-2.egg": {
        "f4208b3c6b6015e26b280461e4130ce8d9bb866e9aa1d2983e619131156d4c00":
            "win-64",
        "599912425058027e9b968a5ff343c278dc5ff00b59e96a4006ba867ca8683a45":
            "win-32",
    },
    "cmake-3.1.1-1.egg": {
        "f2cc7562a16cba76c2dddcb5ea9a19376ac32f4a28b5a96d1688c632252d8bbc":
            "win-64",
        "7b89c3b6d2878ff3be36131525a9bb616c4f54c6d71d9125cd3612a6fd403c9f":
            "win-32",
    },
    'enable-4.3.0-1.egg': {
        '618ecfb458b8eef0634b3b8ff4004854977619775a5a67242b03b2d5a8cefaa5':
        'win-64',
        '64e50950b2c932ca7114097dde82c8d9fbd921617c0dec221f319ba15feb656b':
        'win-32'
    },
    'enable-4.3.0-4.egg': {
        '1c07aa7c5eb3b9bcc8c11d7807f5e74e6ceac1852cf05bad2135076535e29767':
        'win-32',
        '81def8d449fa00cf5bb062f87ccd12dfe93206fbe87b76051e87ecabf31b39c9':
        'win-64'
    },
    'enaml-0.6.8-2.egg': {
        '25d8c76dea0a6b37fac2a69ae66218d0f4aed9a16935e61bdf763f2e79c68ca3':
        'win-32',
        'cdebb018a9d55b9d94dab16b9a57a5c46cc8ae1a63442f9a4b8e04de9617c873':
        'win-64'
    },
    'fastnumpy-1.0-5.egg': {
        '3c6b5335141d55497b92776545a7262f952a866e9a7160d85abc1884d447c060':
        'win-64',
        '4e69610159eca8565b4afa999112606aa06b599b46e758bd260fd7c9560bf04d':
        'win-32'
    },
    'faulthandler-2.3-1.egg': {
        '7920af18044e8542ccac4f5b1962f0a9c678fe6d62643a54dc872f446a6c0df1':
        'rh5-32'
    },
    'fiona-1.2.0-7.egg': {
        'f14e0fd981a30669fc0e7092f4a049cdb1a19802d82e1d9c5cc139059575e137':
        'rh5-32'
    },
    'gevent-1.0.1-2.egg': {
        '73964595ed424cfe3b59c04836d94c11da670f3728d305e22cdbba65776ed599':
        'rh5-32'
    },
    'greenlet-0.4.4-1.egg': {
        '3ddda0e0c44b3589395d852bac63150da52999c8f53a2ebd3247b825878c4efb':
        'rh5-32'
    },
    'h5py-2.1.3-2.egg': {
        'abc8a57b04aebe5a76946065d6fedc6b8a0818fc5f8ed4f44c7e07d6ea382cfc':
        'win-32',
        'e597e920e783bc2ca3ae4ebb11774017b1bcae30335beb28a4b7f2cd5fd3a996':
        'win-64'
    },
    'larry-0.6.0-3.egg': {
        '47796f568e99f452255b096cd8736d381d4b6fafb41ce9c151806fcff67e83d0':
        'win-32',
        '47bcc447f954a7cc005c4505fd0b8d49c5687c41a5c84906496d448af784bce3':
        'win-64'
    },
    'libxml2-2.7.8-3.egg': {
        '71513bc7d0b994d723bbdac303b5eee7b5ddf6c38f5a5087609ee2984226eb57':
        'win-32',
        'ce8972b55e794dbb9860f026897611e0a6fb64b6976ffd42d98726eafe1e6699':
        'win-64'
    },
    'libxslt-1.1.26-3.egg': {
        '947113b016fa76dbd4b361eb219ce9892759809d7afd6702c5a4a62e31ec4e9c':
        'win-64',
        'db2ee66ec4001427006e7fa0c8b4f6569af6b4c3fb4134124f5fc11ee17e61d7':
        'win-32'
    },
    'lxml-2.3.4-4.egg': {
        '923f6fdc70a8730c50b6416e89beadcd8c57413d63194351d238ef768c172e85':
        'win-64',
        'd9ac3b414209a668d58a97e45d0e2c428100c651a717ea8fa95e1d770805c899':
        'win-32'
    },
    'matplotlib-1.2.0-3.egg': {
        '72247a67b636b7606ce3f948b1477ed267258615e2f751701be51f6426a1985b':
        'win-32'
    },
    'matplotlib-1.2.0-4.egg': {
        '495cf1ee8b90717a568056fa11289f1003a39813f0dcc140aff4a30616f4f35a':
        'win-32',
        '9b17b4458d852357c2b2587833ad385f0b8dc32f16c64c752f4f51b4abe9b19e':
        'win-64'
    },
    'matplotlib-1.2.0-7.egg': {
        '695d422c817fb5893374e2418f7e1d87e9cc106b2237982734fbcc69b02af12e':
        'win-32',
        '8c7d4aeeb1cde758af8b09b0508d193ae07f2c8828bd2b4388be230f0aa64f5e':
        'win-64'
    },
    'matplotlib-1.4.0-3.egg': {
        '759f8d43a387357ed41de94bf0cc4e2f20248087f11cdbfa593a2f7faf759e3e':
        'rh5-32'
    },
    'mayavi-4.3.0-1.egg': {
        '97e54a1bbfcc6c8febb2cc6d3e4c80bc7c850466725c056165dec9c088d95b95':
        'win-32',
        'c326380ab72ae7868477182abc660cab49507149ced829fedb221245a7bb8f63':
        'win-64'
    },
    'mayavi-4.3.0-3.egg': {
        '1796a8f488e4907c3fb84f3d52289da6e1a4259bcc0ea4f0fadd03332ae8afc4':
        'win-32',
        '4f9a86062cb79f421dcb23e5d31c4e2211f5795360b5b847c68e88764ecb6c69':
        'win-64'
    },
    'netCDF4-1.0-4.egg': {
        '0fe24a87a404597cb90daa2af1d7f314002991e36753b7cf867de338fe92fc76':
        'win-32',
        'e3cffb3a114c87131f615591f0171c63f02f9d9e12113b56d438e7ba623ffbf1':
        'win-64'
    },
    'numexpr-2.0.1-3.egg': {
        '8710a9f7b8d2203c463ca506c2d476089ede6593bd85d88e24d0df8a9efa86b8':
        'win-64',
        'ed82c3a7c70e51f5999b16d059cc4e738b57babd76ab287d05e4bd43263fc85a':
        'win-32'
    },
    'numpy-1.6.1-5.egg': {
        '9a8c117cf2415edb2dd2ad6c8454951d9aad68c01d28069bd5041a26e7b19741':
        'win-64',
        'c027d113b5ce0ecc93407b592da0b86a730b2736fa2ddb78328616392084b14d':
        'win-32'
    },
    'numpy-1.7.1-1.egg': {
        '2fe22a121f1120bdad24eda236f05e1e4c8159e8908eb4bcdabaee6cce38fdec':
        'win-32',
        'ab759c25bd06ee88236be94dd9506473d6bdf76ae4913ec530ffcf179a762571':
        'win-64'
    },
    'pandas-0.10.0-1.egg': {
        'f7224598836dd6dc249bb67cbe14277ce636a4908c5a2d157dbd0a963122f927':
        'win-32'
    },
    'pandas-0.10.1-1.egg': {
        'c8d6771fca099604dcadd86657341c82f6ca714d1058321f7f207b1568012a27':
        'win-64'
    },
    'pandas-0.11.0-1.egg': {
        '74d9081cacbd48f53112e2f15c3c74ca77ae45bd9a424b16261139f1b88f4476':
        'win-64',
        'c31f36632f19109b542db8896102e5e50fc1e90e6edb24e8a2e0a3ec10df80ac':
        'win-32'
    },
    'pandas-0.11.0-2.egg': {
        '8cf867f2bc6e530a487ed35b890cf2e855e1b81606b3d20f2f534cda3e899339':
        'win-64',
        'b80036929a20caa13efe10b98887c37af8b4e29932d308e37fe327f717119892':
        'win-32'
    },
    'pandas-0.14.1-3.egg': {
        '5d2144fd966e4ed00442c3b4b977b520d977f4952649b0f9e4846c41e3bd4542':
        'rh5-32'
    },
    'psutil-0.7.1-1.egg': {
        '779e56014506b3f555771fa6734a26eaea1684cccf728f47d17ecdda50dd33d0':
        'win-64',
        '8362fd85147f4632a1b2b197d70bbe564c0d2f127d0d85ab68e8a2f501e16e21':
        'win-32'
    },
    'pyaudio-0.2.4-1.egg': {
        '852451563db94bf62f474a61d972ec8b49e25b070e9277fc00472073676f8438':
        'win-64'
    },
    'pyaudio-0.2.4-3.egg': {
        '9325736f017e4fb07c4d4d62f5d529604415204e4cb5041a9231470d721e71c6':
        'win-32',
        'ad13ac01167a0bf791f54f0534b06616b7e57aa5c7d4f3dba922860f5ba25827':
        'win-64'
    },
    'pyfits-3.0.6-2.egg': {
        '0c3ac145cf726844ca18d2cab414abc44f94335654c8431de4632eabf81ce64f':
        'win-64',
        '6e648a9f173a25c32d8fe8da1623563086caa689dddf10fb09c21978445b4685':
        'win-32'
    },
    'pyhdf-0.8.3-8.egg': {
        '55d164fdd23d768731d5fa8378f41b524f2f7e4b8dba293387d3cd966742e7cb':
        'win-32',
        '79735079a87459ca9bfcaa02def7e166468e71c4d64527d925102b2d305ca714':
        'win-64'
    },
    'pymc-2.2.0-2.egg': {
        '3e6946c30d6461737ae11dbf78fa9f3cfd3c1a390de37d7dec5a89c301128646':
        'win-32',
        'ef429b9cca61ee64c7461aecd1b2de63ebfe3298836630a48194d2643894c716':
        'win-64'
    },
    'pysparse-1.2.dev213-5.egg': {
        '70d1cf8d93d23f4492a7c29d2180fc9d9211f5bed6135465652890d972dce846':
        'win-64',
        '9e88e051016f4417aa3a9347669f32c2c525e7a18aab6107426a8507bafb9aff':
        'win-32'
    },
    'pytables-2.3.1-6.egg': {
        '7d1b11e59fc320a326550b0bf9157893d92717a91853e7622e327346e4a069fc':
        'win-32',
        '974a29226ddb63a301d6b5b4b51c41793582af60b83adb71e2913431124f0f67':
        'win-64'
    },
    'pyzmq-2.2.0-2.egg': {
        '270a2b82e8aef80758f4643e86f7432272c2136fa737a8f3d5304f0212bb1103':
        'win-64',
        '55658c01f8290def622870623c1ce0ea36c1c21952b0288a819d7de67841b76b':
        'win-32'
    },
    'scikit_learn-0.13.1-1.egg': {
        '6ce6f971e2be2d899cab213f0e1c7171e1203dd46a9797d1fb685cd684363608':
        'win-32',
        '756e7e8541bc5449dd84c14ff42fea45fb435bb49122d4e68ee0a0f8b3029373':
        'win-64'
    },
    'scikit_learn-0.13.1-4.egg': {
        '1c46102d4365313b0aeb872ed99d88ec07287f8e1b9dd079b12d5beb6b43900b':
        'win-32',
        '536ea6a09279751b615d98cc0cf70a2c340bc57b05dbbb32ea9d59ed03ce5344':
        'win-64'
    },
    'scikits.image-0.8.2-1.egg': {
        '80573add762f1e820e52d5b4532a3496a835e7ba7bce5ce81881bfb137cb9a8b':
        'win-32',
        'a1969aa6dfb6f77d4b41da578886f0255f75c70e75e8f20420be07221e48fc2b':
        'win-64'
    },
    'scikits.image-0.8.2-2.egg': {
        '34b0edf0e539451fd3d58642dcb0fa13ed0489dfb2b07a0407c4780a01d80aec':
        'win-32',
        '60568ed59eae2876a84caa8cf8bf5e9db5308b3e208dfc9ba2f8911e28c4873d':
        'win-64'
    },
    'scikits.timeseries-0.91.3-5.egg': {
        'bccba37308f87b691fd7a960531bee1dca751752393317484bbd9a81309aaa22':
        'win-32',
        'f9286e50288237b883c3c82d511ddb33dc46da4c0de42d7db6a6245b33f10b1a':
        'win-64'
    },
    'scimath-4.1.2-1.egg': {
        '00c5dda7a0ba62e3c73686cdc9b0e826f7dcc98ad8a4401a5fecafe061564ccc':
        'win-32',
        'bda9ead0a76ec1c7c6a1cbfd33fcd9c0b642cb317ac584bb19f794887c016ad6':
        'win-64'
    },
    'scimath-4.1.2-2.egg': {
        '03c467151ab1e20b06e36846ce8020aac890fd77ccc19cc24dbe559b1a6ae422':
        'win-64',
        '1cfdb84af2a9623ddf5f22216b3a545f6542ce3c4e02dede55a7dbe662080db4':
        'win-32'
    },
    'scipy-0.10.1-2.egg': {
        '545ab6c780637fb5d3f04e9e3acdbd88c91b5614655eef13162bea218eeb66b3':
        'win-32',
        'e103c638f2f3c43b44ce268f3f72f804e672594678e16aa31652df137e161faf':
        'win-64'
    },
    'scipy-0.10.1-3.egg': {
        '233628156f57259581069fc59679bcf0d5b7f6633b5c3237be0f77c4f01b5f52':
        'win-32',
        'aacd91443bd37ac66c95551f16585f5b2034f502182f44f28771fa13a2cd89b3':
        'win-64'
    },
    'scipy-0.11.0-1.egg': {
        '9a7c2d161d1b2e01e618b5f70804cc8ac11cc2afdf04b9540aa846d2977883df':
        'win-64',
        'b5693c52cb9776f3abd83f7468ac0ccd69a8b0a23f4488195cc6863d0138b4f5':
        'win-32'
    },
    'scipy-0.12.0-1.egg': {
        '2b202b2656e7d1c84a36adbef08df49355d5afb355729ae1699a6d9150fb131b':
        'win-64',
        '964bd6e5f3c912224b487ffa7a1878c748d5b7e09df5223ce571735947e1c5a2':
        'win-32'
    },
    'scipy-0.12.0-2.egg': {
        '2e50f0f49fa8498b50c3d669f4346db60085e35ed6ee7ade4e43cd605cf4f83a':
        'win-64',
        'f2446cec1be7a1f661810028cd32f23023e500c6eb1cda83591be3bba033d5f1':
        'win-32'
    },
    'statsmodels-0.4.3-1.egg': {
        '7fe3be519dcfb820aee1c5be21937124454c44a309e5f639a2cb37a7f3fca269':
        'win-32',
        'edda2684ca278d5a0565f07fc1b1d7aa8765cda74a5f999fa99406b9481067a3':
        'win-64'
    },
    "swig-2.0.12-1.egg": {
        "61c7e809010cb84b5c7f9a372c4e013b0ab0c0e7e5831a29f885429918849878":
            "win-32",
        "9284aca09bced708bd3636544a8fc6ea2d4e6fe8fca07f25fbea0fd5f17c424a":
            "win-64",
    },
    "swig-3.0.2-1.egg": {
        "c2aae31db93fac0b9d6987895ce817d0320dad168b3fbe296f0bc923cad7a42b":
            "win-32",
        "0991cf20ea41f5da52e2b973bdf199b85c08eaba7d5fef0bf782ae776da386d6":
            "win-64",
    },
    "tar-1.13-1.egg": {
        "4cd5870a3d003b32b55867b96321985adac3a6145ea9a4f8c8780558f8780e21":
            "win-64",
        "0f75d5c927087dc89aa0afaecd489457c9f40ea51bec595fcc5bbb8a9b3fff5b":
            "win-32"
    },
    'tornado-4.0.2-1.egg': {
        '7ffc0e8917ddfb8cbf03956a9414e05bfb75fbe2cdd42e45bc4071be91b00ccd':
        'rh5-32'
    },
    'traits-4.3.0-1.egg': {
        '1fd70a9aa51c23014bd265fce91e570588482553081e49cee6f9d6fe5b5f471d':
        'win-64',
        'fd83e3faeeb92bf976ba84311b46f54b88365b25347ed4c02447e647ec4c9c64':
        'win-32'
    },
    'traits-4.3.0-2.egg': {
        '23fbda3f51ed66b238df63aa47dc8910b0e65b4a281069a5bf3489127d1cf2d7':
        'win-64',
        '5477f694f2aac0dff55b205c9bd5d853a138b068ee109b17b9c9e03a816cf357':
        'win-32'
    },
    'wxPython-2.8.10.1-5.egg': {
        '0e9620345d5efcf7c18b518353c8072ec8db1e2c567a79c4306de0426feb3309':
        'win-64'
    },
    "xz-5.2.0-1.egg": {
        "ca5f2c417dd9f6354db3c2999edb441382ed11c7a034ade1839d1871a78ab2e8":
            "win-32",
        "a5b473426764ed83faaf9366381022f3c2a087d098ccb9873ae8826673cc4f84":
            "win-64",
    },
}


# (egg sha256) -> (epd platform string) mapping
EGG_PLATFORM_BLACK_LIST = dict(
    (checksum, platform_string)
    for egg in _EGG_PLATFORM_BLACK_LIST.values()
    for checksum, platform_string in egg.items()
)


def may_be_in_platform_blacklist(path):
    """ Returns True if the given egg path may be in the PKG INFO blacklist.
    """
    return os.path.basename(path) in _EGG_PLATFORM_BLACK_LIST

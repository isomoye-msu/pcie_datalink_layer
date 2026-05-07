import os.path


_EGG_PYTHON_TAG_BLACK_LIST = {
    'EPDDocs-1.0-1.egg': {
        '5c3ad0ca9e1bd26b8d074cf80c06380c424515e9ae6e59514470846107e60519':
        u'py27'
    },
    'EPDIndex-1.0-1.egg': {
        '2073936820da8c05da42cbb7140d5e59c175fe23cf230532701d5dfb322fb104':
        u'py27',
        'a46d8a17e56ac7dced58adec5207c46a629c1583ebcc41b4d893e9f7f3066e2d':
        u'py27'
    },
    'EPDIndex-1.1-1.egg': {
        '07d8e55d1d6930eaad0d4dc565d4320ca4d4ed8ade5c8910f3162a4e8a1c045c':
        u'py27',
        'be837ba57f50446136b60b901dfbb8c772abdf3d3f896e27ac24d34791ec913c':
        u'py27'
    },
    'EPDIndex-1.2-1.egg': {
        'd5a4f69be18c170d13bafe3850c44973900a8a0df621e1f4b9560b2b62229ce1':
        u'py27',
        'de77ce03bf8e1a03941faf98b821a755185548a601c6e3581914f300721f1228':
        u'py27'
    },
    'Examples-7.1-1.egg': {
        'c4aa67cec4ab854f57c6cbaaee5dc1ec8f867bb2563fb165f6decec6399a4e75':
        u'py27'
    },
    'Examples-7.1-2.egg': {
        '13ecc980ed6b0b1f350b94ea9836c093a8459acf634b2c59ef7fd86e3318c0ab':
        u'py27'
    },
    'Examples-7.2-1.egg': {
        '1ce34c22cca8b4dcf164b2c4fe34424ed0c7f706a9c2e9ce1801bf8a746dbffa':
        u'py27'
    },
    'Examples-7.3-1.egg': {
        'af7ccfe1198625e56f7717dba4a15c32405499772d581fc67cd86ad18017cd39':
        u'py27'
    },
    'MKL-10.2-1.egg': {
        '0e799bb5e7afd4d9e086d3af075c8c5735c9598208dc2ee92df6f29ead1a8d03':
        u'cp27',
        '3b24628bdd59cc840c81ad804404a3e9652f3bcc149e903f61074a79006afb34':
        u'cp27',
        '487525ff5dcc5b4defed9c779932acb543ec00b908bf2e3d126d8e1f2c2f28eb':
        u'cp27',
        '8ae85227cb55b539923a3ed96bd63f91314fa4d852966f44989364aab2f4b2a9':
        u'cp27',
        'a3e09f808865da630dbf4f54147768757ef81bacc1bc4c0fe6914e3d15cb46b6':
        u'cp27',
        'edaf3542bd77172e88c519097b3fc4415b32082dccb18bfb9b08c1a0357a57c8':
        u'cp27'
    },
    'MKL-10.2-2.egg': {
        '019a74518dfea53ace5a70f3f9eeb4943b8c55883eb5daeefb1343fa368f3683':
        u'cp27',
        '0207aa974b5c3e20a2e9a54caa04895ac872e55e2b2ebe8e18066db4bec3647e':
        u'cp27',
        '374631024c913ab49c08c66c0f5f099bd5e2f07c5c9f3bcb464f88a22ee10675':
        u'cp27',
        '95ef9b81d50def7e589e41c924e92e44934429ed09c84db97a4f9a9fc22062e0':
        u'cp27',
        'cfedd5ac4662befd057175092881856618bdeff2dff809da7e16944201191a26':
        u'cp27',
        'fe49a15131799f08b741f08cb5a981fd8fff316ed7a0625ab38c14bf18959428':
        u'cp27'
    },
    'MKL-10.3-1.egg': {
        '3be3e3a0b084f064c5aa6c071bdb62ab812a479ebc6d97125b0c0495707205bb':
        u'cp27',
        '55e90b84188ff41ce641aa75daf462981ab29f924fe2e4840949aa1e8235acd5':
        u'cp27',
        '963abc82efcbe96c8d0fc5fe8aa033a6dc75f910714ae6cdd597335f993d911a':
        u'cp27',
        '98cef15339d34f660dc02026c7ac81ac21152c9af6f7ab3d83813dce19748b62':
        u'cp27',
        'a3dcc301143c54326d92336c0cbf6100b5f5e4036c1dc2184a620ed228a99e52':
        u'cp27',
        'e1e956ead956b67f3f5e9dd1275cc957170c351bce973d1ad056242fe45f97e0':
        u'cp27'
    },
    'PyQt-4.10.3-1.egg': {
        '19b2e5b2c70983b1c1fab37c5d9ac3d467304c9f2020dfbe6ebffdaf30168876':
        u'cp27',
        '2bf7e5d0bdf9b2587318579f9a7da33c890f3dac2dff254cda4f4664eeb5cccd':
        u'cp27',
        '94dce45f62cdf2d412908aa5c4aa119c9959770a9e4cc3932cc427b79422053a':
        u'cp27',
        'd058ef7737bf7dfced53d71ac9c623e3849598c90cd186e1a30361a4f12df6b5':
        u'cp27',
        'db41bab7774418b9bc559d662dd9ddaef3f14e77d83019bc0ac343fe03b5a2ad':
        u'cp27',
        'dcbc45cb1531d27434aebf14c59c478fc3c1db66886e7c04509d4390f36da023':
        u'cp27'
    },
    'PyQt-4.11.0-1.egg': {
        '24dad45d259ea7742577d7ac8e40cd596fbde1930cc531f32a63373ba2145680':
        u'cp27',
        '4aab7e47d3cce7d10dfd4f93a4008160fd7f6f8f72b081e6649d5576cec0dbdc':
        u'cp27',
        '5fb2b05a562cbfe077e2ab365528651600d3e6fb8cdc679181bacd95201416c0':
        u'cp27',
        '9977b80263d520a78a71c6686313613c8ad03e5d19913231b069586a8beec4d0':
        u'cp27',
        'c3e19048a6eb876080335290a4c4e5eacc210fabaa5b9e3b328a2b3572bc1d72':
        u'cp27',
        'c400e54c4cbc265e32b510f5db8cffedab06b97478b7ad06da9bd682b921f088':
        u'cp27'
    },
    'PyQt-4.11.3-1.egg': {
        '28d19d0efcdb6caaab8d9ec388b4756fc61cb36d98b61f6a438ee7b9d37d9e4d':
        u'cp27',
        '3445764a055ca9bfc3a1478b204963eb860a70049000007ece8d51b4b3ff25e3':
        u'cp27',
        '4e4e52a25da5c88630a2ed8f9105051892b4c8d0dd62a7290c63f5f8453cb43b':
        u'cp27',
        '899cfa11f6f594d1c94f75fcf794dac921dc2ea30ee6166344917b99a618a898':
        u'cp27',
        'a3be988ed45e40ddc0c71e688f4c006e92f0621cd3cd99442b0de248ba353002':
        u'cp27'
    },
    'PyQt-4.11.4-1.egg': {
        '844c055da23a14ca4520645cabe38943b431f5b2fe5bfa94d3343a8660e16fc7':
        u'cp27',
        'cdae3af411cbdfc462e30d5ed3444a778952e46e28572bb2020d9ee519d868f3':
        u'cp27',
        'd43f74c1036c6beb01d56fc29a4d164431d2949b31be7f6588b21f58aa4c9a13':
        u'cp27',
        'd4cd87af5f059ba330c1eab969e9b2fb4c229e8a32918a053d02b6c712d42ed1':
        u'cp27'
    },
    'PyQt-4.11.4-2.egg': {
        '4b4f32f87fa328bc7b1da1d4bba86fd299a01068bf3cb4a7bac41c15288e3f1b':
        u'cp27',
        'ab59819726d68f77725c5a4b0536339aad933c878ad2d9ba017ac6fd18108414':
        u'cp27',
        'abe989adb7e3daa59da37413ef50c2921475f88752508b1693e889546034bca3':
        u'cp27',
        'b31ed0dd54ccf59fa4f77c5d6659ece6d558faf3be270b15876df757fca78e68':
        u'cp27'
    },
    'PyQt-4.11.4-3.egg': {
        '02c3e75499c1f2f0d45f4ea459d2af2f3411a2437a399807cde570b8ae9ce35a':
        u'cp27',
        '1fdb2ef39fd239ad3fa94075fe4a5310bd8b029d5c4fbfc7296a3d3ad94302ab':
        u'cp27',
        'a028154fce4ebb77fbf3125e82a7bc90e186d52696e15ce08ccd264eabab4f43':
        u'cp27',
        'deeffbf5f8c7d96560cb840d7069edcbcaa361e1ea4bf296d3a9eaea53dac522':
        u'cp27'
    },
    'PySide-1.0.3-1.egg': {
        '5af973a78c53bfa4fe843992bc86207d5c945b06f7df576e64463a743a558fb1':
        u'cp27',
        '87d3ac97c4ae6688bce24b00b536798b07065af3b1b9503d8d4e920df520f878':
        u'cp27'
    },
    'PySide-1.0.3-2.egg': {
        '09473d413142401180a7d5b9225d9078cdaa9b2cb1e9762b6ae59f2078798f3a':
        u'cp27',
        '57fd71949d50343eb90d705da225e7dff6a4139e25324a85d34c699e74962043':
        u'cp27',
        'b35e240502b35c5ef89b1578a8cd9cd067a29ea29839225928297a08888a0756':
        u'cp27',
        'becc93f4452c55e28b6c1e78529cae37e686c1b7a8adce151d319127c839e79a':
        u'cp27'
    },
    'PySide-1.0.5-1.egg': {
        '0accd2fc8652eac86b74bc49827f9d54221b27e9be28e9e76aaeb7bc86cb754c':
        u'cp27',
        '0e411b4236a3b950542d673ef8d2700c480c1112e320c76f805d57947446098e':
        u'cp27',
        '4e571d9bbb967f9fd007da459521dfda838f0414dbcc171128f579cf727e6ac4':
        u'cp27',
        'fb8f69b9c4441a7ed364907d67cafe7492bfa761b6f8d909f68cc9036911c26a':
        u'cp27'
    },
    'PySide-1.0.7-1.egg': {
        '5751220a0387b5e301cfd75b2d71c982860e06dccd9f6092d36db7561f3a4e0d':
        u'cp27',
        '73eb9897e6eccae1649d28639548ad4a53c41050452347f19c19148f37b79fd9':
        u'cp27',
        'f1fba7ab63375632c671bad09c956fd8486c2594b9ebbceda6c718524d77abc8':
        u'cp27'
    },
    'PySide-1.0.8-1.egg': {
        '9f28e28cd44d9f96cd9584c1a00796bcd1351b179a0b16e91fa936d6f34defba':
        u'cp27'
    },
    'PySide-1.0.8-2.egg': {
        'a31cdff5ed58e1372a7420b39df6905b16f4dba000a4b2806ec3801bb22f8946':
        u'cp27'
    },
    'PySide-1.0.9-1.egg': {
        '17f094b5a3b3b41b0c89318fdff9d3333abb9a2960eabcf5eb0dc9844f0c1fa1':
        u'cp27'
    },
    'PySide-1.1.0-1.egg': {
        '0e516e51f6777daea4a245a1a3a2f3678be973184e5e6bda4e1fd0de44e6166c':
        u'cp27'
    },
    'PySide-1.1.0-2.egg': {
        '2c8598830e277f8c7523e49926aeb20d0838246c7893f20cfb3d6bb1e1d6e998':
        u'cp27',
        '4cb34144dc51c469dd35607478bd4df46741815c92f4b7097afcb26f20c0ed36':
        u'cp27',
        'b6ea450c46679d5a25bc92b064a0f3802d298a936786fdfd5199dbdf702413ba':
        u'cp27',
        'e007885c53ec59aa8677df8735546e03081d00d7d267e17178286366f10e4666':
        u'cp27'
    },
    'PySide-1.1.0-3.egg': {
        '08205d8182a759d10ebedfa67fc3238a5328ba895387af48982a4f97c29eb71a':
        u'cp27',
        '557140ee925f6ad46904f8d6a2526095f92a11ccdcd373636a308146cfe1e158':
        u'cp27',
        '9474317f0e1e160169eaedaec852cc571ba3a171f56dc34b14c356ad1265dd14':
        u'cp27',
        'bbcd0f171b8349fbc4d37e50446f430052634025904373b77a00b0fdaca83a9e':
        u'cp27'
    },
    'PySide-1.2.1-1.egg': {
        '2e5872f321844aace41f2c05169a0a73050c11ccbc8acad785142cd2aa495692':
        u'cp27',
        '3d187d3e183d6a1566a0cc203cbb1884132c11f74cb3147cff4d9ff4a842c7b5':
        u'cp27',
        '51dbaadf9e6747b12d762fdec8258d114c63139585ba613bebaae8136492e904':
        u'cp27',
        '7bef58c130663c69aac13621dfd263e761571721b7d40180b5b163b0ef828057':
        u'cp27',
        'bd8ddd1b3215cd320a4cfec26321dfd87b2156aeae137bee4127f374d3ec55e1':
        u'cp27',
        'e5a074138a6c986aab1153f0c3662879113bcb5318aca52cf2fef3c5e338595c':
        u'cp27'
    },
    'PySide-1.2.1-2.egg': {
        '214bc688de2b8c9c575f43bee218a9df7ba5f6a523f11ed85c51129bb2d34493':
        u'cp27',
        '6a0e81fe942d6c4ffd6df6f4715e85dd138e972fa6867ca3af9969154e767891':
        u'cp27',
        '6da082a3ef380cc91a56ba3f74c17df25c8ae5ed02c523bf336acfe309c6d5d2':
        u'cp27',
        'a73151970de27217e4e0a6770913562122c7a5e067d75d5a7ed7364972f142ce':
        u'cp27',
        'b0454bb9cf76046c1dc58238a031b9a3dd9b30499875643c91ff9f709548b8e3':
        u'cp27',
        'c7b6a733ed095282ca6753794daa01a6b1983cf5cf50e1cfac28c5cde6f45352':
        u'cp27'
    },
    'PySide-1.2.2-1.egg': {
        '1b23628b78f7338dda536b003036bb07d6473491c044fad5850a2a54941ebb01':
        u'cp27',
        '20e947843f87264a8fcc9563637eac6fbde154476dfde893571902013ce5adc2':
        u'cp27',
        '28c32cd8f34842254d4d424486be4c20d45b6004bc824d4e0e20eaccac23b1ea':
        u'cp27',
        '37a9b16ed1cc2c4403058b28e3f889c4695c16fc16106dff4b38aa4eb53b933f':
        u'cp27',
        'a99fa29de3dce97b5152bd495ec01e7bc94a1e5c22204915ac8b25aae4d29a7c':
        u'cp27',
        'cfffdf195871eb5a42d1eb34611859b84a95f797a37a459f2ffa402041cbbb06':
        u'cp27'
    },
    'PySide-1.2.2-2.egg': {
        '01fddee703dc1e000291105cfeaa84f8f8cbaa98def03d231c40d54727a6854e':
        u'cp27',
        '1b0a1742cf0529d41c6c5f23b2df790c4ea4a83786790857863dc55b02ce696d':
        u'cp27',
        '3a4c73a9205c6566787d16affe80181de788530af552a951c5b982d32ecd81d2':
        u'cp27',
        '8045f947d12716cb134c7d8629bb7f37001defe1cbfceabd7a8a1f132ba8779f':
        u'cp27',
        '95dd7214a07f37d69184de946a588c529eda96a22b3a8e23dfdf5960a1fdd4cd':
        u'cp27'
    },
    'PythonDoc-2.7.3-1.egg': {
        '585f98d92a35efa7e0b0f0ac01eed464f94a567d3d8929a532651f9c3f66d5ec':
        u'py27',
        '6c3e31dd9ecd75959d9f0e4dc41b315c37946781678a2a2a44fe0e1e18fd1792':
        u'py27',
        'b37da6312504c069afe04dcc86e8338642a85db1802e2db253a0a2ce07309c04':
        u'py27'
    },
    'agw-0.9.1-1.egg': {
        'fd79fe6dc3c4ec6355f6f0b3dfe5710bca50e1d450d73267a4214f5786df34d1':
        u'py27'
    },
    'basemap_ld-1.0.1-1.egg': {
        '7c7a7af2aab55df7927549901b408841fda1763ad9f9f26f277fcc4dd6ba8e13':
        u'cp27'
    },
    'basemap_ld-1.0.2-1.egg': {
        'b619a0c32958cb9e197f3c85ff85a9de16f42b0eba46782ca5db5317dc1268e4':
        u'cp27'
    },
    'basemap_ld-1.0.6-1.egg': {
        '2826dfb824099e19eb3a0d6abaab0c2e3c5ed23fadb783cc4f9220eb1f728a2f':
        u'cp27',
        '4abc6715249f34f8c1b38ddad25544d93d4577cf56fd988ab8508d9e0911a2e9':
        u'cp27',
        '5e279e940ac5b8154d9d1065cdc81b02b30942a9c6a2639ab9bad378f3befb6c':
        u'cp27',
        '7158da5b7915acb733b29fbfefe1814ff657297fd3cc4887defcd733b2b23330':
        u'cp27',
        'a08ab006f9a1ba8575b593389ec8446a4e6da29b284b236f8539153dadcbbbe4':
        u'cp27',
        'b2c39720a1b088d453fe5f41e487ee7791f9a589528f025f8ba420df9da9343b':
        u'cp27'
    },
    'basemap_ld-1.0.7-1.egg': {
        '2d883c1d90474d62057d99cbc1eaa3895d4bc0b805200035a425f200113bca75':
        u'cp27',
        '3dfbc468e428c3c1d4f1d6b2e2b0c2654ae11237c73555a6c42ed86d75cf06f1':
        u'cp27',
        'ce2c2ef5ecb1744c3173d3e1b70051886da4575e038b843e7300a338553d9e57':
        u'cp27',
        'd1f3dd28ef430ff8e743ab43ddbc21458b78e7704f5054c66eef10454591ca8c':
        u'cp27',
        'dcb3b6cb4e6fe9cb114e8dc7e23e3f6b8f3461a3495fed072d031a058487cd02':
        u'cp27',
        'e9da25f66cd69f0123f914286d6d20405debc1686674a68699fc408e83265787':
        u'cp27'
    },
    'bvls-0.1-2.egg': {
        'c3c31d8a6bf0d0fe3a047abf8c8ae8907da6347d2760593b4c2ec21823905765':
        u'cp27'
    },
    'casuarius-1.0-1.egg': {
        '02a36595bab9e04d2de2adf37f45b9dd1ce14fdfa49fe6b534550fc83685a744':
        u'cp27',
        '3634bd18c47287bafec070be328010e49dfab41e4bab9dd5cb5e9b5873393506':
        u'cp27',
        '739b81415eb0c2fb9e16f01fd592a185791ad787f83abab39a15c0a464d8e968':
        u'cp27',
        '87954b84f31e3858cfca038755e3e9077b4d73a9d9f804d885f48c69fc4092ab':
        u'cp27',
        'b9d9c937662185c6dbc5763df94d951f3b142c15d10b5ad32cd5689aaaaea21d':
        u'cp27',
        'c74c3a66a3d7365d532b57e97d2c66f588b5b1d465370d1579576188d4c70db7':
        u'cp27'
    },
    'casuarius-1.0b1-1.egg': {
        '3a08a88ee5ed3692d06a4a477b9f05f58868a2e4f7557fcbb696446ff70012c0':
        u'cp27',
        '8100075bda58f03e65299be60e66e5581948fb5d5ed61129f5b57a9714705262':
        u'cp27',
        'b8fdc341fe3cf6fa5d291645dc7ceec894e4a215b6153ba21a24ad64a4633016':
        u'cp27',
        'c5b53f91a7ef83ce7dbda8d30cb28efbdad5858740d6391946c121083d9fc27a':
        u'cp27',
        'd74fe5c95e4c0515d41e0f56e41d5c6f18592257ea4d82bd0ab8845f5b0be9c0':
        u'cp27',
        'e7ef4b465da8b1dfd890474a584de268adab860f421b068520242bf149f076bf':
        u'cp27'
    },
    'casuarius-1.1-1.egg': {
        '0069cf39c0c33be46be9f0645abab052717038dbad95865fc3f60e744635df61':
        u'cp27',
        '283d0851c5e4dcf07264547a43900fe2b3d075fcb31f850ad48bdfcc38fdf535':
        u'cp27',
        '39237163bd9f112d32898eb52ed50934d015d227f7d639689d1f97dd7224e15c':
        u'cp27',
        '48e3c85075365505a198ffaf81a9dc54e43a06f6dec4db3b139c598098e15841':
        u'cp27',
        'dc48a4886f9f45ddcb944749b85e0fafed7ea1af8777561e35366050ab2e5a2f':
        u'cp27',
        'fa818e6c6e139f7a6dddb3cf7eeb8f1a494311b15d3331b908efe708c4097668':
        u'cp27'
    },
    'casuarius-1.1-2.egg': {
        '46eac136ee4f533e3b832b0519a7c8cd9f488f217ffe9b0fa848944f1f37ba30':
        u'cp27',
        '494faa2979e133956f884e0538826ca9c1fd2f6631f8c65c8f0149ccc1a41f4a':
        u'cp27',
        '679d6fb2302207285951ad9614ff9187d67e325afecdb5f624133929b538b874':
        u'cp27',
        '91497b7937e2a1ce2ae9c45dcfc0b318c1443e3ea6999717633daa2ce8374434':
        u'cp27',
        '9845d6be30ff33c8f055bf35243dc94fdebb5b0ada540b3be2c48f00eeec7a02':
        u'cp27',
        'f57ad4f6c31dd2c5d5bed0afde2de0aaa2929a791d18f4a255f35e12f296add4':
        u'cp27'
    },
    'casuarius-1.1-3.egg': {
        '17a2c4f913d2b9b1c43017f5a721b53e4a2102634f942e06eafe860464576916':
        u'cp27',
        '264428d6db5588ee81d9ec8e3822ab4f7f7e4b4b8684ee5001f72eb02e8c0e1f':
        u'cp27',
        '4dc126302309c3e89ce1219854a031f3944d000ad7beb8517f232779eefef1ae':
        u'cp27',
        '6a7e22741125e51021c15fab1ecdccf59db6d442200b9831cf478a5c48767a64':
        u'cp27',
        '918bdfe67ae7f488efceaaf4994028a99e5853a711ac96e9bbec96954175ac22':
        u'cp27',
        'eef4fe9e16dfdcbc5560ae1ca34776d63c484c3aaae9f6722cc0192fa70006de':
        u'cp27'
    },
    'cdecimal-2.3-1.egg': {
        '336a586c3aea0378291c507e13157f871e8da8fdb129bae77903cd67148d4bea':
        u'cp27',
        '4730bc55f8e1b96168c294239d503165c552797acdbc0ff099125ed88d5c2301':
        u'cp27',
        '7e9dde6b78352425c1daf62a644a3249bfb4c17e8162cafa99a08792c9c39f55':
        u'cp27',
        'a82b84e7a77afc70dc02443494f3de2a3e2c8b4052f0bfbd2d286689af592077':
        u'cp27',
        'bce4ce537972b4e5eff0974e500d4a9272c64287a686f45f48c4fbc1a3a56316':
        u'cp27',
        'd7dcfd7e8ab4bdce402e29883dad160e8fd24209af70937b1861a87ea86592ba':
        u'cp27'
    },
    'doclinks-7.1-1.egg': {
        'f2ab7822e36e43eaeff098337b5fbdcc0821b76088ff6c018162e17effce0047':
        u'py27'
    },
    'doclinks-7.1-2.egg': {
        'bb8ef13044fc1da01473c756aa37ce1951c654ac28c72e4501f96787d1877908':
        u'py27'
    },
    'doclinks-7.2-1.egg': {
        'f9938be4436cdca0ab0ba558c108631d262a7a5fbdbf05ecc88122563d9b9f61':
        u'py27'
    },
    'doclinks-7.2-2.egg': {
        'e3cda2045f3f928c07f19299e511083f2c7aa240a28285061f0fc8f6442a4fcb':
        u'py27'
    },
    'doclinks-7.3-1.egg': {
        'c998ec0d824b0a3ede8412f6c4e0cdcf59aa47a5e8174535c565d7e841b88070':
        u'py27'
    },
    'dynd_python-0.6.6-1.egg': {
        '2390e5219bcab6bbbd2e21da50e12186bacb0d05a5a5f28f2a69ff732279144c':
        u'cp27',
        '564380ec1031b0ac7561c74fa95e0b51094b7c41683b7f05caa8c9152e5bbb36':
        u'cp27',
        '70be5acc3737a923ceca3a850db7932a02364006c8f4050d6323653d6d975033':
        u'cp27',
        '7f08e64f2d6169b792de943485bb6eafe7d21598d2adfcea6651319174255750':
        u'cp27',
        '9c034a36d20c4aee7387795cc72d1473b2343c72dbf0686df669e5b5dceecd6f':
        u'cp27'
    },
    'dynd_python-0.6.6-2.egg': {
        '209e6d0fcef5e9b385766e4ea3373abe3626c2d58249a4b03ab6650872b8bece':
        u'cp27',
        '26dedef9e5022924c55159bc79ae5fdde376242664e8df13219be06335ba146e':
        u'cp27',
        '4354cba2e3e73f77ef7d232e8b02cc4261b0c009e9a2b874bbe720306503500d':
        u'cp27',
        '60d4c0100ec17dc4ba76905b2ccbdd3600db237ef22512eb86bec0c661bc0d8d':
        u'cp27',
        'b6c1a52fc97010625924496af3b3d0bb1f550bd9297bec975195ee4b3427b42d':
        u'cp27'
    },
    'dynd_python-0.6.6-3.egg': {
        '4d0a6021c7d6fd33177f788c39219db60e851afa5f437388c9536716ce8db86d':
        u'cp27',
        'a7e683f6d4e1b1b9c35112d1b1f0f7d368fd9508cedf54e16a6aa87792d8c02a':
        u'cp27',
        'bbf7206264db43c6545abcd37304eb8478bdb7bb74fe2c6ea5f34b154ca1819f':
        u'cp27',
        'f2cec59f1dd1150e180e968e1db60f7b647a376d5e446c5227d36c12b3971793':
        u'cp27'
    },
    'enstaller-4.5.0-1.egg': {
        '30667f62941dbcbdb1ac9134d2b084ce797c4e1babf0b6186db7c21114edf6f6':
        u'py27'
    },
    'enstaller-4.5.1-1.egg': {
        '028af870081650fd710fbf49a68de1114c6a342ec3df8683c861a43ad6c4ead9':
        u'py27'
    },
    'enstaller-4.5.2-1.egg': {
        '9dd05422ae5b9fdceb58963ea4b16600604e7305186ad6e85a7988e7dcb2173f':
        u'py27'
    },
    'enstaller-4.5.3-1.egg': {
        'c0cdfc2f25c6392352ba3ae6afa52bf652a75926499d01b1c141ce8de85d8325':
        u'py27'
    },
    'faulthandler-2.3-1.egg': {
        '5501a45b34bcda386011b3c424d0992c3d34d62a2157af12abef0f222846141f':
        u'cp27',
        '7920af18044e8542ccac4f5b1962f0a9c678fe6d62643a54dc872f446a6c0df1':
        u'cp27',
        'a46b86ffa0e2d4d296b6bfef696c8fdb0a90a1fa69c8260ccd85155258809e94':
        u'cp27',
        'a79bdf30cad76da1cb6647bd2ea850af01bdd2d3e0a71f054573292b30a190e4':
        u'cp27',
        'aaa7d875f35fe50e0f0f035f3d5da833847bbe11e0d0dfbef5d8e2e4fd858f9f':
        u'cp27',
        'ee42e92a46d1d0b86e85b1e0891fcc9a992fd76c9ea099609539227c5ad4d4f7':
        u'cp27'
    },
    'faulthandler-2.3-2.egg': {
        'aac925cf2b45673d19cef62da070fbeb28c334f2c0944586b257d63f477fd89b':
        u'cp27'
    },
    'faulthandler-2.4-1.egg': {
        '3a3eb1d01e53647fe85edb40a15e9daa31fd924cdbd81fe21a9288fcee4165e2':
        u'cp27',
        '7aa918ca3b22d537967992099bf16b7c50e08b82427fc9686ccd0d8949559474':
        u'cp27',
        '9f5675088f3a7cce2057dab160d97fd9e5c58ba54074f89cfa5496f125f9f225':
        u'cp27',
        'a9f7f094b6e7344034f7601c1b2155a46ebb7ce6690532201c6e73f31374ed29':
        u'cp27',
        'd5c88460d61e037d4baaed647778c6855b025aba7b780ad735443579229e6d20':
        u'cp27',
        'f5e8e47ae2ddb77ac54692fd4a5685431d733c48bcc1aafbf0a7ab48d3b35fba':
        u'cp27'
    },
    'gmpy-1.11-1.egg': {
        '119223b4dbdec9e1d557ca6de1b9bb120581d7046ec7b3576029004ef485f91d':
        u'cp27',
        '4a42ea62e44c0981515e5ab1572c3df0aeb2a2eb9f7b889b3c02138799fce7b4':
        u'cp27'
    },
    'gmpy-1.11-2.egg': {
        '4faa155e77909a4fead5b71d761b87f3963bd7c98b096264e2b70cbb687b47c7':
        u'cp27',
        'da87d23a4d21c862a6efe1cf32abc1e6d0b9c307b5308b0a2d379636b10faaf4':
        u'cp27'
    },
    'gmpy-1.11-3.egg': {
        '7c9c7c14e94688cefbd11b7c930545fd06bf345ddc3fa4eda8ef06bc248247ca':
        u'cp27',
        'a535e0de97535d0f2a1ca4a26f10ae5cfc895c8f6b7f8a08f386ba97f601d814':
        u'cp27'
    },
    'iris-1.7.3-1.egg': {
        '5721ccf153b86742cd2b63194a2285ed86d4badc0255d2022595f3b56c5015ba':
        u'cp27',
        '732e2d3c32dd07ea551a1deddd887ef9ebb66f60cfe36da1fc7e74e0269daa3f':
        u'cp27'
    },
    'iris-1.7.3-10.egg': {
        '6bbbd39fddfa9766a7e51e4e0a2b5ae2cc7aec427e8152934cc43fca5f5ca7b0':
        u'cp27',
        'affc24ad1ceb88a118914415281f0a89a5e9ae4fdb7c6730c9febb1ee105d75a':
        u'cp27'
    },
    'iris-1.7.3-2.egg': {
        '06ce9c03b01e04929414adec1c635dcee9f9ab5cd4d5732fbc91dd840002fe13':
        u'cp27',
        '39091eb0bd2be3f98d0e7f5b5e0221c364ac9f7b641efe86049ac16a75da3775':
        u'cp27'
    },
    'iris-1.7.3-3.egg': {
        '4d44620348ca6a53649a3e46a2a8750f4ef1421554816ee5d78ccfed083d4728':
        u'cp27',
        'b792a153f7ad68b69110f53919027eb7c382c8fc512b978fa9e871dd589913dc':
        u'cp27'
    },
    'iris-1.7.3-4.egg': {
        '4be55236080fe82a7a3efd369ea51ca54a83cd9c34b29a289a8d96afc6354602':
        u'cp27',
        'f42ed8fd290c7a23220e9226a6246deba4c611c31ac4326b6dccad38e9a59b27':
        u'cp27'
    },
    'iris-1.7.3-5.egg': {
        '2dc0ebbdee64c37039a0dd7be836971856fb5b4699c723f3411a207d5417b197':
        u'cp27',
        'edd9ede3a06ce7da1b8577272eabd769dd5ebb3fac647aa220e1401f039273f3':
        u'cp27'
    },
    'iris-1.7.3-6.egg': {
        'dd06d5c3dbfc3148d48df3f910db3fc57dc74de4a489cf1fb31b1e51dd0ef519':
        u'cp27',
        'e398adaec0b2103a0e7716afe9b5980216b448e72f9dc99b44d8bd322d609c75':
        u'cp27'
    },
    'iris-1.7.3-7.egg': {
        '42514406e7310b78ca19dd581a2649014411ce166232a5d2cd80a02fa980910a':
        u'cp27',
        'e9d939abe4c6229e0ba8cd6fba2d85b9cd2439daeea69ee405b1c573450ba99a':
        u'cp27'
    },
    'iris-1.7.3-8.egg': {
        '047c6d5ae296f49efcf87affcf981ed5af15632fd6e201bc6aa8977da2ca769b':
        u'cp27',
        '70b6d076c7b29b9365561d8922cac352db74400d90daae25230c2c3a202f1b0b':
        u'cp27'
    },
    'iris-1.7.3-9.egg': {
        '2b419549392ed53aa687c23abbda54cff9e9c3602029413ea76ea906feb25248':
        u'cp27',
        'c15637af0729d99a344b60c168d39f71337dd9702dc3331a272602885a5ce2fa':
        u'cp27'
    },
    'kiwisolver-0.1.2-1.egg': {
        '03ec49eea3ba16b3fc36f1cff5a2f944909b18e1b41fc84a1c47fc5b8bcac781':
        u'cp27',
        '2995c14bba8fd3334fdcd4ac470f2b48003814be6fe88d7e96597e41d8895024':
        u'cp27',
        '35ad79d7bd188f4ae01144b87520ed3e6521ebdd433b1cdb26f2dd4296b5b697':
        u'cp27',
        '4ed2416e8b71efd037f8779ef0b26e849ce85091d8d0c5ae433b405bf62e1b13':
        u'cp27',
        'f4bd6913ddeb8203d19922318dfb6c8ae271f45a4a826fe6c34dbf6e3749d22a':
        u'cp27',
        'ff0bf86e856639fa25d176b3d75cadc4d4e88a9fe421a18d7f5032ce19f00747':
        u'cp27'
    },
    'kiwisolver-0.1.3-1.egg': {
        '264e7b376004d2a788ba2877437a2d0b404b9362088f14e232ccc05b8ec9d797':
        u'cp27',
        '41270149bf314ab77dcc71530d95968c08dcfae323b14fe9845312f09336c6fe':
        u'cp27',
        '6d18c630d44a30c00114c8d4f6d6a1e729c76077d91b657e41651571f87b1c7e':
        u'cp27',
        '71a13fe69476f1d405072d060b287247b271631bd02d7cb2a4a73713bd59c461':
        u'cp27',
        'd174cb520287c5855d08e350f1a77cdd13e7e0b669d7ed41dae0d8ed49579261':
        u'cp27',
        'e3f24f1fd4cb76ac8b08888407cf807a347f99047af02495e403b526b2819bab':
        u'cp27'
    },
    'mistune-0.6-1.egg': {
        '3ba08ae199edb8ccba3ceff7321edeb3ad62aa30e7c09e900d64a538e2e50606':
        u'cp27',
        '5fe24be230edf3db97298932d81f1ce07b658bd9ee3fea68828b5abf8546a5fe':
        u'cp27',
        '6819f53877d52973907e880c6e98d3fb12f8e5566aa92d9c47691ff05771cdf3':
        u'cp27',
        '8ccd1bdd8d9c6c0b19726baf755b24811cb2bcd932d7f5aadd988a2930916113':
        u'cp27',
        '9e99a6d413fd961b2231c62a18baf59c16df7e62e427d64bca314f2710024328':
        u'cp27'
    },
    'mistune-0.6-2.egg': {
        '0c05c7504503b368299be18dee0ffedeb9e8bf832ad6c3505ea04496a25d38ce':
        u'cp27',
        '10293fc92acc04515d17ded23b9d62155238c25dde91ecdd7aff0b232d324626':
        u'cp27',
        'c4d7f8995148f201b9a476e6e7ec7583ec521e37a4d531f31a79d1f12be280af':
        u'cp27',
        'd64af4aa3cd9ef4879d6365e85b62ffc0fb47f673937379edd1e97e7fcc8f149':
        u'cp27'
    },
    'opencv-2.4.5-2.egg': {
        '0dc7d5f09a1df388f65d1599b9009c75b0881b08ff774406a234f3919121355b':
        u'cp27',
        '54d7daa2ffaf0a67eb238d1ed2d67089f756843ad5550125c4379494fbce940d':
        u'cp27',
        '66aa79c7501606fdf91cf581af528c49d01142d288a2b4e717a429a26ab18ddd':
        u'cp27',
        '678e5a7e07eb52ac14f1c6eb8df0963756f4ceb438f740b4734d74da133b12e1':
        u'cp27',
        'a6f99332fb729786e54d241adada21115d1139a0b81bff32503824f5e57ffcbc':
        u'cp27',
        'd3f8ed87ec24b1e8fdefc17e02a5920614a159f76cbeaf972bdd74cc94f8160b':
        u'cp27'
    },
    'opencv-2.4.5-3.egg': {
        '25cc3b20e7298f9da60f9678df90051947163d7855a786a18858c8d123307f63':
        u'cp27',
        '2f09ea3e4a5329d0051c47865da5a7ab6832353273ee64bd7c2e5c25168c3b2d':
        u'cp27',
        '444405769aaf3f3e3cfbf3142bf4e8d59994f54ed54e5abbcf581db28163e0aa':
        u'cp27',
        '4e9aff0873d025d4d89d228f2dc2122721768056e0f064013cf4fa0bf8d9bdc3':
        u'cp27',
        '5ba2877340c0c5f94c280d934dfb96a768de37b8540ce46af8633a61fc05f096':
        u'cp27',
        'fd2ba456773e88fb3554c767a91b8ba65d87c9dc27adf371333f630f1d5fbe9e':
        u'cp27'
    },
    'opencv-2.4.5-4.egg': {
        '05089ba4572238e627c47e2be6377d4f2948b820b8867c0b6c07f3030c1a3222':
        u'cp27',
        '1fbadb6f320d16384d2172e9aac26424295bd3fca5a66ffcb6ecc7e7303a7e35':
        u'cp27',
        '62fca6ebf46722126824cafb8e745d03e78a09c90cbd92ba6282a901e0ea237c':
        u'cp27',
        'd96a83518cf18be9cd1c8234616675cb885f683e20e49c9b1ac5d12f9c5742c3':
        u'cp27',
        'f20c1e9ddc92eb8ac113b99dae4950b013f65b706034506bb99aebbf99fbf58b':
        u'cp27',
        'fca83ab6b6badc6e427af172b7f91c617d82e09a3ae50f7badbf911ec6e5f048':
        u'cp27'
    },
    'opencv-2.4.5-5.egg': {
        '05f22507aa3e8d429b75fbf5d71a420d51e82b8015a7b59f675dbd7cee8f6481':
        u'cp27',
        '8cbbfb339bbd10e1a1a3d11951391f10aec09bad4a11bd33a7d2d1e7195f6fa5':
        u'cp27',
        'bc2d134f13da71540d041921514dbe20eb0126f65e961e8b68074ab017eefa94':
        u'cp27',
        'e0778853f93dbc0d6ec2950389a34f3858b52df7b02b3fb90180379f95ae0023':
        u'cp27',
        'e66779f41e8bb2efeaf946fb7a06cc31096dc5e9fd032911c4a0ceacb0e8ee2d':
        u'cp27',
        'f7768b473e9c2e8c419e857662cec96fd3dd6eeae93ad7b29e29a196d76c65cd':
        u'cp27'
    },
    'opencv-2.4.9-1.egg': {
        '23727cf1ceafbcad25d3953ac629d7f59744599eae8ba77d17711aedbbf96d36':
        u'cp27',
        '386513b8dca0700197179216bc215851e9ea9ef818eee596848ac061dd473760':
        u'cp27',
        '50b0825225d0e4ac2eac982166d30fccf0cd2a658255620376acfdf3c14dafd3':
        u'cp27',
        '8e9e5a643941858a80120d63a2c857ca1d90450e0e39b89aa699db3a356c7bf4':
        u'cp27',
        'b68b13970f3d8ddbaacbec31636707c18df249af2da602e0cf5f0fa9b3c41ebb':
        u'cp27',
        'c799b335755e1afd60beb3b057e017b7454406bec34f5f420a857a44ed600ad2':
        u'cp27'
    },
    'opencv-2.4.9-2.egg': {
        '8358e66b7b03fceb4870c5eca58b710314c20d6a81ca15daca8f95617163ce05':
        u'cp27',
        '9589192aa1533c363c62d8b6daed63fba8114084d5dc0a8d0fb460b6f4867233':
        u'cp27',
        'ac1c6ea32450f17713d142e5d1b67f9e7c6f2a41592df0122f35a968935f2c10':
        u'cp27',
        'e011f5e5c2d26f194a223fb487c94d8b89e43885266a89f5ad5c800692abc489':
        u'cp27',
        'ea5d66b96b9b05f7d469fcfaea3332abce4febcd116e4844dc808fdd7441abe2':
        u'cp27'
    },
    'pyaudio-0.2.4-1.egg': {
        '852451563db94bf62f474a61d972ec8b49e25b070e9277fc00472073676f8438':
        u'cp27'
    },
    'pymc-2.1b0-1.egg': {
        '500a0b775f71de051c6a46777e94df8a51360f501c94f3b34c0413eeadf9e058':
        u'cp27',
        '9f676265e28cbc2349e347c96c2ce6882a78d5307fefa958b2251fa3575c1467':
        u'cp27'
    },
    'pyodbc-2.1.8-1.egg': {
        '1c26c05f94d84b7f02d89cdbe888ec381eaebd073f5231986f331d8306fbde19':
        u'cp27',
        '6f83e17bf4726aa380ff19e6190187af936128a02fe8c3496da3e0d3428e9444':
        u'cp27',
        '74440b9d2c3ae34f0fe559d8f27bc2db1f3c5289543ef84223510ec652f2b79a':
        u'cp27',
        'da924e6414a592abbf756c98eb77372946afac0b60e323b3480a34e8c26d07f5':
        u'cp27',
        'df04beb9d7e2e6838998a8d84adbefdd5c4f0aa2fed0de2816678994759e7b05':
        u'cp27',
        'ff6698642cee8680b4f370d6026c3b6098755ca88d75197a5a41497484a6d3e5':
        u'cp27'
    },
    'pyodbc-3.0.10-1.egg': {
        '1bc5c6353b196180124c0e669f500d5f194d49a4b8c4946d75b223d4f75a4aee':
        u'cp27',
        '560ae6f5f3386918fa7370f5cd2c91dcbbe1f4760fd4ecf4a4b6af6264f21e6e':
        u'cp27',
        '5d38fd376a803751392a292d935512ee720017850c09dcbf534334f38727248a':
        u'cp27',
        '65893af781d39f2d57e9fd5a38eaa02b10599b1adf3d48f3ec0bb13df5cbf62a':
        u'cp27',
        '80d7a681d61d8a43f2c0d20a9cd5be55daa387b766388cdce67e5200fac4ce9f':
        u'cp27'
    },
    'pyodbc-3.0.6-1.egg': {
        '0327d096765dd08937421d699b007450382bc2e8c4ce473e6c6b5e7c78a02a31':
        u'cp27',
        '34c56852b0afd208ad58be9881e229bd32ee2c0b9e85de4e6b3ac2d59dfc655c':
        u'cp27',
        '49920fe8cbbb360dc49d34f11ab2b9b93d163f1c5d2eec9e5a9cc5069e4a38c9':
        u'cp27',
        '89b3cce007e9fc44407519332794dc36a3ce23d4b4ae2f20236ee5b01eda332b':
        u'cp27',
        '9cf6d4623a11938a609bd2085f234ad12db6a1b9bc39b727771f45f59fb93208':
        u'cp27',
        'd4a121f121681c1a6e8b56aedd1887324bc6848bea4d4526a40ebeb7ddc8a5ab':
        u'cp27'
    },
    'pyodbc-3.0.7-1.egg': {
        '0da2a23935dd7687f15726bd79e20df8055c5c898216abec013a0a1486d89483':
        u'cp27',
        '6980345656cffa8a7ecd1d549d46474ce1b567d8d6b4d2e6776882885176264e':
        u'cp27',
        '6a1de532a0bcab9ffe5855611779520a561b962e70102cd43408c86cd6f1a365':
        u'cp27',
        '7181ba8860615beb2e2b6af30c4b2e6294a616720ef2eeed4a40aa80360ce260':
        u'cp27',
        'daf50ad8ff8bf784c8b3b1cd4a62f67c4b490305920de3a09f69e0f1e36bd6e8':
        u'cp27',
        'e29ac4f314791321dfa722e1dbf7c46c9fe2bd7d2349daf175a09a53e874ad61':
        u'cp27'
    },
    'pyodbc-3.0.7-2.egg': {
        '15cb2bd106a7009a68b1d4f0e306f2e0fdfeb38a1066c5b094b74375e0e59368':
        u'cp27',
        '2bae22792ca6bccb4b65ffa939169abfe853d139e2bd6c71a5b3e511b3aaf08d':
        u'cp27',
        '4e20c8d33ebccaf180006a578f61c99ba5551df19a95ef2f11708ee1d925114c':
        u'cp27',
        'deaa75f93a55f03d628cb1d12479fd16d3f746862823669f14e740786e3f2191':
        u'cp27',
        'fa16f6c34497c431cd11512f23ab555a50b850747715f2c6d3bb522bc2e807bb':
        u'cp27'
    },
    'pyside-1.0.0b3-1.egg': {
        '82c44b1d66337875072b9a1ca67d0e4a6c3fdb3c0c1bb7a30e4466f5beca3d75':
        u'cp27'
    },
    'pyside-1.0.0b5-1.egg': {
        '8329364314dd7eb03ea0cdb9453460c020a5e285dad173df5ed2fe5f9cb98907':
        u'cp27'
    },
    'pyside-1.0.0rc1-1.egg': {
        'ce865df6988666fb3952f47caaf9360881d3711f0248534d8372879286ba8ca9':
        u'cp27',
        'd1577b1ebc3404d63f8c55b7ad0d6fc2698479f1066d9827069bddb29db8efe7':
        u'cp27',
        'ed90e9b6c83d4f9fb0a7db2a5fc508639ac549a5c3d0bb4aabfd10b5f81a7601':
        u'cp27'
    },
    'pyside-1.0.2-1.egg': {
        '42b253747a6f3ee97894b6e1cc1daa9a0ba001f373e25a26c63d591dbdc885a5':
        u'cp27',
        '9ac3a02b1e7d1c92b7df043ea095ba2c536ca29c1f281f19571762f576288566':
        u'cp27'
    },
    'scite-1.74-3.egg': {
        'e69209732f35867f9da67c4f6882d81b54fd7c3a97f944d26f62137c93ee9a3e':
        u'py27'
    },
    'scite-1.74-4.egg': {
        'd687dc24564bf5c07e15f9996dcd0138263db1281485aede0f261f4010333280':
        u'py27'
    },
    'scite-1.74-6.egg': {
        '26496ccf2c21bb40a0be6ec16c7fb45a97720a6211c3a16059e1ed6471c1611b':
        u'py27',
        '462ff9f74c0bc09216d229613dfc466d3ebf7bab9befa2bbce9309882434b137':
        u'py27'
    },
    'shiboken-1.2.1-1.egg': {
        '0fcb704c489e9e0b0e31594cac3ae409b9fcbfc9eb2c2f2b2b53fde496cb0e64':
        u'cp27',
        '117218330eb512edf665f01bde850ec7718eb90292905a741c196178a8d49db6':
        u'cp27'
    },
    'shiboken-1.2.1-2.egg': {
        '0b92a57e31e745d8d9a132dbec8f3296b34d9fe252e27b951ccc93213fb0e15d':
        u'cp27',
        '15764d262a72c90fa7ed406acab83428ea5add9798544b508bf9f13906e83d1e':
        u'cp27',
        '3d33f6f9864d1890ac79ff56671a9a0565ab2464916a32fb0feadfe0ceb346d7':
        u'cp27',
        'c1ec088e8a606f8d2ee3683497d1981a96f075d62856d28950b98dc0f69a1dcf':
        u'cp27'
    },
    'shiboken-1.2.1-3.egg': {
        '125041f33fc2330caf192ea9e59a9e1ed7a030291d5df88026e2f787f88d0fbc':
        u'cp27',
        '264648941f3872c6cc2629d3b70f24575a11e2d271fb1ebc83ca5a99261267f1':
        u'cp27',
        '296634f612a10a3415aaac9481373a10eade2fb6709481d051503c5f0ea4dea3':
        u'cp27',
        '3c25ca6c9c6b777a1e65a9fa637905215c7417866b4c7022bcfc1b2b3e14ec12':
        u'cp27',
        '59c116e2e74d545ef505bf0316f28362a2624e97df6a9aff208bd1f3bb3dd52e':
        u'cp27',
        '657b30c336ec77aa6924ace28c47614999901faede33bf16e1a915e2a7935897':
        u'cp27'
    },
    'shiboken-1.2.2-1.egg': {
        '1a1d1e5182f2575544ddf4512054c7c4868d90adaf4f1618f6ed3ebeebb2e472':
        u'cp27',
        '466149b46ce3d4e561bcfa5de5c5921da56c0d2d23c031160199cc77dd2ba75a':
        u'cp27',
        'a9dc01fc8d5a7671468fdd03e41e65b332b9aff07f9f3d603be4f8bcedb9a0cf':
        u'cp27',
        'd68c8cdfea8eabd2b1d00c53b03a2aac4e0c3a893fe7a72c695db01b0659bd7e':
        u'cp27',
        'eaa629e319c7904e913a6444e2aa64b14e2e3e6f14c9c84ea24a20c10e160182':
        u'cp27',
        'f7e58bf1b74bdd570df656ce53b104672b68775bba8be553042020a8a79b6a4d':
        u'cp27'
    },
    'shiboken-1.2.2-2.egg': {
        '1033b7a49bd3367e84b357e96020d1ad360e280476f2971723d0831cd3d46ea3':
        u'cp27',
        '133928ea0c440a66d290cb4f6db3b7055b820af7089e34947d0ab1c40145bb16':
        u'cp27',
        '200f68b934805831be63d6101b24099f8bc9e5bebd900d6d2082a396c5c6dafa':
        u'cp27',
        '87df13ab77b82b33f82ca44dd2fd9d641f86358da2c02207325446b39fdae178':
        u'cp27'
    },
    'shiboken-1.2.2-3.egg': {
        '210d96711a8628fb95b66ce9859d91552c35feed5fc6359bc07c6af95167c58c':
        u'cp27',
        '777514149dee62ca64347d11c83fa84a2dad34f16f55fd44a226ac3640d96d87':
        u'cp27',
        'b0df0a3e2fa0858bf25729a41b4b7eb2a7771a6dadddaef51872bf6da0132f76':
        u'cp27',
        'e98793d0b7e62f1b3a7540927735a842034583bfff701e9a17d2f038dc11352e':
        u'cp27',
        'eda0babf538f6a23eb1aa8032fb60b6e30d1613e8e9e531e10f7959c060d6aca':
        u'cp27'
    },
    'sip-4.15.3-1.egg': {
        '28325a7adae018a85df3a8981b7a7f5aa8c30229c28952577f77bb72b8b2dd7b':
        u'cp27',
        '8596c7f6fe446d465ce0d363f6fa4db64317b5cdc2aee20adb40856fa13fb9c9':
        u'cp27',
        '9c3108ce29fd558abfc664dd34daef0f517cb4cc9d3d55a91dd7ab0ec1d4de23':
        u'cp27',
        'a372583a30b7d68073b371b2b959b90030cbc5f19f3554df682a972f86e1137d':
        u'cp27',
        'c4c4addc225417f89da721113372db5d942ed051943975f908cd9c94763a31c7':
        u'cp27',
        'e9f7722dbc926b8b2e974f1508eee25c47eb95e43ed1e7d5b63e8e9f8d6b3d87':
        u'cp27'
    },
    'sip-4.16.1-1.egg': {
        '01a6e5041649ec3093492ffa44f809f3d3baabb75aca8eaec6160fddc66bc2d5':
        u'cp27',
        '1adf8b351302e6d49e2ccb6ef0b6c030f46df992fa8a12f1878db35d4f2d3dc2':
        u'cp27',
        '2d1c2ee76d9ad81c99f0da0a83f048f48b578c9fe397d7b42546c8b242b51cfe':
        u'cp27',
        'bb5d2d02db95ae7c4c47fa07d64f365243f8d609534b9917ee3d6b6aedb8de47':
        u'cp27',
        'e62b6344dea221501fa685f9351fc4242a4a849d6e6f09e93dfacc2cf13e39ad':
        u'cp27',
        'f96081c8d6edae2870c5210235a812327a09e1586857c1d7f8a93553b44afd6e':
        u'cp27'
    },
    'sip-4.16.7-1.egg': {
        '067b71d2848a04ac68c1534ee2b84b5a3f07dff0a48a69ced36c6357b0e7fdb8':
        u'cp27',
        '2333e6ba7b8f1d144258cf3ab819ccc859ab0df59cd29c9219be166c05977eb9':
        u'cp27',
        '709af6d4ba8563e1352cc773936f10fa00d9078140f5cfc9717ceb50c221f0c4':
        u'cp27',
        'dfdb6f86574387586fd4fd0dbf0e4dd5ee63c220099c78086a5e0bc156be6d81':
        u'cp27',
        'fdb36641cf61ddbd098c2cdfd7f08138839f4c9e0e13b85b73d43cd628f6915f':
        u'cp27'
    },
    'sip-4.17-1.egg': {
        '32bb0b59b219cb183a5a43c3d0d99b33aa2076d4b8c4d95f44a8cb1cd3af3cd0':
        u'cp27',
        'f834ecbeea817b3fbcc50caf0be4e5590baae7df95cde138a2e0f6ad53b67762':
        u'cp27'
    },
    'ujson-1.33.0-1.egg': {
        '36516cd660ab1aeac3ec3e70053e4191db66d880961f07e2e248cdce5823e4e4':
        u'cp27',
        '73b2152915fcc80a82936256415afe4b40cd4ad82f516b93b53c3fc9255f47c4':
        u'cp27',
        '80cc7357fd8126eae2b1610de858c671cc56e171d8f0c737ffed1901b27ff1a7':
        u'cp27',
        '9b06b2cf4d57d6b74a56c007dbd1b47a349117a531bc497fb8c2d637729dd852':
        u'cp27',
        'b8e12459daa8543d3de37f5aa4cfadc05dd96db608ecf206ea278278da7b28da':
        u'cp27',
        'cb505b743f73f18144cf8d484a0cb58e01324c8a64639fead4e7b43f6c1066a1':
        u'cp27'
    },
    'ujson-1.33.0-2.egg': {
        '1b5322a11b58af0a7af6d4c5f508d35adce72306e5eb03ca51f508d05999831a':
        u'cp27',
        'da7a864ef9fe89009e84391caadecff4c7b99a79ba63b46aee2485630ece0b9b':
        u'cp27',
        'dbf7abd2339ed0cd4efda9140be43d0e25fbe85e2fdc2c6891e72259e9cf36a7':
        u'cp27',
        'f4b6d9ce5702a86137c5f1a7d5ccf866f4b8813c7fc24b2fed0c1c4b24943802':
        u'cp27'
    },
    'ujson-1.35-1.egg': {
        '1c7b0c6eaca9571a6ce2222523682276bc312fe55348588b093c1d748932e434':
        u'cp27',
        'c4c4c886e42ca99aa05a1eb6e66ae7bb00d96f12ae87191eb3d49064c61c6669':
        u'cp27',
        'e9aca0f10bafa1f745df9b3779dc735b8d0fa0c61a815fafa2fb17b587365495':
        u'cp27',
        'f48186b63e79d9959b0a4f6f8383bd046fdab61b6a993296f8ba0658f2dc47af':
        u'cp27'
    },
}


# (egg sha256) -> (epd platform string) mapping
EGG_PYTHON_TAG_BLACK_LIST = dict(
    (checksum, python_tag)
    for egg in _EGG_PYTHON_TAG_BLACK_LIST.values()
    for checksum, python_tag in egg.items()
)


def may_be_in_python_tag_blacklist(path):
    """ Returns True if the given egg path may be in the python tag blacklist.
    """
    return os.path.basename(path) in _EGG_PYTHON_TAG_BLACK_LIST

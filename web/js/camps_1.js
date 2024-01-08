$(function () {

//last update : 03.04.2018
    var availableTags = ["AALO","ACHAMPET","ADILABAD","ADITYAPUR","ADONI","ADOOR","AGARTALA","AGRA","AHMEDABAD CENTRAL","AHMEDABAD MANINAGAR","AHMEDABAD WEST","AHMEDNAGAR","AHWA","AIROLI","AIZAWL EAST","AIZAWL NORTH","AIZAWL SOUTH","AIZAWL WEST","AJMER","AKOLA","ALAIR","ALIBAUG","ALIGARH","ALIPURDUAR","ALIRAJPUR","ALLAHABAD","ALLEPPEY","ALMORA","ALUVA","ALWAL","ALWAR","AMALAPURAM","AMBALA","AMBASAMUDRAM","AMBERNATH","AMBIKAPUR","AMBUR","AMLAI","AMPATI","AMRAVATI","AMRITSAR","ANAKAPALLE","ANAND","ANANTAPUR","ANCHAL","ANDHERI","ANGAMALI","ANGUL","ANKLESHWAR","ANNI","ARAKKONAM","ARAKU","ARARIA","ARCOT","ARIYALUR","ARMOOR","ARRAH","ARUMUGANERI","ARUPPUKOTTAI","ASANSOL","ATHIKAYAM","ATHMAKUR","ATMAKUR KNL","ATTUR","AURANGABAD","AVADI","AYUR","AZAMGARH","BADAUN","BADLAPUR","BADVEL","BAHRAICH","BAIKUNTHPUR","BAILADILA","BALAGHAT","BALASORE","BALIGUDA","BALLARSHA","BALLIA","BANGALORE CENTRAL","BANGALORE CHANDAPURA","BANGALORE ELECTRONIC CITY","BANGALORE HOSA ROAD","BANGALORE KORAMANGALA","BANGALORE NORTH","BANGALORE NORTH EAST","BANGALORE RAJAJI NAGAR","BANGALORE RT NAGAR","BANGALORE SOUTH","BANGALORE SOUTH EAST","BANGALORE WHITEFIELD","BANGALORE YELAHANKA","BANKURA","BANSWARA","BAPATLA","BARABANKI","BARAMATI","BARAN","BARASAT","BAREILLEY","BARGARH","BARHARWA","BARMER","BARNALA","BARODA","BARWANI","BATALA","BATHINDA","BEAWAR","BEGUSARAI","BELGAUM","BELLARY","BELUR","BENAULIM","BERHAMPUR","BETTIAH","BETUL","BHADOHI","BHADRACHALAM","BHADRAK","BHADRAVATI","BHAGALPUR","BHANDARA","BHARATPUR","BHARUCH","BHATAPARA","BHAVANI","BHAVNAGAR","BHAWANIPATNA","BHEL RAMACHANDRAPURAM","BHILAI","BHILWARA","BHIMAVARAM","BHIMUNIPATNAM","BHIRAKHERI","BHOPAL","BHOPAL - BHEL","BHUBANESHWAR","BHUJ","BIDAR","BIJAPUR","BIJAPUR K","BIJNOR","BIKANER","BILASPUR","BINA","BIRAMITRAPUR","BISHNUPUR","BISHRAMPUR","BISHWANATH","BOBBILI","BODHAN","BOKARO STEEL CITY","BOLANGIR","BOMDILA","BOMMANAHALLI","BONGAIGAON","BORIO-SAHEBGANJ","BORIVILI","BORRA CAVES","BOWENPALLY","BRAJRAJNAGAR","BULDHANA","BUNDI","BUXAR","CALCUTTA CENTRAL","CALCUTTA NORTH","CALCUTTA SOUTH","CALICUT","CALICUT NIT","CHAIBASA","CHAKRADHARPUR","CHAMARAJNAGAR","CHAMBA","CHAMPHAI","CHANDEL","CHANDIGARH","CHANDIGARH WEST","CHANDRAPUR","CHANDWA","CHANGANACHERRY","CHANGTONGYA","CHEMBUR","CHENGALPATTU","CHENGANNUR","CHENNAI INFO","CHHATARPUR","CHHINDWARA","CHICKMAGALUR","CHIDAMBARAM","CHILAKALURIPETA","CHINTAPALLI-PADERU","CHIRALA","CHIRMIRI","CHITRADURGA","CHITRANJAN","CHITTOOR","CHITTORGARH","CHODAVARAM","CHUMUKEDIMA","CHUNGATHARA","CHURACHANDPUR","CHURACHANDPUR NORTH","COCHIN CENTRAL","COCHIN INFO PARK","COCHIN ISLANDS","COCHIN VYTILLA","COIMBATORE EAST","COIMBATORE WEST","COONOOR","CUDDALORE","CUDDAPAH","CUTTACK","DADAR","DAHOD","DALLI RAJHARA","DALTANGANJ","DALU","DAMOH","DAPORIJO","DARBHANGA","DARCHAWI","DARJEELING","DAUND","DAVANGERE","DEHRA DUN","DEHRI-ON-SONE","DEHUROAD","DELHI","DELHI CENTRAL","DELHI EAST","DELHI NANGLOI","DELHI NORTH","DELHI NORTH EAST","DELHI NORTH WEST","DELHI PUSHP VIHAR","DELHI ROHINI","DELHI SARITA VIHAR","DELHI SOUTH","DELHI SOUTH EAST","DELHI SOUTH WEST","DELHI VASANT KUNJ","DELHI WEST","DEOGHAR","DERGANG","DEVARAKONDA","DEWAS","DHALAI","DHAMTARI","DHANBAD","DHARAMSHALA","DHARIWAL","DHARMAPURI","DHARMAVARAM","DHARWAD","DHEMAJI","DHULE","DIBRUGARH","DIMAPUR EAST","DIMAPUR WEST","DINDIGUL","DIPHU","DOMBIVILI","DONGARGARH","DORNAKAL","DUMKA","DUNGARPUR","DURGAPUR","DURGAPUR CENTRAL","ECIL HYDERABAD","EDAPALLY","ELURU","ELURU EAST","ERODE","ETAH","FAIZABAD","FAMBONG-SOMBARIA","FARIDABAD","FARIDKOT","FARRUKHABAD","FATEHGARH","FATEHPUR","FEROZPUR","FORT COCHIN","G. MADUGULA","G.UDAYAGIRI","GADAG-BETGARI","GADCHANDUR","GADWAL","GAJWEL","GANDHIDHAM","GANDHINAGAR","GANGTOK","GARHWA","GAYA","GAYZING","GHATKOPAR","GHATSILA-MUSABANI","GHAZIABAD","GHAZIPUR","GHUGUS","GIDDALUR","GIRIDIH","GOA MAPUSA","GOA MARGAO","GOA PANJIM","GOA PONDA","GOA VASCO","GOALPARA","GOBICHETTIPALAYAM","GODDA MAHAGAMA","GODHRA","GOKAK","GOKAVARAM","GOLAGHAT","GONDA","GONDIA","GOOTY","GORAKHPUR","GOREGAON","GOSAIGAON","GREATER NOIDA","GUDALUR","GUDIWADA","GUDIYATHAM","GUDUR","GULBARGA","GUMLA","GUNA","GUNDLUPET","GUNTAKAL","GUNTUR NORTH","GUNTUR SOUTH","GURDASPUR","GURGAON","GUWAHATI","GWALIOR","HAFLONG","HALDWANI","HAMIRPUR","HANAMAKONDA","HARDA","HARDOI","HARUR","HASSAN","HAVERI - RANEBENNUR","HAZARIBAGH","HAZIPUR","HERBERTPUR","HINDAUN CITY","HINDUPUR","HISAR","HITECH MADHAPUR","HNATHIAL","HOSHANGABAD","HOSIARPUR","HOSPET","HOSUR","HUBLI","HUBLI CENTRAL","HUNSUR","HUTTI GOLD MINES","HUZUR NAGAR","HYDERABAD","HYDERABAD - MEERPET","HYDERABAD L.B. NAGAR","HYDERABAD RAJENDRA NAGAR","HYDERABAD SANATHNAGAR","HYDERABAD SOUTH","HYDERABAD SOUTH WEST","IBRAHIMPATNAM","ICHALKARANJI","ICHAPURAM","IMPHAL EAST","IMPHAL WEST","INDORE","INDORE CENTRAL","INKOLLU","IRINJALAKUDA","ITANAGAR CITY","ITARSI","JABALPUR","JADCHARLA","JAGADHRI","JAGDALPUR","JAGDEESHPUR","JAGGAIAHPET","JAGTIAL","JAHANABAD","JAIGAON","JAIPUR CENTRAL","JAIPUR NORTH","JAIPUR SOUTH","JAISALMER","JALANDHAR","JALANDHAR SOUTH","JALGAON-BHUSAVAL","JALNA","JALORE","JALUKIE","JAMMU","JAMNAGAR","JAMPUI","JAMSHEDPUR","JAMTARA","JAMUI","JANGAREDDIGUDEM","JANJGIR","JATNI KHURDA","JEEDIMETLA","JEYPORE","JHALAWAR","JHANSI","JHARSUGUDA","JIRIBAM","JOBAT","JODHPUR","JORETHANG","JORHAT","JOWAI","JYOTHINAGAR","KADIRI","KAGAL","KAILASAPURAM","KAIMUR","KAITHAL","KAKINADA","KALAMASSERY","KALIMPONG","KALLURU","KALPETTA","KALWAKURTHY","KALYAN","KALYANDURG","KAMAREDDY","KANCHIPURAM","KANDUKUR","KANGPOKPI","KANIGIRI","KANKE","KANKER","KANNUR","KANPUR","KAPURTHALA","KARAD","KARAIKUDI","KARIMNAGAR","KARNAL","KARTHIKAPALLY","KARUKACHAL","KARUR","KARWAR","KASARAGOD","KASAULI","KASGANJ","KASHIPUR","KATHUA","KATIHAR","KATNI","KATRA","KATTAKADA","KATTAPANA","KAVALI","KAYAMKULAM","KAZIPET","KHADAKWASLA","KHAGARIA","KHALILABAD","KHAMMAM NORTH","KHAMMAM SOUTH","KHANDWA","KHANNA","KHARAGPUR","KHARAR","KHARGHAR","KHARKUTTA","KHAWZAWL","KHLIEHRIAT","KHUMULWNG","KHUNTI MURHU","KILIMANOOR","KIPHIRE","KODAD","KODAIKANAL","KODARMA","KODOLI","KODUKULANJI","KOHIMA NORTH","KOHIMA SOUTH","KOILKUNTLA","KOKRAJHAR","KOLAR","KOLAR GOLD FIELDS","KOLASIB","KOLENCHERRY","KOLHAPUR","KOLLEGAL","KONDAGAON","KONNI","KORAPUT","KORATTY","KORBA","KORUTLA","KOSA GUMUDA","KOTA","KOTGARH","KOTHAGUDEM","KOTHAMANGALAM","KOTPAD","KOTTARAKARA","KOTTAYAM","KOVILPATTI","KOVVURU","KOZHENCHERRY","KRISHNAGIRI","KULATHUPUZHA","KULLU","KUMALI","KUMBAKONAM","KUMBANAD","KUNDARA","KUNNAMKULAM","KURADA","KURNOOL","KURSEONG","KURTAMGARH","LAKHIMPUR","LAKHIMPUR KHERI","LAKHIPUR","LAKHNADON","LAKLA","LAKSHETTIPET","LALITPUR","LATEHAR","LATUR","LAWNGTLAI","LEH","LOHARDAGA","LONAVALA","LONGDING","LONGLENG","LUCKNOW","LUCKNOW SOUTH","LUCKNOW TRANSGOMTI","LUDHIANA","LUMDING","LUNGLEI","MACHERLA","MACHILIPATNAM","MADANAPALLE","MADEKERI","MADHEPURA","MADHIRA","MADHUPUR","MADHURANTHAGAM","MADHYAMGRAM","MADRAS NORTH","MADRAS SOUTH","MADRAS WEST","MADURAI EAST","MADURAI NORTH","MADURAI SOUTH","MAHASAMUND","MAHBUBABAD","MAHBUBNAGAR","MAIRANG","MALAJKHAND","MALAYINKEEZHU","MALKANGIRI","MALLAPALLY","MAMIT","MANALI","MANANTHAVADY","MANAPARAI","MANCHERIAL","MANDLA","MANDYA","MANENDRAGARH","MANGALAGIRI","MANGALORE","MANGO","MANMAD","MANNARGUDI","MANNUTHY","MANOHARPUR","MANTHANI","MANUGURU","MARKAPUR","MARTHANDAM","MARTUR","MARWAR JUNCTION","MATHURA","MATTAMPALLI","MAU","MAVELIKARA","MAWKYRWAT","MAYILADUTHURAI","MEDAK","MEERUT","MEHDIPATNAM - HYDERABAD","MEHSANA","METPALLY","METTUPALAYAM","METTUR DAM","MHOW","MIAO","MIRA-BHAYANDER","MIRAJ","MIRIK","MIRYALAGUDA","MIRZAPUR","MOGA","MOHALI","MOKOKCHUNG","MON","MORADABAD","MOREH","MOTIHARI","MUDALGI","MUL","MULANTHURUTHY","MUMBAI BANDRA","MUMBAI CENTRAL","MUNGELI","MUNGER JAMALPUR","MUNIGUDA","MUNNAR","MUSSOORIE","MUVATTUPUZHA","MUZAFFARPUR","MYSORE","NABARANGPUR","NABHA","NAGAPATTINAM","NAGARJUNASAGAR","NAGARKURNOOL","NAGAUR","NAGERCOIL EAST","NAGERCOIL NORTH","NAGERCOIL SOUTH","NAGERCOIL WEST","NAGPUR AJANI","NAGPUR KAMPTEE","NAGPUR MANKAPUR","NAGPUR WADI","NAHARLAGUN","NAIDUPETA","NAIGAON","NAINI","NAINITAL","NAINPUR","NAKREKAL","NALAGARH","NALANDA","NALGONDA","NALLASOPARA","NAMAKKAL","NAMCHI","NAMKUM","NANDED","NANDIGAMA","NANDURBAR","NANDYAL","NARASARAOPET","NARAYANPUR","NARSAPUR MEDAK","NARSAPURAM","NARSIPATNAM","NASHIK","NAVAPUR","NAWADA","NAWAN SHAHR","NAXALBARI","NAZARETH","NEDUMANGADU","NEEMUCH","NELLIMOODU","NELLORE","NELYADI","NERUL","NEW GURGAON","NEW TOWN CALCUTTA","NEYATTINKARA","NEYVELI","NIDADAVOLU","NIDUBROLU","NIGDI","NIRMAL","NIULAND","NIZAMABAD","NOIDA","NONGPOH","NONGSTOIN","NORTH PARUR","NORTH VANLAIPHAI","NUZVID","ODDANCHATRAM","OLAVAKKOD","ONGOLE","PADHAR","PAKUR - HIRANPUR","PALAKONDA","PALAMPUR","PALGHAT","PALI MARWAR","PALLEL","PALONCHA","PANCHKULA","PANDALAM","PANIPAT","PANVEL","PARALAKHEMUNDI","PARAMAKUDY","PARASSALA","PARBHANI","PARVATHIPURAM","PASIGHAT","PATHANAMTHITTA","PATHANAPURAM","PATHANKOT","PATHAPATNAM","PATIALA","PATNA","PATNA WEST","PAURI GARWHAL","PAYANNUR","PAYYAPADY","PEDDAPALLI","PENDRA ROAD","PERAMBALUR","PEREN","PERUMBAVOOR","PFIITSERO","PHEK","PHILLAUR","PHULBANI","PHULBARI","PIDUGURALLA","PILER","PIMPRI","PINJOR - KALKA","PIPARIA","PIRAVAM","PISKA NAGRI ITKI","PITHAPURAM","PITHORAGARH","PODILI","POLLACHI","PONDICHERRY","PONKUNNAM","POONA CENTRAL","PORBANDAR","PORT BLAIR","POWAI","PRATAPGARH","PRODDATUR","PUDUKOTTAI","PULIVENDLA","PUNALUR","PURI","PURNIA","PUTTUR","QUILON","RAEBARELI","RAHATA-RAHURI","RAICHUR","RAIGARH","RAIKIA","RAIPUR","RAJAMUNDRY","RAJAPALAYAM","RAJGANGPUR","RAJKOT","RAJNANDGAON","RAJSAMAND","RAMACHANDRAPURAM","RAMANATHAPURAM","RAMAYAMPET","RAMESWARAM","RAMGARH-BARKHAKANA","RAMPACHODAVARAM","RAMPUR","RANCHI","RANCHI SOUTH","RANGAPARA","RANIPET","RANNI","RASIPURAM","RATLAM","RATNAGIRI","RAVULAPALEM","RAXAUL","RAYACHOTI","RAYAGADA","RAZOLE","RENUKOOT ANPARA","REPALLE","RESUBELPARA","REWA","ROING","ROORKEE","ROPAR","RORHU","ROURKELA","RR NAGAR - KENGERI","RUDRAPUR","RUPAIDIHA","SABROOM","SAGAR C","SAGAR K","SAHARANPUR","SALEM","SALUR","SAMALKOT","SAMBA","SAMBALPUR","SAMSI","SANGAMNER","SANGAREDDY","SANGLI","SANGRUR","SANKARANKOVIL","SANKESHWAR","SANTIR BAZAR","SARNI","SATARA","SATHUPALLI","SATHUR","SATNA","SATTENAPALLI","SAWAI MADHOPUR","SECUNDERABAD","SENAPATI","SEONI","SERCHHIP","SHADNAGAR","SHAHDOL","SHAHJAHANPUR","SHAMSHABAD","SHILLONG EAST","SHILLONG NORTH","SHILLONG SOUTH","SHIMLA","SHIMOGA","SHORNUR","SHREERAMPUR","SIAHA","SIBSAGAR","SIDDIPETA","SIKAR","SILCHAR","SILIGURI","SIMDEGA","SINDHUDURG","SINGRAULI","SINGTAM","SITAPUR (CHATTISGARH)","SITAPUR (UTTAR PRADESH)","SIVAGANGAI","SIVAKASI","SOLAN","SOLAPUR","SONARI","SONBHADRA","SONEPAT","SONGADH","SRIGANGANAGAR","SRIKAKULAM","SRIKALAHASTI","SRINAGAR","SULLURUPET","SULTAN BATHERY","SUNABEDA","SUNDARGARH","SUNDERNAGAR","SURANDAI","SURAT","SURENDRANAGAR","SURYAPET","TADEPALLEGUDEM","TADPATRI","TAMBARAM","TAMENGLONG","TANAKPUR","TANUKU","TARAN-TARAN","TENALI","TENKASI","TEZPUR","TEZU","THANE","THANJAVUR","THENI","THENZAWL","THIRUKOILUR","THIRUMALA","THIRUVALLUR","THIRUVARUR","THODUPUZHA","THUNGATHURTHY","TILDA","TINDIVANAM","TINSUKIA","TIRUCHENDUR","TIRUCHENGODU","TIRUCHIRAPALLY","TIRUNELVELI NORTH","TIRUNELVELI SOUTH","TIRUPATHI","TIRUPATTUR","TIRUPUR","TIRUVALLA","TIRUVANNAMALAI","TIRUVURU","TITLAGARH","TONK","TRANQUEBAR","TRICHUR","TRICHUR CENTRAL","TRIPUNITHURA","TRIVANDRUM EAST","TRIVANDRUM NORTH","TRIVANDRUM SECRETARIAT","TRIVANDRUM SOUTH","TRIVANDRUM TECHNO","TRIVANDRUM WEST","TSEMINYU","TUENSANG","TUMKUR","TUNI","TURA","TUTICORIN","UDAIPUR","UDAIPUR-T","UDALGURI","UDAYAGIRI","UDGIR","UDHAMPUR","UDUMALPET","UDUPI","UJJAIN","UKHRUL","ULHAS NAGAR","UNA - NANGAL","UNNAO","UPPAL","UTHANGARAI","UTRAULA","VADALA","VADASERIKARA","VADUVANCHAL","VALLIYOOR","VALPARAI","VALSAD","VAPI","VARANASI","VASAI","VASHI","VATTAPPARA","VELLARADA","VELLORE","VERAVAL","VIJAYAWADA","VIJAYAWADA EAST","VILLUPURAM","VINUKONDA","VIRAR","VIRUDHNAGAR","VISHAKHAPATNAM NORTH","VISHAKHAPATNAM SOUTH","VISHRANTWADI","VISSANNAPETA","VIZIANAGARAM","VUYYURU","WANAPARTHY","WANOWRIE","WARANGAL","WARDHA","WASHIM","WILLIAMNAGAR","WOKHA","YADGIR","YAVATMAL","YELLANDU","YEMMIGANUR","YERCAUD","ZAHEERABAD","ZIRAKPUR","ZIRO","ZUNHEBOTO","NHQ","NHQ SD","IHQ"];
        $("#camp").autocomplete({
            source: availableTags
        });
});
$(function () {
//last update : 03.04.2018
    var availableTags = ["MARTHANDAM","NAGERCOIL EAST","NAGERCOIL NORTH","NAGERCOIL SOUTH","NAGERCOIL WEST","ARUMUGANERI","IDAIYANGUDI","NAZARETH","VALLIYOOR","AMBASAMUDRAM","SURANDAI","TENKASI","TIRUNELVELI NORTH","TIRUNELVELI SOUTH","KOVILPATTI","SANKARANKOVIL","TIRUCHENDUR","TUTICORIN","RAJAPALAYAM","SATHUR","SIVAKASI","VIRUDHNAGAR","ARUPPUKOTTAI","MADURAI EAST","MADURAI NORTH","MADURAI SOUTH","THENI","PARAMAKUDY","RAMANATHAPURAM","RAMESWARAM","SIVAGANGAI","DINDIGUL","KODAIKANAL","ODDANCHATRAM","UDUMALPET","COIMBATORE EAST","COIMBATORE WEST","POLLACHI","VALPARAI","COONOOR","GUDALUR","METTUPALAYAM","BHAVANI","ERODE","GOBICHETTIPALAYAM","KARUR","TIRUPUR","ATTUR","NAMAKKAL","RASIPURAM","SALEM","YERCAUD","DHARMAPURI","HARUR","METTUR DAM","TIRUCHENGODU","HOSUR NORTH","HOSUR SOUTH","KRISHNAGIRI","PENNAGARAM","UTHANGARAI","THIRUKOILUR","TINDIVANAM","TIRUPATTUR","TIRUVANNAMALAI","AMBUR","ARCOT","GUDIYATHAM","RANIPET","VELLORE","ARAKKONAM","CHENGALPATTU","KALPAKKAM","KANCHIPURAM","MADHURANTHAGAM","THIRUVALLUR","AVADI","CHENNAI INFO","MADRAS WEST","MADRAS NORTH","MADRAS SOUTH","PORT BLAIR","TAMBARAM","CUDDALORE","NEYVELI","PONDICHERRY","VILLUPURAM","CHIDAMBARAM","MAYILADUTHURAI","NAGAPATTINAM","TRANQUEBAR","ARIYALUR","KUMBAKONAM","MANNARGUDI","THANJAVUR","THIRUVARUR","KAILASAPURAM","KARAIKUDI","MANAPARAI","PERAMBALUR","PUDUKOTTAI","TIRUCHIRAPALLY","CHARIMOODU","CHERTHALA","CHITTUR","EDATHUA","IRITTY","KANJIKODE","KONDOTTY","KUDAPPANAKKUNNU","MUNDAKKAYAM","PUTHUPPADY","RANNI NORTH WEST","THIDANADU","VECHOOCHIRA","POONTHURA","THIRUMALA","TRIVANDRUM SECRETARIAT","TRIVANDRUM SOUTH","VATTIYOORKAVU","VIZHINJAM","TRIVANDRUM EAST","TRIVANDRUM NORTH","TRIVANDRUM TECHNO","TRIVANDRUM WEST","BALARAMAPURAM","INCHIVILA","NELLIMOODU","NEYATTINKARA","PARASSALA","VELLARADA","ARYANAD","ATTINGAL","KATTAKADA","MALAYINKEEZHU","NEDUMANGADU","URIACODE","VATTAPPARA","VITHURA","ANCHAL","KULATHUPUZHA","PATHANAPURAM","PUNALUR","VALAKAM","ADOOR","CHENGANNUR","KARTHIKAPALLY","KODUKULANJI","MAVELIKARA","PANDALAM","KOZHENCHERRY","KUMBANAD","PATHANAMTHITTA","TIRUVALLA","ATHIKAYAM","KONNI","RANNI","VADASERIKARA","ALLEPPEY","KAYAMKULAM","KOTTARAKARA","KUNDARA","QUILON","COCHIN CENTRAL","COCHIN ISLANDS","FORT COCHIN","KALAMASSERY","TRIPUNITHURA","COCHIN INFO PARK","COCHIN VYTILLA","EDAPALLY","MULANTHURUTHY","PIRAVAM","KARUKACHAL","KOTTAYAM","MALLAPALLY","PAYYAPADY","PONKUNNAM","KATTAPANA","KUMALI","MUNNAR","ALUVA","ANGAMALI","IRINJALAKUDA","KOLENCHERRY","KOTHAMANGALAM","MUVATTUPUZHA","PERUMBAVOOR","THODUPUZHA","KUNNAMKULAM","MANNUTHY","TRICHUR","TRICHUR CENTRAL","OLAVAKKOD","PALGHAT","SHORNUR","ALAKODE","KALPETTA","MANANTHAVADY","MEENANGADI","SULTAN BATHERY","CALICUT","CHUNGATHARA","KANNUR","KASARAGOD","PAYANNUR","BANGALORE CENTRAL","BANGALORE NORTH","BANGALORE RAJAJI NAGAR","BANGALORE-RR NAGAR AND KENGERI","TUMKUR","BANGALORE BOMMANAHALLI","BANGALORE CHANDAPURA","BANGALORE ELECTRONIC CITY","BANGALORE HOSA ROAD","BANGALORE SOUTH","BANGALORE NORTH EAST","BANGALORE RT NAGAR","BANGALORE YELAHANKA","BANGALORE KORAMANGALA","BANGALORE SOUTH EAST","BANGALORE WHITEFIELD","KOLAR","KOLAR GOLD FIELDS","CHAMARAJNAGAR","GUNDLUPET","KOLLEGAL","HUNSUR","MANDYA","MYSORE","MADEKERI","MANGALORE","NELYADI","PUTTUR DK","BHADRAVATI","SAGAR K","SHIMOGA","UDUPI","BELUR","CHICKMAGALUR","HASSAN","BENAULIM","GOA MARGAO","GOA PONDA","GOA VASCO","KARWAR","GOA MAPUSA","GOA PANJIM","DHARWAD","GADAG-BETGARI","HAVERI - RANEBENNUR","HUBLI","HUBLI CENTRAL","BELGAUM","GOKAK","MUDALGI","SANKESHWAR","BELLARY","CHITRADURGA","DAVANGERE","HOSPET","RAICHUR","YADGIR","BIDAR","BIJAPUR K","GULBARGA","ICHAPURAM","PALAKONDA","PATHAPATNAM","SRIKAKULAM","BOBBILI","PARVATHIPURAM","SALUR","VIZIANAGARAM","ANAKAPALLE","BHIMUNIPATNAM","NARSIPATNAM","VISHAKHAPATNAM NORTH","VISHAKHAPATNAM SOUTH","ARAKU","BORRA CAVES","CHINTAPALLI","PADERU","KAKINADA","PITHAPURAM","SAMALKOT","TUNI","GOKAVARAM","RAJAMUNDRY","RAMACHANDRAPURAM","RAMPACHODAVARAM","AMALAPURAM","RAVULAPALEM","RAZOLE","BHIMAVARAM","KOVVURU","NARSAPURAM","NIDADAVOLU","TANUKU","ELURU","ELURU EAST","JANGAREDDIGUDEM","TADEPALLEGUDEM","JAGGAIAHPET","NANDIGAMA","NUZVID","TIRUVURU","VISSANNAPETA","GUDIWADA","MACHILIPATNAM","VIJAYAWADA","VIJAYAWADA EAST","VUYYURU","GUNTUR NORTH","GUNTUR SOUTH","MANGALAGIRI","TENALI","MACHERLA","NARASARAOPET","PIDUGURALLA","SATTENAPALLI","VINUKONDA","BAPATLA","CHILAKALURIPETA","NIDUBROLU","REPALLE","CHIRALA","INKOLLU","MARTUR","ONGOLE","KANDUKUR","KANIGIRI","MARKAPUR","PODILI","ATHMAKUR","KAVALI","NELLORE","UDAYAGIRI","GUDUR","NAIDUPETA","SULLURUPET","CHITTOOR","MADANAPALLE","PILER","PUNGANUR","PUTTUR","SRIKALAHASTI","TIRUPATHI","ANANTAPUR","DHARMAVARAM","GOOTY","GUNTAKAL","HINDUPUR","KADIRI","KALYANDURG","TADPATRI","ADONI","ATMAKUR KNL","GIDDALUR","KOILKUNTLA","KURNOOL","NANDYAL","YEMMIGANUR","BADVEL","CUDDAPAH","PRODDATUR","PULIVENDLA","RAYACHOTI","HYDERABAD","MEHDIPATNAM","RAJENDRA NAGAR","SANATHNAGAR","ALWAL","BOWENPALLY","SECUNDERABAD","SHAMIRPET","IBRAHIMPATNAM","MEERPET","SAIDABAD","SHAMSHABAD","VANASTHALIPURAM","ECIL HYDERABAD","L.B. NAGAR","UPPAL","BHEL HYDERABAD","HITECH CITY","JEEDIMETLA","KUKATPALLY","HUZUR NAGAR","KODAD","MATTAMPALLI","SURYAPET","THUNGATHURTHY","DEVARAKONDA","MIRYALAGUDA","NAGARJUNASAGAR","NAKREKAL","NALGONDA","GADWAL","MAHBUBNAGAR","NAGARKURNOOL","WANAPARTHY","ACHAMPET","JADCHARLA","KALWAKURTHY","SHADNAGAR","GAJWEL","MEDAK","RAMAYAMPET","SIDDIPETA","NARSAPUR MEDAK","SANGAREDDY","ZAHEERABAD","ARMOOR","BODHAN","KAMAREDDY","NIZAMABAD","ADILABAD","JAGTIAL","KORUTLA","METPALLY","NIRMAL","JYOTHINAGAR","KARIMNAGAR","MANCHERIAL","MANTHANI","PEDDAPALLI","ALAIR","HANAMAKONDA","KAZIPET","MAHBUBABAD","WARANGAL","BHADRACHALAM","KOTHAGUDEM","MANUGURU","PALONCHA","YELLANDU","DORNAKAL","KALLURU","KHAMMAM NORTH","KHAMMAM SOUTH","MADHIRA","SATHUPALLI","BIRISINGPUR","DHAR","NARSINGPUR","NOWROZABAD","SUKMA","BHIND","BHOPAL","BHOPAL - BHEL","BINA","GUNA","GWALIOR","HOSHANGABAD","PADHAR","PIPARIA","SAGAR C","ALIRAJPUR","INDORE","INDORE CENTRAL","JOBAT","MHOW","BARWANI","DEWAS","NEEMUCH","RATLAM","UJJAIN","DAMOH","JABALPUR","KATNI","LAKHNADON","MANDLA","NAINPUR","AMLAI","CHHATARPUR","REWA","SATNA","SHAHDOL","SINGRAULI","BETUL","HARDA","ITARSI","KHANDWA","SARNI","BALAGHAT","CHHINDWARA","MALAJKHAND","SEONI","BHATAPARA","KAWARDHA","MAHASAMUND","RAIPUR","TILDA","BHILAI","DALLI RAJHARA","DHAMTARI","DONGARGARH","RAJNANDGAON","BILASPUR","JAGDEESHPUR","JANJGIR","KORBA","RAIGARH","CHIRMIRI","MANENDRAGARH","MUNGELI","PENDRA ROAD","AMBIKAPUR","BAIKUNTHPUR","BISHRAMPUR","JASHPUR","KANSABEL","PATHALGOAN","SITAPUR (CHATTISGARH)","BAILADILA","BIJAPUR","JAGDALPUR","KANKER","KONDAGAON","NARAYANPUR","AMBABAR","MAJIRI","MUMBAI BANDRA","MUMBAI CENTRAL","CHEMBUR","DADAR","GHATKOPAR","POWAI","THANE","ANDHERI","GOREGAON","BORIVILI","MIRA-BHAYANDER","NAIGAON","NALLASOPARA","VASAI","VIRAR","AIROLI","NERUL","VASHI","ALIBAUG","KHARGHAR","PANVEL","AMBERNATH","BADLAPUR","DOMBIVILI","KALYAN","ULHAS NAGAR","KHADAKWASLA","POONA CENTRAL","VISHRANTWADI","WANOWRIE","NIGDI","PIMPRI","DEHUROAD","LONAVALA","KARAD","SATARA","RATNAGIRI","SINDHUDURG","MIRAJ","SANGLI","ICHALKARANJI","KAGAL","KODOLI","KOLHAPUR","LATUR","SOLAPUR","UDGIR","AHMEDNAGAR","BARAMATI","DAUND","RAHATA-RAHURI","SANGAMNER","SHREERAMPUR","DHULE","JALGAON-BHUSAVAL","MANMAD","NANDURBAR","NASHIK","NAVAPUR","AURANGABAD","JALNA","NANDED","PARBHANI","VADALA","AKOLA","AMRAVATI","BULDHANA","WASHIM","YAVATMAL","BHANDARA","GONDIA","NAGPUR AJANI","NAGPUR KAMPTEE","NAGPUR MANKAPUR","NAGPUR WADI","WARDHA","BALLARSHA","CHANDRAPUR","GADCHANDUR","GHUGUS","MUL","ANAND","BARODA","DAHOD","GODHRA","AHMEDABAD CENTRAL","AHMEDABAD MANINAGAR","AHMEDABAD WEST","GANDHINAGAR","MEHSANA","ANKLESHWAR","BHARUCH","SONGADH","SURAT","AHWA","VALSAD","VAPI","BHAVNAGAR","RAJKOT","SURENDRANAGAR","VERAVAL","BHUJ","GANDHIDHAM","JAMNAGAR","PORBANDAR","BHAMIANA KALANA","DASUYA","DHOLPUR","MANSA","MUKTSAR","NABHA","PEHOWA","PHILLAUR","RAJPURA","RATIA CITY","TANDA","UNA - NANGAL","ALWAR","BHARATPUR","JAIPUR CENTRAL","JAIPUR NORTH","JAIPUR SOUTH","BIKANER","JODHPUR","NAGAUR","SIKAR","SRIGANGANAGAR","BANSWARA","DUNGARPUR","RAJSAMAND","UDAIPUR","AJMER","BHILWARA","CHITTORGARH","PRATAPGARH","TONK","BARAN","BUNDI","HINDAUN CITY","JHALAWAR","KOTA","SAWAI MADHOPUR","BARMER","BEAWAR","JAISALMER","JALORE","MARWAR JUNCTION","PALI MARWAR","DELHI EAST","DELHI NORTH EAST","DELHI SARITA VIHAR","DELHI SOUTH EAST","FARIDABAD","DELHI CENTRAL","DELHI PUSHP VIHAR","DELHI SOUTH","DELHI VASANT KUNJ","NEW DELHI","DELHI NANGLOI","DELHI NORTH","DELHI NORTH WEST","DELHI ROHINI","DELHI SOUTH WEST","DELHI WEST","GURGAON","NEW GURGAON","CHANDIGARH","CHANDIGARH WEST","FATEHGARH","KARNAL","KHARAR","MOHALI","PANCHKULA","PINJOR - KALKA","ZIRAKPUR","FARIDKOT","FEROZPUR","MOGA","AMRITSAR","BATALA","DHARIWAL","GURDASPUR","PATHANKOT","TARAN-TARAN","HOSIARPUR","JALANDHAR","JALANDHAR SOUTH","KAPURTHALA","BARNALA","BATHINDA","PATIALA","SANGRUR","KHANNA","LUDHIANA","NAWAN SHAHR","ROPAR","AMBALA","HISAR","KAITHAL","ROHTAK","SONEPAT","JAGADHRI","PANIPAT","BULANDSHAHR","ETAH","KASGANJ","KOTDWARA","MODINAGAR","BANDA","FARRUKHABAD","HAMIRPUR","KANPUR","BHIRAKHERI","HARDOI","LAKHIMPUR KHERI","LUCKNOW","LUCKNOW SOUTH","LUCKNOW TRANSGOMTI","RAEBARELI","SITAPUR (UTTAR PRADESH)","UNNAO","CHIRGAON","JHANSI","LALITPUR","ALLAHABAD","AZAMGARH","BALLIA","FATEHPUR","MAU","NAINI","BAHRAICH","BARABANKI","FAIZABAD","GONDA","GORAKHPUR","JAUNPUR","KHALILABAD","RUPAIDIHA","UTRAULA","BHADOHI","GHAZIPUR","MIRZAPUR","RENUKOOT ANPARA","SONBHADRA","VARANASI","AGRA","ALIGARH","MATHURA","BADAUN","BAREILLEY","BIJNOR","MORADABAD","PILIBHIT","SHAHJAHANPUR","GHAZIABAD","GREATER NOIDA","MEERUT","NOIDA","SAHARANPUR","DEHRADUN","HARIDWAR","HERBERTPUR","MUSSOORIE","PAURI GARWHAL","ROORKEE","RUDRAPRAYAG","ALMORA","HALDWANI","KASHIPUR","KHATIMA","NAINITAL","PITHORAGARH","RANIKHET","RUDRAPUR","TANAKPUR","MURI","ADITYAPUR","CHAIBASA","CHAKRADHARPUR","GHATSILA-MUSABANI","JAMSHEDPUR","MANGO","MANOHARPUR","GUMLA","KANKE","KHUNTI MURHU","LOHARDAGA","NAMKUM","PISKA NAGRI ITKI","RANCHI","RANCHI SOUTH","SIMDEGA","CHANDWA","CHATRA","DALTANGANJ","GARHWA","HAZARIBAGH","KODARMA","LATEHAR","RAMGARH-BARKHAKANA","BOKARO STEEL CITY","BOKARO THERMAL","DHANBAD","GIRIDIH","GOMOH","JAMTARA","MADHUPUR","BARHARWA","BORIO-SAHEBGANJ","DEOGHAR","DUMKA","GODDA MAHAGAMA","PAKUR - HIRANPUR","ARRAH","BUXAR","DEHRI-ON-SONE","GAYA","JAHANABAD","KAIMUR","PATNA","PATNA WEST","BARH","BHAGALPUR","JAMUI","MUNGER JAMALPUR","NALANDA","NAWADA","BETTIAH","DARBHANGA","HAZIPUR","MOTIHARI","MUZAFFARPUR","RAXAUL","SIWAN","ARARIA","BEGUSARAI","KATIHAR","KHAGARIA","MADHEPURA","PURNIA","BANKURA","ANGUL","BALASORE","BHADRAK","BHUBANESHWAR","CUTTACK","JATNI KHURDA","KURADA","PURI","BIRAMITRAPUR","BRAJRAJNAGAR","JHARSUGUDA","RAJGANGPUR","ROURKELA","SAMBALPUR","SUNDARGARH","JEYPORE","KORAPUT","KOSA GUMUDA","KOTPAD","NABARANGPUR","SUNABEDA","BARGARH","BHAWANIPATNA","BOLANGIR","MUNIGUDA","RAYAGADA","TITLAGARH","BALIGUDA","BERHAMPUR","G.UDAYAGIRI","KURTAMGARH","PARALAKHEMUNDI","RAIKIA","ASANSOL","CHITRANJAN","DURGAPUR","KHARAGPUR","CALCUTTA CENTRAL","CALCUTTA NORTH","CALCUTTA SOUTH","MADHYAMGRAM","SAMSI","FAMBONG-SOMBARIA","GANGTOK","GAYZING","JORETHANG","NAMCHI","SINGTAM","ALIPURDUAR","DARJEELING","JAIGAON","JALPAIGURI","KALIMPONG","KURSEONG","MIRIK","NAXALBARI","SILIGURI","HNATHIAL","LAWNGTLAI","LUNGLEI","NORTH VANLAIPHAI","SIAHA","THENZAWL","AIZAWL EAST","AIZAWL NORTH","AIZAWL SOUTH","AIZAWL WEST","CHAMPHAI","KHAWZAWL","KOLASIB","SERCHHIP","DERGANG","DHALAI","AGARTALA","JAMPUI","KHUMULWNG","SABROOM","SANTIR BAZAR","UDAIPUR-T","JOWAI","KHLIEHRIAT","MAWKYRWAT","NONGPOH","NONGSTOIN","SHILLONG EAST","SHILLONG NORTH","SHILLONG SOUTH","AMPATI","KHARKUTTA","PHULBARI","RESUBELPARA","TURA","WILLIAMNAGAR","BOMDILA","ITANAGAR CITY","NAHARLAGUN","AALO","DAPORIJO","PASIGHAT","ZIRO","LONGDING","MIAO","ROING","TEZU","DIMAPUR EAST","DIMAPUR WEST","CHUMUKEDIMA","JALUKIE","MON","NIULAND","PEREN","CHANGTONGYA","LONGLENG","MOKOKCHUNG","TUENSANG","ZUNHEBOTO","KOHIMA NORTH","KOHIMA SOUTH","KIPHIRE","PFIITSERO","PHEK","TSEMINYU","WOKHA","IMPHAL EAST","IMPHAL WEST","JIRIBAM","KANGPOKPI","SENAPATI","TAMENGLONG","UKHRUL","BISHNUPUR","CHANDEL","CHURACHANDPUR","CHURACHANDPUR NORTH","PALLEL","BAR-E-BRAHMANA","GIDEONS (ISOLATED PLACES)","KANGRA","KASAULI","KATHUA","KOTGARH","BONGAIGAON","GOSAIGAON","GUWAHATI","JAMMU","KATRA","KOKRAJHAR","LEH","RAMPUR","RORHU","SAMBA","SHIMLA","SOLAN","SRINAGAR","UDALGURI","UDHAMPUR","ANNI","CHAMBA","DHARAMSHALA","DIPHU","GOALPARA","HAFLONG","KULLU","LAKHIPUR","LUMDING","MANALI","NALAGARH","PALAMPUR","SILCHAR","SUNDERNAGAR","BISHWANATH","DHEMAJI","LAKHIMPUR","RANGAPARA","TEZPUR","DIBRUGARH","GOLAGHAT","JORHAT","LAKLA","SIBSAGAR","SONARI","TINSUKIA"]
    $('#camp, #campu, #camp1').autocomplete({
        source: availableTags,
        minLength:3,
        delay:500,
        });
});
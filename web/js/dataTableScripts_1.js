
function openNav() {
    document.getElementById("mySidenav").style.width = "225px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}


function agcntchange() {
    var gfamount = 0;
    var gfee = "1300";
    var agcnt = document.getElementById("agcnt").value;
    var aacnt = document.getElementById("aacnt").value;
    var lgcnt = document.getElementById("lgcnt").value;
    var lacnt = document.getElementById("lacnt").value;
    var nagcnt = document.getElementById("nagcnt").value;
    var naacnt = document.getElementById("naacnt").value;
    var nlgcnt = document.getElementById("nlgcnt").value;
    var nlacnt = document.getElementById("nlacnt").value;

    var aafee = document.getElementById("aafee").value;
    var lgfee = document.getElementById("lgfee").value;
    var lafee = document.getElementById("lafee").value;
    var nagfee = document.getElementById("nagfee").value;
    var naafee = document.getElementById("naafee").value;
    var nlgfee = document.getElementById("nlgfee").value;
    var nlafee = document.getElementById("nlafee").value;

    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var splbamount = document.getElementById("splbamount").value;
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);

    var Vagcnt = isNaN(parseInt(agcnt)) ? 0 : parseInt(agcnt);
    var Vaacnt = isNaN(parseInt(aacnt)) ? 0 : parseInt(aacnt);
    var Vlgcnt = isNaN(parseInt(lgcnt)) ? 0 : parseInt(lgcnt);
    var Vlacnt = isNaN(parseInt(lacnt)) ? 0 : parseInt(lacnt);
    var Vnagcnt = isNaN(parseInt(nagcnt)) ? 0 : parseInt(nagcnt);
    var Vnaacnt = isNaN(parseInt(naacnt)) ? 0 : parseInt(naacnt);
    var Vnlgcnt = isNaN(parseInt(nlgcnt)) ? 0 : parseInt(nlgcnt);
    var Vnlacnt = isNaN(parseInt(nlacnt)) ? 0 : parseInt(nlacnt);

    var Vaafee = isNaN(parseInt(aafee)) ? 0 : parseInt(aafee);
    var Vlgfee = isNaN(parseInt(lgfee)) ? 0 : parseInt(lgfee);
    var Vlafee = isNaN(parseInt(lafee)) ? 0 : parseInt(lafee);
    var Vnagfee = isNaN(parseInt(nagfee)) ? 0 : parseInt(nagfee);
    var Vnaafee = isNaN(parseInt(naafee)) ? 0 : parseInt(naafee);
    var Vnlgfee = isNaN(parseInt(nlgfee)) ? 0 : parseInt(nlgfee);
    var Vnlafee = isNaN(parseInt(nlafee)) ? 0 : parseInt(nlafee);

    gfamount = parseInt(Vagcnt) * parseInt(gfee);
    var tot_amount = parseInt(gfamount) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlgfee) + parseInt(Vnlafee);
    var total_amount = parseInt(gfamount) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnaafee) + parseInt(Vnlgfee) + parseInt(Vnlafee) + parseInt(Vpwtamount) + parseInt(Vafamount) + parseInt(Vsplbamount);
    var tot_cnt = parseInt(Vagcnt) + parseInt(Vaacnt) + parseInt(Vlgcnt) + parseInt(Vlacnt) + parseInt(Vnagcnt) + parseInt(Vnaacnt) + parseInt(Vnlgcnt) + parseInt(Vnlacnt);
    document.getElementById("agfee").value = gfamount;
    document.getElementById("mcnt").value = tot_cnt;
    document.getElementById("mfee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function nagcntchange() {
    var gfamount = 0;
    var gfee = "1300";
    var agcnt = document.getElementById("agcnt").value;
    var aacnt = document.getElementById("aacnt").value;
    var lgcnt = document.getElementById("lgcnt").value;
    var lacnt = document.getElementById("lacnt").value;
    var nagcnt = document.getElementById("nagcnt").value;
    var naacnt = document.getElementById("naacnt").value;
    var nlgcnt = document.getElementById("nlgcnt").value;
    var nlacnt = document.getElementById("nlacnt").value;

    var agfee = document.getElementById("agfee").value;
    var aafee = document.getElementById("aafee").value;
    var lgfee = document.getElementById("lgfee").value;
    var lafee = document.getElementById("lafee").value;
    var naafee = document.getElementById("naafee").value;
    var nlgfee = document.getElementById("nlgfee").value;
    var nlafee = document.getElementById("nlafee").value;

    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var splbamount = document.getElementById("splbamount").value;
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);

    var Vagcnt = isNaN(parseInt(agcnt)) ? 0 : parseInt(agcnt);
    var Vaacnt = isNaN(parseInt(aacnt)) ? 0 : parseInt(aacnt);
    var Vlgcnt = isNaN(parseInt(lgcnt)) ? 0 : parseInt(lgcnt);
    var Vlacnt = isNaN(parseInt(lacnt)) ? 0 : parseInt(lacnt);
    var Vnagcnt = isNaN(parseInt(nagcnt)) ? 0 : parseInt(nagcnt);
    var Vnaacnt = isNaN(parseInt(naacnt)) ? 0 : parseInt(naacnt);
    var Vnlgcnt = isNaN(parseInt(nlgcnt)) ? 0 : parseInt(nlgcnt);
    var Vnlacnt = isNaN(parseInt(nlacnt)) ? 0 : parseInt(nlacnt);

    var Vagfee = isNaN(parseInt(agfee)) ? 0 : parseInt(agfee);
    var Vaafee = isNaN(parseInt(aafee)) ? 0 : parseInt(aafee);
    var Vlgfee = isNaN(parseInt(lgfee)) ? 0 : parseInt(lgfee);
    var Vlafee = isNaN(parseInt(lafee)) ? 0 : parseInt(lafee);
    var Vnaafee = isNaN(parseInt(naafee)) ? 0 : parseInt(naafee);
    var Vnlgfee = isNaN(parseInt(nlgfee)) ? 0 : parseInt(nlgfee);
    var Vnlafee = isNaN(parseInt(nlafee)) ? 0 : parseInt(nlafee);

    gfamount = parseInt(Vnagcnt) * parseInt(gfee);
    var tot_amount = parseInt(gfamount) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnaafee) + parseInt(Vnlgfee) + parseInt(Vnlafee);
    var total_amount = parseInt(gfamount) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnaafee) + parseInt(Vnlgfee) + parseInt(Vnlafee) + parseInt(Vpwtamount) + parseInt(Vafamount) + parseInt(Vsplbamount);
    var tot_cnt = parseInt(Vagcnt) + parseInt(Vaacnt) + parseInt(Vlgcnt) + parseInt(Vlacnt) + parseInt(Vnagcnt) + parseInt(Vnaacnt) + parseInt(Vnlgcnt) + parseInt(Vnlacnt);
    document.getElementById("nagfee").value = gfamount;
    document.getElementById("mcnt").value = tot_cnt;
    document.getElementById("mfee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function aacntchange() {
    var afamount = 0;
    var afee = "500";
    var aacnt = document.getElementById("aacnt").value;
    var agcnt = document.getElementById("agcnt").value;
    var lgcnt = document.getElementById("lgcnt").value;
    var lacnt = document.getElementById("lacnt").value;
    var naacnt = document.getElementById("naacnt").value;
    var nagcnt = document.getElementById("nagcnt").value;
    var nlgcnt = document.getElementById("nlgcnt").value;
    var nlacnt = document.getElementById("nlacnt").value;

    var agfee = document.getElementById("agfee").value;
    var lgfee = document.getElementById("lgfee").value;
    var lafee = document.getElementById("lafee").value;
    var nagfee = document.getElementById("nagfee").value;
    var naafee = document.getElementById("naafee").value;
    var nlgfee = document.getElementById("nlgfee").value;
    var nlafee = document.getElementById("nlafee").value;

    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var splbamount = document.getElementById("splbamount").value;
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);

    var Vagcnt = isNaN(parseInt(agcnt)) ? 0 : parseInt(agcnt);
    var Vaacnt = isNaN(parseInt(aacnt)) ? 0 : parseInt(aacnt);
    var Vlgcnt = isNaN(parseInt(lgcnt)) ? 0 : parseInt(lgcnt);
    var Vlacnt = isNaN(parseInt(lacnt)) ? 0 : parseInt(lacnt);
    var Vnagcnt = isNaN(parseInt(nagcnt)) ? 0 : parseInt(nagcnt);
    var Vnaacnt = isNaN(parseInt(naacnt)) ? 0 : parseInt(naacnt);
    var Vnlgcnt = isNaN(parseInt(nlgcnt)) ? 0 : parseInt(nlgcnt);
    var Vnlacnt = isNaN(parseInt(nlacnt)) ? 0 : parseInt(nlacnt);

    var Vagfee = isNaN(parseInt(agfee)) ? 0 : parseInt(agfee);
    var Vlgfee = isNaN(parseInt(lgfee)) ? 0 : parseInt(lgfee);
    var Vlafee = isNaN(parseInt(lafee)) ? 0 : parseInt(lafee);
    var Vnagfee = isNaN(parseInt(nagfee)) ? 0 : parseInt(nagfee);
    var Vnaafee = isNaN(parseInt(naafee)) ? 0 : parseInt(naafee);
    var Vnlgfee = isNaN(parseInt(nlgfee)) ? 0 : parseInt(nlgfee);
    var Vnlafee = isNaN(parseInt(nlafee)) ? 0 : parseInt(nlafee);

    afamount = parseInt(Vaacnt) * parseInt(afee);
    var tot_amount = parseInt(afamount) + parseInt(Vagfee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlgfee) + parseInt(Vnlafee);
    var total_amount = parseInt(afamount) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vagfee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnagfee) + parseInt(Vnlgfee) + parseInt(Vnlafee) + parseInt(Vpwtamount) + parseInt(Vafamount) + parseInt(Vsplbamount);
    var tot_cnt = parseInt(Vagcnt) + parseInt(Vaacnt) + parseInt(Vlgcnt) + parseInt(Vlacnt) + parseInt(Vnagcnt) + parseInt(Vnaacnt) + parseInt(Vnlgcnt) + parseInt(Vnlacnt);
    document.getElementById("aafee").value = afamount;
    document.getElementById("mcnt").value = tot_cnt;
    document.getElementById("mfee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function naacntchange() {
    var afamount = 0;
    var afee = "500";
    var aacnt = document.getElementById("aacnt").value;
    var agcnt = document.getElementById("agcnt").value;
    var lgcnt = document.getElementById("lgcnt").value;
    var lacnt = document.getElementById("lacnt").value;
    var naacnt = document.getElementById("naacnt").value;
    var nagcnt = document.getElementById("nagcnt").value;
    var nlgcnt = document.getElementById("nlgcnt").value;
    var nlacnt = document.getElementById("nlacnt").value;

    var agfee = document.getElementById("agfee").value;
    var aafee = document.getElementById("aafee").value;
    var lgfee = document.getElementById("lgfee").value;
    var lafee = document.getElementById("lafee").value;
    var nagfee = document.getElementById("nagfee").value;
    var nlgfee = document.getElementById("nlgfee").value;
    var nlafee = document.getElementById("nlafee").value;

    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var splbamount = document.getElementById("splbamount").value;
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);

    var Vagcnt = isNaN(parseInt(agcnt)) ? 0 : parseInt(agcnt);
    var Vaacnt = isNaN(parseInt(aacnt)) ? 0 : parseInt(aacnt);
    var Vlgcnt = isNaN(parseInt(lgcnt)) ? 0 : parseInt(lgcnt);
    var Vlacnt = isNaN(parseInt(lacnt)) ? 0 : parseInt(lacnt);
    var Vnagcnt = isNaN(parseInt(nagcnt)) ? 0 : parseInt(nagcnt);
    var Vnaacnt = isNaN(parseInt(naacnt)) ? 0 : parseInt(naacnt);
    var Vnlgcnt = isNaN(parseInt(nlgcnt)) ? 0 : parseInt(nlgcnt);
    var Vnlacnt = isNaN(parseInt(nlacnt)) ? 0 : parseInt(nlacnt);

    var Vagfee = isNaN(parseInt(agfee)) ? 0 : parseInt(agfee);
    var Vaafee = isNaN(parseInt(aafee)) ? 0 : parseInt(aafee);
    var Vlgfee = isNaN(parseInt(lgfee)) ? 0 : parseInt(lgfee);
    var Vlafee = isNaN(parseInt(lafee)) ? 0 : parseInt(lafee);
    var Vnagfee = isNaN(parseInt(nagfee)) ? 0 : parseInt(nagfee);
    var Vnlgfee = isNaN(parseInt(nlgfee)) ? 0 : parseInt(nlgfee);
    var Vnlafee = isNaN(parseInt(nlafee)) ? 0 : parseInt(nlafee);

    afamount = parseInt(Vnaacnt) * parseInt(afee);
    var tot_amount = parseInt(afamount) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnagfee) + parseInt(Vnlgfee) + parseInt(Vnlafee);
    var total_amount = parseInt(afamount) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnagfee) + parseInt(Vnlgfee) + parseInt(Vnlafee) + parseInt(Vpwtamount) + parseInt(Vafamount) + parseInt(Vsplbamount);
    var tot_cnt = parseInt(Vagcnt) + parseInt(Vaacnt) + parseInt(Vlgcnt) + parseInt(Vlacnt) + parseInt(Vnagcnt) + parseInt(Vnaacnt) + parseInt(Vnlgcnt) + parseInt(Vnlacnt);
    document.getElementById("naafee").value = afamount;
    document.getElementById("mcnt").value = tot_cnt;
    document.getElementById("mfee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function lgcntchange() {
    var gfamount = 0;
    var gfee = "20000";
    var agcnt = document.getElementById("agcnt").value;
    var aacnt = document.getElementById("aacnt").value;
    var lgcnt = document.getElementById("lgcnt").value;
    var lacnt = document.getElementById("lacnt").value;
    var nagcnt = document.getElementById("nagcnt").value;
    var naacnt = document.getElementById("naacnt").value;
    var nlgcnt = document.getElementById("nlgcnt").value;
    var nlacnt = document.getElementById("nlacnt").value;

    var agfee = document.getElementById("agfee").value;
    var aafee = document.getElementById("aafee").value;
    var lafee = document.getElementById("lafee").value;
    var nagfee = document.getElementById("nagfee").value;
    var naafee = document.getElementById("naafee").value;
    var nlgfee = document.getElementById("nlgfee").value;
    var nlafee = document.getElementById("nlafee").value;

    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var splbamount = document.getElementById("splbamount").value;
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);

    var Vagcnt = isNaN(parseInt(agcnt)) ? 0 : parseInt(agcnt);
    var Vaacnt = isNaN(parseInt(aacnt)) ? 0 : parseInt(aacnt);
    var Vlgcnt = isNaN(parseInt(lgcnt)) ? 0 : parseInt(lgcnt);
    var Vlacnt = isNaN(parseInt(lacnt)) ? 0 : parseInt(lacnt);
    var Vnagcnt = isNaN(parseInt(nagcnt)) ? 0 : parseInt(nagcnt);
    var Vnaacnt = isNaN(parseInt(naacnt)) ? 0 : parseInt(naacnt);
    var Vnlgcnt = isNaN(parseInt(nlgcnt)) ? 0 : parseInt(nlgcnt);
    var Vnlacnt = isNaN(parseInt(nlacnt)) ? 0 : parseInt(nlacnt);

    var Vagfee = isNaN(parseInt(agfee)) ? 0 : parseInt(agfee);
    var Vaafee = isNaN(parseInt(aafee)) ? 0 : parseInt(aafee);
    var Vlafee = isNaN(parseInt(lafee)) ? 0 : parseInt(lafee);
    var Vnagfee = isNaN(parseInt(nagfee)) ? 0 : parseInt(nagfee);
    var Vnaafee = isNaN(parseInt(naafee)) ? 0 : parseInt(naafee);
    var Vnlgfee = isNaN(parseInt(nlgfee)) ? 0 : parseInt(nlgfee);
    var Vnlafee = isNaN(parseInt(nlafee)) ? 0 : parseInt(nlafee);

    gfamount = parseInt(Vlgcnt) * parseInt(gfee);
    var tot_amount = parseInt(gfamount) + parseInt(Vlafee) + parseInt(Vaafee) + parseInt(Vagfee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlgfee) + parseInt(Vnlafee);
    var total_amount = parseInt(gfamount) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vlafee) + parseInt(Vaafee) + parseInt(Vagfee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlafee) + parseInt(Vpwtamount) + parseInt(Vafamount) + parseInt(Vsplbamount);
    var tot_cnt = parseInt(Vagcnt) + parseInt(Vaacnt) + parseInt(Vlgcnt) + parseInt(Vlacnt) + parseInt(Vnagcnt) + parseInt(Vnaacnt) + parseInt(Vnlgcnt) + parseInt(Vnlacnt);
    document.getElementById("lgfee").value = gfamount;
    document.getElementById("mcnt").value = tot_cnt;
    document.getElementById("mfee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function nlgcntchange() {
    var gfamount = 0;
    var gfee = "20000";
    var agcnt = document.getElementById("agcnt").value;
    var aacnt = document.getElementById("aacnt").value;
    var lgcnt = document.getElementById("lgcnt").value;
    var lacnt = document.getElementById("lacnt").value;
    var nagcnt = document.getElementById("nagcnt").value;
    var naacnt = document.getElementById("naacnt").value;
    var nlgcnt = document.getElementById("nlgcnt").value;
    var nlacnt = document.getElementById("nlacnt").value;

    var agfee = document.getElementById("agfee").value;
    var aafee = document.getElementById("aafee").value;
    var lgfee = document.getElementById("lgfee").value;
    var lafee = document.getElementById("lafee").value;
    var nagfee = document.getElementById("nagfee").value;
    var naafee = document.getElementById("naafee").value;
    var nlafee = document.getElementById("nlafee").value;

    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var splbamount = document.getElementById("splbamount").value;
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);

    var Vagcnt = isNaN(parseInt(agcnt)) ? 0 : parseInt(agcnt);
    var Vaacnt = isNaN(parseInt(aacnt)) ? 0 : parseInt(aacnt);
    var Vlgcnt = isNaN(parseInt(lgcnt)) ? 0 : parseInt(lgcnt);
    var Vlacnt = isNaN(parseInt(lacnt)) ? 0 : parseInt(lacnt);
    var Vnagcnt = isNaN(parseInt(nagcnt)) ? 0 : parseInt(nagcnt);
    var Vnaacnt = isNaN(parseInt(naacnt)) ? 0 : parseInt(naacnt);
    var Vnlgcnt = isNaN(parseInt(nlgcnt)) ? 0 : parseInt(nlgcnt);
    var Vnlacnt = isNaN(parseInt(nlacnt)) ? 0 : parseInt(nlacnt);

    var Vagfee = isNaN(parseInt(agfee)) ? 0 : parseInt(agfee);
    var Vaafee = isNaN(parseInt(aafee)) ? 0 : parseInt(aafee);
    var Vlgfee = isNaN(parseInt(lgfee)) ? 0 : parseInt(lgfee);
    var Vlafee = isNaN(parseInt(lafee)) ? 0 : parseInt(lafee);
    var Vnagfee = isNaN(parseInt(nagfee)) ? 0 : parseInt(nagfee);
    var Vnaafee = isNaN(parseInt(naafee)) ? 0 : parseInt(naafee);
    var Vnlafee = isNaN(parseInt(nlafee)) ? 0 : parseInt(nlafee);

    gfamount = parseInt(Vnlgcnt) * parseInt(gfee);
    var tot_amount = parseInt(gfamount) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlafee);
    var total_amount = parseInt(gfamount) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlafee) + parseInt(Vpwtamount) + parseInt(Vafamount) + parseInt(Vsplbamount);
    var tot_cnt = parseInt(Vagcnt) + parseInt(Vaacnt) + parseInt(Vlgcnt) + parseInt(Vlacnt) + parseInt(Vnagcnt) + parseInt(Vnaacnt) + parseInt(Vnlgcnt) + parseInt(Vnlacnt);
    document.getElementById("nlgfee").value = gfamount;
    document.getElementById("mcnt").value = tot_cnt;
    document.getElementById("mfee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function lacntchange() {
    var afamount = 0;
    var afee = "5000";
    var agcnt = document.getElementById("agcnt").value;
    var aacnt = document.getElementById("aacnt").value;
    var lgcnt = document.getElementById("lgcnt").value;
    var lacnt = document.getElementById("lacnt").value;
    var nagcnt = document.getElementById("nagcnt").value;
    var naacnt = document.getElementById("naacnt").value;
    var nlgcnt = document.getElementById("nlgcnt").value;
    var nlacnt = document.getElementById("nlacnt").value;

    var agfee = document.getElementById("agfee").value;
    var aafee = document.getElementById("aafee").value;
    var lgfee = document.getElementById("lgfee").value;

    var nagfee = document.getElementById("nagfee").value;
    var naafee = document.getElementById("naafee").value;
    var nlgfee = document.getElementById("nlgfee").value;
    var nlafee = document.getElementById("nlafee").value;

    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var splbamount = document.getElementById("splbamount").value;
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);

    var Vagcnt = isNaN(parseInt(agcnt)) ? 0 : parseInt(agcnt);
    var Vaacnt = isNaN(parseInt(aacnt)) ? 0 : parseInt(aacnt);
    var Vlgcnt = isNaN(parseInt(lgcnt)) ? 0 : parseInt(lgcnt);
    var Vlacnt = isNaN(parseInt(lacnt)) ? 0 : parseInt(lacnt);
    var Vnagcnt = isNaN(parseInt(nagcnt)) ? 0 : parseInt(nagcnt);
    var Vnaacnt = isNaN(parseInt(naacnt)) ? 0 : parseInt(naacnt);
    var Vnlgcnt = isNaN(parseInt(nlgcnt)) ? 0 : parseInt(nlgcnt);
    var Vnlacnt = isNaN(parseInt(nlacnt)) ? 0 : parseInt(nlacnt);

    var Vagfee = isNaN(parseInt(agfee)) ? 0 : parseInt(agfee);
    var Vaafee = isNaN(parseInt(aafee)) ? 0 : parseInt(aafee);
    var Vlgfee = isNaN(parseInt(lgfee)) ? 0 : parseInt(lgfee);
    var Vnagfee = isNaN(parseInt(nagfee)) ? 0 : parseInt(nagfee);
    var Vnaafee = isNaN(parseInt(naafee)) ? 0 : parseInt(naafee);
    var Vnlgfee = isNaN(parseInt(nlgfee)) ? 0 : parseInt(nlgfee);
    var Vnlafee = isNaN(parseInt(nlafee)) ? 0 : parseInt(nlafee);

    afamount = parseInt(Vlacnt) * parseInt(afee);
    var tot_amount = parseInt(afamount) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlgfee) + parseInt(Vnlafee);
    var total_amount = parseInt(afamount) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlgfee) + parseInt(Vnlafee) + parseInt(Vpwtamount) + parseInt(Vafamount) + parseInt(Vsplbamount);
    var tot_cnt = parseInt(Vagcnt) + parseInt(Vaacnt) + parseInt(Vlgcnt) + parseInt(Vlacnt) + parseInt(Vnagcnt) + parseInt(Vnaacnt) + parseInt(Vnlgcnt) + parseInt(Vnlacnt);
    document.getElementById("lafee").value = afamount;
    document.getElementById("mcnt").value = tot_cnt;
    document.getElementById("mfee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function nlacntchange() {
    var afamount = 0;
    var afee = "5000";
    var agcnt = document.getElementById("agcnt").value;
    var aacnt = document.getElementById("aacnt").value;
    var lgcnt = document.getElementById("lgcnt").value;
    var lacnt = document.getElementById("lacnt").value;
    var nagcnt = document.getElementById("nagcnt").value;
    var naacnt = document.getElementById("naacnt").value;
    var nlgcnt = document.getElementById("nlgcnt").value;
    var nlacnt = document.getElementById("nlacnt").value;

    var agfee = document.getElementById("agfee").value;
    var aafee = document.getElementById("aafee").value;
    var lgfee = document.getElementById("lgfee").value;
    var lafee = document.getElementById("lafee").value;
    var nagfee = document.getElementById("nagfee").value;
    var naafee = document.getElementById("naafee").value;
    var nlgfee = document.getElementById("nlgfee").value;

    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var splbamount = document.getElementById("splbamount").value;
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);

    var Vagcnt = isNaN(parseInt(agcnt)) ? 0 : parseInt(agcnt);
    var Vaacnt = isNaN(parseInt(aacnt)) ? 0 : parseInt(aacnt);
    var Vlgcnt = isNaN(parseInt(lgcnt)) ? 0 : parseInt(lgcnt);
    var Vlacnt = isNaN(parseInt(lacnt)) ? 0 : parseInt(lacnt);
    var Vnagcnt = isNaN(parseInt(nagcnt)) ? 0 : parseInt(nagcnt);
    var Vnaacnt = isNaN(parseInt(naacnt)) ? 0 : parseInt(naacnt);
    var Vnlgcnt = isNaN(parseInt(nlgcnt)) ? 0 : parseInt(nlgcnt);
    var Vnlacnt = isNaN(parseInt(nlacnt)) ? 0 : parseInt(nlacnt);

    var Vagfee = isNaN(parseInt(agfee)) ? 0 : parseInt(agfee);
    var Vaafee = isNaN(parseInt(aafee)) ? 0 : parseInt(aafee);
    var Vlgfee = isNaN(parseInt(lgfee)) ? 0 : parseInt(lgfee);
    var Vlafee = isNaN(parseInt(lafee)) ? 0 : parseInt(lafee);
    var Vnagfee = isNaN(parseInt(nagfee)) ? 0 : parseInt(nagfee);
    var Vnaafee = isNaN(parseInt(naafee)) ? 0 : parseInt(naafee);
    var Vnlgfee = isNaN(parseInt(nlgfee)) ? 0 : parseInt(nlgfee);

    afamount = parseInt(Vnlacnt) * parseInt(afee);
    var tot_amount = parseInt(afamount) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlgfee);
    var total_amount = parseInt(afamount) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vagfee) + parseInt(Vaafee) + parseInt(Vlgfee) + parseInt(Vlafee) + parseInt(Vnagfee) + parseInt(Vnaafee) + parseInt(Vnlgfee) + parseInt(Vpwtamount) + parseInt(Vafamount) + parseInt(Vsplbamount);
    var tot_cnt = parseInt(Vagcnt) + parseInt(Vaacnt) + parseInt(Vlgcnt) + parseInt(Vlacnt) + parseInt(Vnagcnt) + parseInt(Vnaacnt) + parseInt(Vnlgcnt) + parseInt(Vnlacnt);
    document.getElementById("nlafee").value = afamount;
    document.getElementById("mcnt").value = tot_cnt;
    document.getElementById("mfee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function nccamountchange() {
    var nccamount = document.getElementById("nccamount").value;
    var sccamount = document.getElementById("sccamount").value;
    var cafamount = document.getElementById("cafamount").value;
    var Vnccamount = isNaN(parseInt(nccamount)) ? 0 : parseInt(nccamount);
    var Vsccamount = isNaN(parseInt(sccamount)) ? 0 : parseInt(sccamount);
    var Vcafamount = isNaN(parseInt(cafamount)) ? 0 : parseInt(cafamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var tot_amount = parseInt(Vnccamount) + parseInt(Vsccamount) + parseInt(Vcafamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount);
    var Vtot_amount = isNaN(parseInt(tot_amount)) ? 0 : parseInt(tot_amount);
    var Vtotal_amount = isNaN(parseInt(total_amount)) ? 0 : parseInt(total_amount);
    document.getElementById("afamount").value = Vtot_amount;
    document.getElementById("total_amount").value = Vtotal_amount;
    document.getElementById("tramount").value = Vtotal_amount;
}


function sccamountchange() {
    var nccamount = document.getElementById("nccamount").value;
    var sccamount = document.getElementById("sccamount").value;
    var cafamount = document.getElementById("cafamount").value;
    var Vnccamount = isNaN(parseInt(nccamount)) ? 0 : parseInt(nccamount);
    var Vsccamount = isNaN(parseInt(sccamount)) ? 0 : parseInt(sccamount);
    var Vcafamount = isNaN(parseInt(cafamount)) ? 0 : parseInt(cafamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var tot_amount = parseInt(Vnccamount) + parseInt(Vsccamount) + parseInt(Vcafamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount);
    var Vtot_amount = isNaN(parseInt(tot_amount)) ? 0 : parseInt(tot_amount);
    var Vtotal_amount = isNaN(parseInt(total_amount)) ? 0 : parseInt(total_amount);
    document.getElementById("afamount").value = Vtot_amount;
    document.getElementById("total_amount").value = Vtotal_amount;
    document.getElementById("tramount").value = Vtotal_amount;
}


function cafamountchange() {
    var nccamount = document.getElementById("nccamount").value;
    var sccamount = document.getElementById("sccamount").value;
    var cafamount = document.getElementById("cafamount").value;
    var Vnccamount = isNaN(parseInt(nccamount)) ? 0 : parseInt(nccamount);
    var Vsccamount = isNaN(parseInt(sccamount)) ? 0 : parseInt(sccamount);
    var Vcafamount = isNaN(parseInt(cafamount)) ? 0 : parseInt(cafamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var tot_amount = parseInt(Vnccamount) + parseInt(Vsccamount) + parseInt(Vcafamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount);
    var Vtot_amount = isNaN(parseInt(tot_amount)) ? 0 : parseInt(tot_amount);
    var Vtotal_amount = isNaN(parseInt(total_amount)) ? 0 : parseInt(total_amount);
    document.getElementById("afamount").value = Vtot_amount;
    document.getElementById("total_amount").value = Vtotal_amount;
    document.getElementById("tramount").value = Vtotal_amount;
}


function pwtgcntchange() {
    var pwtgcnt = document.getElementById("pwtgcnt").value;
    var pwtacnt = document.getElementById("pwtacnt").value;
    var pwthbcnt = document.getElementById("pwthbcnt").value;
    var pwtlbcnt = document.getElementById("pwtlbcnt").value;

    var pwtgamount = document.getElementById("pwtgamount").value;
    var pwtaamount = document.getElementById("pwtaamount").value;
    var pwthbamount = document.getElementById("pwthbamount").value;
    var pwtlbamount = document.getElementById("pwtlbamount").value;
    var Vpwtgcnt = isNaN(parseInt(pwtgcnt)) ? 0 : parseInt(pwtgcnt);
    var Vpwtacnt = isNaN(parseInt(pwtacnt)) ? 0 : parseInt(pwtacnt);
    var Vpwthbcnt = isNaN(parseInt(pwthbcnt)) ? 0 : parseInt(pwthbcnt);
    var Vpwtlbcnt = isNaN(parseInt(pwtlbcnt)) ? 0 : parseInt(pwtlbcnt);
    var Vpwtgamount = isNaN(parseInt(pwtgamount)) ? 0 : parseInt(pwtgamount);
    var Vpwtaamount = isNaN(parseInt(pwtaamount)) ? 0 : parseInt(pwtaamount);
    var Vpwthbamount = isNaN(parseInt(pwthbamount)) ? 0 : parseInt(pwthbamount);
    var Vpwtlbamount = isNaN(parseInt(pwtlbamount)) ? 0 : parseInt(pwtlbamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);

    pwtgamount = parseInt(Vpwtgamount);
    var tot_cnt = parseInt(Vpwtgcnt) + parseInt(Vpwtacnt) + parseInt(Vpwthbcnt) + parseInt(Vpwtlbcnt);
    var Vtot_cnt = isNaN(parseInt(tot_cnt)) ? 0 : parseInt(tot_cnt);
    var total_amount = parseInt(pwtgamount) + parseInt(Vpwtaamount) + parseInt(Vpwthbamount) + parseInt(Vpwtlbamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vafamount);
    var Vtotal_amount = isNaN(parseInt(total_amount)) ? 0 : parseInt(total_amount);
    var tot_amount = parseInt(pwtgamount) + parseInt(Vpwtaamount) + parseInt(Vpwthbamount) + parseInt(Vpwtlbamount);
    var Vtot_amount = isNaN(parseInt(tot_amount)) ? 0 : parseInt(tot_amount);
    document.getElementById("pwtcnt").value = Vtot_cnt;
    document.getElementById("pwtamount").value = Vtot_amount;
    document.getElementById("total_amount").value = Vtotal_amount;
    document.getElementById("tramount").value = total_amount;
}


function pwtacntchange() {
    pwtgcntchange();
}


function pwthbcntchange() {
    pwtgcntchange();
}


function pwtlbcntchange() {
    pwtgcntchange();
}


function slimlinecntchange() {
    var slamount = 0;
    var sl = "250";
    var slcnt = document.getElementById("slcnt").value;
    var dicnt = document.getElementById("dicnt").value;
    var diicnt = document.getElementById("diincnt").value;

    var diamount = document.getElementById("diamount").value;
    var diiamount = document.getElementById("diinamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vslcnt = isNaN(parseInt(slcnt)) ? 0 : parseInt(slcnt);
    var Vdicnt = isNaN(parseInt(dicnt)) ? 0 : parseInt(dicnt);
    var Vdiicnt = isNaN(parseInt(diicnt)) ? 0 : parseInt(diicnt);
    var Vdiamount = isNaN(parseInt(diamount)) ? 0 : parseInt(diamount);
    var Vdiiamount = isNaN(parseInt(diiamount)) ? 0 : parseInt(diiamount);

    slamount = parseInt(Vslcnt) * parseInt(sl);
    var tot_cnt = parseInt(Vslcnt) + parseInt(Vdicnt) + parseInt(Vdiicnt);
    var total_amount = parseInt(slamount) + parseInt(Vdiamount) + parseInt(Vdiiamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_amount = parseInt(slamount) + parseInt(Vdiamount) + parseInt(Vdiiamount);
    var Vtot_cnt = isNaN(parseInt(tot_cnt)) ? 0 : parseInt(tot_cnt);
    var Vtot_amount = isNaN(parseInt(tot_amount)) ? 0 : parseInt(tot_amount);
    var Vtotal_amount = isNaN(parseInt(total_amount)) ? 0 : parseInt(total_amount);
    document.getElementById("splbcnt").value = Vtot_cnt;
    document.getElementById("slamount").value = slamount;
    document.getElementById("splbamount").value = Vtot_amount;
    document.getElementById("total_amount").value = Vtotal_amount;
    document.getElementById("tramount").value = total_amount;
}


function dicntchange() {
    var diamount = 0;
    var di = "600";
    var slcnt = document.getElementById("slcnt").value;
    var dicnt = document.getElementById("dicnt").value;
    var diicnt = document.getElementById("diincnt").value;

    var slamount = document.getElementById("slamount").value;
    var diiamount = document.getElementById("diinamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vslcnt = isNaN(parseInt(slcnt)) ? 0 : parseInt(slcnt);
    var Vdicnt = isNaN(parseInt(dicnt)) ? 0 : parseInt(dicnt);
    var Vdiicnt = isNaN(parseInt(diicnt)) ? 0 : parseInt(diicnt);
    var Vslamount = isNaN(parseInt(slamount)) ? 0 : parseInt(slamount);
    var Vdiiamount = isNaN(parseInt(diiamount)) ? 0 : parseInt(diiamount);

    diamount = parseInt(Vdicnt) * parseInt(di);
    var tot_cnt = parseInt(Vdicnt) + parseInt(Vslcnt) + parseInt(Vdiicnt);
    var total_amount = parseInt(diamount) + parseInt(Vslamount) + parseInt(Vdiiamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_amount = parseInt(diamount) + parseInt(Vslamount) + parseInt(Vdiiamount);
    var Vtot_cnt = isNaN(parseInt(tot_cnt)) ? 0 : parseInt(tot_cnt);
    var Vtot_amount = isNaN(parseInt(tot_amount)) ? 0 : parseInt(tot_amount);
    var Vtotal_amount = isNaN(parseInt(total_amount)) ? 0 : parseInt(total_amount);
    document.getElementById("splbcnt").value = Vtot_cnt;
    document.getElementById("diamount").value = diamount;
    document.getElementById("splbamount").value = Vtot_amount;
    document.getElementById("total_amount").value = Vtotal_amount;
    document.getElementById("tramount").value = total_amount;
}


function diicntchange() {
    var diinamount = 0;
    var diin = "1200";
    var slcnt = document.getElementById("slcnt").value;
    var dicnt = document.getElementById("dicnt").value;
    var diincnt = document.getElementById("diincnt").value;

    var slamount = document.getElementById("slamount").value;
    var diamount = document.getElementById("diamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vslcnt = isNaN(parseInt(slcnt)) ? 0 : parseInt(slcnt);
    var Vdicnt = isNaN(parseInt(dicnt)) ? 0 : parseInt(dicnt);
    var Vdiincnt = isNaN(parseInt(diincnt)) ? 0 : parseInt(diincnt);
    var Vslamount = isNaN(parseInt(slamount)) ? 0 : parseInt(slamount);
    var Vdiamount = isNaN(parseInt(diamount)) ? 0 : parseInt(diamount);

    diinamount = parseInt(Vdiincnt) * parseInt(diin);
    var tot_cnt = parseInt(Vdiincnt) + parseInt(Vslcnt) + parseInt(Vdicnt);
    var total_amount = parseInt(diinamount) + parseInt(Vslamount) + parseInt(Vdiamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsf2fee) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_amount = parseInt(diinamount) + parseInt(Vslamount) + parseInt(Vdiamount);
    var Vtot_cnt = isNaN(parseInt(tot_cnt)) ? 0 : parseInt(tot_cnt);
    var Vtot_amount = isNaN(parseInt(tot_amount)) ? 0 : parseInt(tot_amount);
    var Vtotal_amount = isNaN(parseInt(total_amount)) ? 0 : parseInt(total_amount);
    document.getElementById("splbcnt").value = Vtot_cnt;
    document.getElementById("diinamount").value = diinamount;
    document.getElementById("splbamount").value = Vtot_amount;
    document.getElementById("total_amount").value = Vtotal_amount;
    document.getElementById("tramount").value = total_amount;
}


function ggbcntchange() {
    var ggbamount = 0;
    var ggbfee = "35";
    var stickerscnt = document.getElementById("stickerscnt").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var geamount = document.getElementById("geamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);

    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    ggbamount = parseInt(Vggbcnt) * parseInt(ggbfee);
    var tot_amount = parseInt(ggbamount) + parseInt(Vstickersamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(ggbamount) + parseInt(Vstickersamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vstickerscnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt) + parseInt(Vfmcnt);
    document.getElementById("ggbamount").value = ggbamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function agbcntchange() {
    var agbamount = 0;
    var agbfee = "20";
    var stickerscnt = document.getElementById("stickerscnt").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var geamount = document.getElementById("geamount").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var ggbamount = document.getElementById("ggbamount").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);

    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    agbamount = parseInt(Vagbcnt) * parseInt(agbfee);
    var tot_amount = parseInt(agbamount) + parseInt(Vggbamount) + parseInt(Vstickersamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(agbamount) + parseInt(Vggbamount) + parseInt(Vstickersamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vstickerscnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt) + parseInt(Vfmcnt);
    document.getElementById("agbamount").value = agbamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function gecntchange() {
    var geamount = 0;
    var gefee = "80";
    var stickerscnt = document.getElementById("stickerscnt").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var ggbamount = document.getElementById("ggbamount").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);

    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    geamount = parseInt(Vgecnt) * parseInt(gefee);
    var tot_amount = parseInt(geamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vstickersamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(geamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vstickersamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vstickerscnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt) + parseInt(Vfmcnt);
    document.getElementById("geamount").value = geamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function aecntchange() {
    var aeamount = 0;
    var aefee = "80";
    var stickerscnt = document.getElementById("stickerscnt").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var geamount = document.getElementById("geamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var ggbamount = document.getElementById("ggbamount").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);

    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    aeamount = parseInt(Vaecnt) * parseInt(aefee);
    var tot_amount = parseInt(aeamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vstickersamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(aeamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vstickersamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vstickerscnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt) + parseInt(Vfmcnt);
    document.getElementById("aeamount").value = aeamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function tbcntchange() {
    var tbamount = 0;
    var tbfee = "10";
    var stickerscnt = document.getElementById("stickerscnt").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var geamount = document.getElementById("geamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var ggbamount = document.getElementById("ggbamount").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);

    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    tbamount = parseInt(Vtbcnt) * parseInt(tbfee);
    var tot_amount = parseInt(tbamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vstickersamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(tbamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vstickersamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vstickerscnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt) + parseInt(Vfmcnt);
    document.getElementById("tbamount").value = tbamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function sbcntchange() {
    var sbamount = 0;
    var sbfee = "20";
    var stickerscnt = document.getElementById("stickerscnt").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var geamount = document.getElementById("geamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var ggbamount = document.getElementById("ggbamount").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);
    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    sbamount = parseInt(Vsbcnt) * parseInt(sbfee);
    var tot_amount = parseInt(sbamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vstickersamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(sbamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vstickersamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vstickerscnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt) + parseInt(Vfmcnt);
    document.getElementById("sbamount").value = sbamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function pwcntchange() {
    var pwamount = 0;
    var pwfee = "50";
    var stickerscnt = document.getElementById("stickerscnt").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var geamount = document.getElementById("geamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var ggbamount = document.getElementById("ggbamount").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);

    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    pwamount = parseInt(Vpwcnt) * parseInt(pwfee);
    var tot_amount = parseInt(pwamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vstickersamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(pwamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vstickersamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vstickerscnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt) + parseInt(Vfmcnt);
    document.getElementById("pwamount").value = pwamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function stickerscntchange() {
    var stickersamount = 0;
    var stickersfee = "25";
    var stickerscnt = document.getElementById("stickerscnt").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var geamount = document.getElementById("geamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var ggbamount = document.getElementById("ggbamount").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);

    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    stickersamount = parseInt(Vstickerscnt) * parseInt(stickersfee);
    var tot_amount = parseInt(stickersamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(stickersamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vstickerscnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt) + parseInt(Vfmcnt);
    document.getElementById("stickersamount").value = stickersamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function fmcntchange() {
    var fmamount = 0;
    var fmfee = "20";
    var fmcnt = document.getElementById("fmcnt").value;
    var stickerscnt = document.getElementById("stickerscnt").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var geamount = document.getElementById("geamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var ggbamount = document.getElementById("ggbamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    fmamount = parseInt(Vfmcnt) * parseInt(fmfee);
    var tot_amount = parseInt(fmamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vstickersamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(fmamount) + parseInt(Vstickersamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vncdvdamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vfmcnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vstickerscnt) + parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt);
    document.getElementById("fmamount").value = fmamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function icdvdcntchange() {
    var icdvdamount = 0;
    var icdvdfee = "350";
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var stickerscnt = document.getElementById("stickerscnt").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var geamount = document.getElementById("geamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var ggbamount = document.getElementById("ggbamount").value;
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var ncdvdamount = document.getElementById("ncdvdamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vncdvdamount = isNaN(parseInt(ncdvdamount)) ? 0 : parseInt(ncdvdamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    icdvdamount = parseInt(Vicdvdcnt) * parseInt(icdvdfee);
    var tot_amount = parseInt(icdvdamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vstickersamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount);
    var total_amount = parseInt(icdvdamount) + parseInt(Vstickersamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vncdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vicdvdcnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vstickerscnt) + parseInt(Vfmcnt) + parseInt(Vncdvdcnt);
    document.getElementById("icdvdamount").value = icdvdamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function ncdvdcntchange() {
    var ncdvdamount = 0;
    var ncdvdfee = "350";
    var ncdvdcnt = document.getElementById("ncdvdcnt").value;
    var fmcnt = document.getElementById("fmcnt").value;
    var fmamount = document.getElementById("fmamount").value;
    var stickerscnt = document.getElementById("stickerscnt").value;
    var stickersamount = document.getElementById("stickersamount").value;
    var icdvdcnt = document.getElementById("icdvdcnt").value;
    var icdvdamount = document.getElementById("icdvdamount").value;
    var pwcnt = document.getElementById("pwcnt").value;
    var sbcnt = document.getElementById("sbcnt").value;
    var tbcnt = document.getElementById("tbcnt").value;
    var aecnt = document.getElementById("aecnt").value;
    var gecnt = document.getElementById("gecnt").value;
    var agbcnt = document.getElementById("agbcnt").value;
    var ggbcnt = document.getElementById("ggbcnt").value;
    var pwamount = document.getElementById("pwamount").value;
    var sbamount = document.getElementById("sbamount").value;
    var tbamount = document.getElementById("tbamount").value;
    var aeamount = document.getElementById("aeamount").value;
    var geamount = document.getElementById("geamount").value;
    var agbamount = document.getElementById("agbamount").value;
    var ggbamount = document.getElementById("ggbamount").value;

    var Vfmcnt = isNaN(parseInt(fmcnt)) ? 0 : parseInt(fmcnt);
    var Vfmamount = isNaN(parseInt(fmamount)) ? 0 : parseInt(fmamount);
    var Vstickerscnt = isNaN(parseInt(stickerscnt)) ? 0 : parseInt(stickerscnt);
    var Vstickersamount = isNaN(parseInt(stickersamount)) ? 0 : parseInt(stickersamount);
    var Vncdvdcnt = isNaN(parseInt(ncdvdcnt)) ? 0 : parseInt(ncdvdcnt);
    var Vicdvdcnt = isNaN(parseInt(icdvdcnt)) ? 0 : parseInt(icdvdcnt);
    var Vicdvdamount = isNaN(parseInt(icdvdamount)) ? 0 : parseInt(icdvdamount);
    var Vpwcnt = isNaN(parseInt(pwcnt)) ? 0 : parseInt(pwcnt);
    var Vsbcnt = isNaN(parseInt(sbcnt)) ? 0 : parseInt(sbcnt);
    var Vtbcnt = isNaN(parseInt(tbcnt)) ? 0 : parseInt(tbcnt);
    var Vaecnt = isNaN(parseInt(aecnt)) ? 0 : parseInt(aecnt);
    var Vgecnt = isNaN(parseInt(gecnt)) ? 0 : parseInt(gecnt);
    var Vagbcnt = isNaN(parseInt(agbcnt)) ? 0 : parseInt(agbcnt);
    var Vggbcnt = isNaN(parseInt(ggbcnt)) ? 0 : parseInt(ggbcnt);
    var Vpwamount = isNaN(parseInt(pwamount)) ? 0 : parseInt(pwamount);
    var Vsbamount = isNaN(parseInt(sbamount)) ? 0 : parseInt(sbamount);
    var Vtbamount = isNaN(parseInt(tbamount)) ? 0 : parseInt(tbamount);
    var Vaeamount = isNaN(parseInt(aeamount)) ? 0 : parseInt(aeamount);
    var Vgeamount = isNaN(parseInt(geamount)) ? 0 : parseInt(geamount);
    var Vagbamount = isNaN(parseInt(agbamount)) ? 0 : parseInt(agbamount);
    var Vggbamount = isNaN(parseInt(ggbamount)) ? 0 : parseInt(ggbamount);

    var mfee = document.getElementById("mfee").value;
    var sf1fee = document.getElementById("sf1fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf1fee = isNaN(parseInt(sf1fee)) ? 0 : parseInt(sf1fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    ncdvdamount = parseInt(Vncdvdcnt) * parseInt(ncdvdfee);
    var tot_amount = parseInt(ncdvdamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vstickersamount) + parseInt(Vfmamount) + parseInt(Vicdvdamount);
    var total_amount = parseInt(ncdvdamount) + parseInt(Vstickersamount) + parseInt(Vggbamount) + parseInt(Vagbamount) + parseInt(Vgeamount) + parseInt(Vaeamount) + parseInt(Vtbamount) + parseInt(Vsbamount) + parseInt(Vpwamount) + parseInt(Vfmamount) + parseInt(Vicdvdamount) + parseInt(Vmfee) + parseInt(Vsf1fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    var tot_cnt = parseInt(Vncdvdcnt) + parseInt(Vicdvdcnt) + parseInt(Vpwcnt) + parseInt(Vsbcnt) + parseInt(Vtbcnt) + parseInt(Vaecnt) + parseInt(Vgecnt) + parseInt(Vagbcnt) + parseInt(Vggbcnt) + parseInt(Vstickerscnt) + parseInt(Vfmcnt);
    document.getElementById("ncdvdamount").value = ncdvdamount;
    document.getElementById("sf2cnt").value = tot_cnt;
    document.getElementById("sf2fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;

}

function crochange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vffbamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function ncrochange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vffbamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function scrochange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vffbamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function gcbpchange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function pabchange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
    if (Vpabamount > 0) {
        alert("Kindly note :\n\nPlease provide the Date of PAB Event");
        document.getElementById("pabdatec").hidden = false;
    } else {
        document.getElementById("pabdatec").hidden = true;
    }
}


function ncpabchange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function scpabchange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function ffrchange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
    if (Vfframount > 0) {
        alert("Kindly note :\n\nPlease provide the Date of FFR Event");
        document.getElementById("ffrdatec").hidden = false;
    } else {
        document.getElementById("ffrdatec").hidden = true;
    }
}


function ffgchange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function ffachange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);

    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function ffochange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);

    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function ffbchange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function splochange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function ncogchange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function ncoachange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function scogchange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function scoachange() {
    var croamount = document.getElementById("croamount").value;
    var ncroamount = document.getElementById("ncroamount").value;
    var scroamount = document.getElementById("scroamount").value;
    var ffbamount = document.getElementById("ffbamount").value;
    var Vcroamount = isNaN(parseInt(croamount)) ? 0 : parseInt(croamount);
    var Vncroamount = isNaN(parseInt(ncroamount)) ? 0 : parseInt(ncroamount);
    var Vscroamount = isNaN(parseInt(scroamount)) ? 0 : parseInt(scroamount);
    var Vffbamount = isNaN(parseInt(ffbamount)) ? 0 : parseInt(ffbamount);
    var pabamount = document.getElementById("pabamount").value;
    var fframount = document.getElementById("fframount").value;
    var gcbpamount = document.getElementById("gcbpamount").value;
    var ffgamount = document.getElementById("ffgamount").value;
    var ffaamount = document.getElementById("ffaamount").value;
    var ffoamount = document.getElementById("ffoamount").value;
    var sploamount = document.getElementById("sploamount").value;
    var ncogamount = document.getElementById("ncogamount").value;
    var ncoaamount = document.getElementById("ncoaamount").value;
    var scogamount = document.getElementById("scogamount").value;
    var scoaamount = document.getElementById("scoaamount").value;

    var mfee = document.getElementById("mfee").value;
    var sf2fee = document.getElementById("sf2fee").value;
    var splbamount = document.getElementById("splbamount").value;
    var afamount = document.getElementById("afamount").value;
    var pwtamount = document.getElementById("pwtamount").value;
    var ncpabamount = document.getElementById("ncpabamount").value;
    var scpabamount = document.getElementById("scpabamount").value;
    var Vncpabamount = isNaN(parseInt(ncpabamount)) ? 0 : parseInt(ncpabamount);
    var Vscpabamount = isNaN(parseInt(scpabamount)) ? 0 : parseInt(scpabamount);
    var Vmfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);
    var Vsf2fee = isNaN(parseInt(sf2fee)) ? 0 : parseInt(sf2fee);
    var Vsplbamount = isNaN(parseInt(splbamount)) ? 0 : parseInt(splbamount);
    var Vafamount = isNaN(parseInt(afamount)) ? 0 : parseInt(afamount);
    var Vpwtamount = isNaN(parseInt(pwtamount)) ? 0 : parseInt(pwtamount);

    var Vpabamount = isNaN(parseInt(pabamount)) ? 0 : parseInt(pabamount);
    var Vfframount = isNaN(parseInt(fframount)) ? 0 : parseInt(fframount);
    var Vgcbpamount = isNaN(parseInt(gcbpamount)) ? 0 : parseInt(gcbpamount);
    var Vffgamount = isNaN(parseInt(ffgamount)) ? 0 : parseInt(ffgamount);
    var Vffaamount = isNaN(parseInt(ffaamount)) ? 0 : parseInt(ffaamount);
    var Vffoamount = isNaN(parseInt(ffoamount)) ? 0 : parseInt(ffoamount);
    var Vsploamount = isNaN(parseInt(sploamount)) ? 0 : parseInt(sploamount);
    var Vncogamount = isNaN(parseInt(ncogamount)) ? 0 : parseInt(ncogamount);
    var Vncoaamount = isNaN(parseInt(ncoaamount)) ? 0 : parseInt(ncoaamount);
    var Vscogamount = isNaN(parseInt(scogamount)) ? 0 : parseInt(scogamount);
    var Vscoaamount = isNaN(parseInt(scoaamount)) ? 0 : parseInt(scoaamount);

    var tot_amount = parseInt(Vcroamount) + parseInt(Vncroamount) + parseInt(Vscroamount) + parseInt(Vffbamount) + parseInt(Vpabamount) + parseInt(Vfframount) + parseInt(Vgcbpamount) + parseInt(Vffgamount) + parseInt(Vffaamount) + parseInt(Vffoamount) + parseInt(Vsploamount) + parseInt(Vncogamount) + parseInt(Vncoaamount) + parseInt(Vscogamount) + parseInt(Vscoaamount) + parseInt(Vncpabamount) + parseInt(Vscpabamount);
    var total_amount = parseInt(tot_amount) + parseInt(Vmfee) + parseInt(Vsf2fee) + parseInt(Vsplbamount) + parseInt(Vpwtamount) + parseInt(Vafamount);
    document.getElementById("sf1fee").value = tot_amount;
    document.getElementById("total_amount").value = total_amount;
    document.getElementById("tramount").value = total_amount;
}


function paymodechange() {
    var paymode = document.getElementById("paymode").value;
    if (paymode === "Direct Deposit") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else if (paymode === "ICICI") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else if (paymode === "SBI") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else if (paymode === "IOB") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else if (paymode === "NEFT") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else if (paymode === "RTGS") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else if (paymode === "Payment Gateway") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else if (paymode === "UPI") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else if (paymode === "EasyPay") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else if (paymode === "Cheque") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = false;
        document.getElementById("vtrbranch").hidden = false;
    } else if (paymode === "DD") {
        document.getElementById("vtrno").hidden = false;
        document.getElementById("vtrdate").hidden = false;
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrbank").hidden = false;
        document.getElementById("vtrbranch").hidden = false;
    } else if (paymode === "Cash") {
        document.getElementById("vtramount").hidden = false;
        document.getElementById("vtrno").hidden = true;
        document.getElementById("vtrdate").hidden = true;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    } else {
        document.getElementById("vtramount").hidden = true;
        document.getElementById("vtrno").hidden = true;
        document.getElementById("vtrdate").hidden = true;
        document.getElementById("vtrbank").hidden = true;
        document.getElementById("vtrbranch").hidden = true;
    }
}
     
let con = true;
let month_btn = document.querySelector("#monthly")
let month_btn_cnt = 0
let year_btn = document.querySelector("#yearly")
let lower_card_1_contain = document.querySelector("#lower-card-1-contain")
let lower_card_1_lower_div = document.querySelector("#lower-card-1-lower-div")
let lower_card_1_para = document.querySelector("#lower-card-1-para")
let lower_card_2_para = document.querySelector("#lower-card-2-para")
let lower_card_3_para = document.querySelector("#lower-card-3-para")
let lower_card_4_para = document.querySelector("#lower-card-4-para")
function my_fun_month(){
    if(con === false){
        // con = true
        // month_btn_cnt += 1
        month_btn.style.backgroundColor = "#F17C21"
        month_btn.style.border = "none"
        month_btn.style.color  = "white"

        year_btn.style.backgroundColor = "white"
        year_btn.style.border = "none"
        year_btn.style.color  = "black"
        year_btn.style.borderRadius = "3rem"

        lower_card_1_contain.innerHTML = "Starter pack to help you to get started"
        lower_card_1_lower_div.style.margin = "54px 0 -55px 0"
        lower_card_1_para.innerHTML = `<span style="font-weight: bold; font-size: 22px"> Free </span>`
        lower_card_1_para.style.animation = "3s linear 1s running slidein;"
        lower_card_2_para.innerHTML = `<span style="font-weight: bold; font-size: 22px">$ 100 </span> / <span>month</span>`
        lower_card_3_para.innerHTML = `<span style="font-weight: bold; font-size: 22px">$ 100 </span> / <span>month</span>`
        lower_card_4_para.innerHTML = `<span style="font-weight: bold; font-size: 22px"> Custom </span>`
        con = true
    }
}
function my_fun_year(){
    if(con === true){
        con = false
        month_btn.style.backgroundColor = "white"
        month_btn.style.border = "none"
        month_btn.style.color  = "black"

        year_btn.style.backgroundColor = "#F17C21"
        year_btn.style.border = "none"
        year_btn.style.color  = "white"
        year_btn.style.borderRadius = "3rem"

        lower_card_1_contain.innerHTML = "For companies that need to manage work happening across multiple teams."
        lower_card_1_lower_div.style.margin = "0px 0 -55px 0"
        lower_card_1_para.style.animation = "3s linear 1s running slidein"
        lower_card_1_para.innerHTML = `<span style="font-weight: bold; font-size: 22px">$ 50 </span> / <span>year</span>`
        lower_card_2_para.innerHTML = `<span style="font-weight: bold; font-size: 22px">$ 100 </span> / <span>year</span>`
        lower_card_3_para.innerHTML = `<span style="font-weight: bold; font-size: 22px">$ 150 </span> / <span>year</span>`
        lower_card_4_para.innerHTML = `<span style="font-weight: bold; font-size: 22px">$ 250 </span> / <span>year</span>`
        con = false
    }
}
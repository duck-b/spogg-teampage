/**
 * 
 */

var nowActive_img = "";
var nowActive_menuName = "";
var nowActive_li = "";

var menu1_img = "img/spogg/house_icon.png";
var menu1_img_active = "img/spogg/house_icon_blue.png";
var menu2_img = "img/spogg/group_icon.png";
var menu2_img_active = "img/spogg/group_icon_blue.png";
var menu3_img = "img/spogg/calender_icon.png";
var menu3_img_active = "img/spogg/calender_icon_blue.png";
var menu4_img = "img/spogg/sound_icon.png";
var menu4_img_active = "img/spogg/sound_icon_blue.png";
var menu5_img = "img/spogg/etc_icon.png";
var menu5_img_active = "img/spogg/etc_icon_blue.png";

var beforetag_src = "";
var check_active = "";
var li_img_before = "";
var beforetag = 1;

var li_nth = ""; //
var new_active = "";
var li_img = "";
var src_active = "";

function active_cancel() {/* active 해제 하는 함수*/
	if (beforetag == 1) {
		beforetag_src = menu1_img;
	} else if (beforetag == 2) {
		beforetag_src = menu2_img;
	} else if (beforetag == 3) {
		beforetag_src = menu3_img;
	} else if (beforetag == 4) {
		beforetag_src = menu4_img;
	} else if (beforetag == 5) {
		beforetag_src = menu5_img;
	} else {
		beforetag_src = menu1_img;
	}
	var before_active = "#spogg_mobile_Menu li:nth-child(" + beforetag
			+ ") a";
	$(before_active + " img").attr("src", beforetag_src); // 이미지 변경 해주기
	$("#spogg_mobile_Menu li a").removeClass("active");
	//var beforetag = $("#spogg_mobile_Menu li a.active").parent().attr('class');;		
}
function active_accept(obj) {/* active 하는 함수*/
	
	li_nth = "#spogg_mobile_Menu li:nth-child(" + obj + ")"; //
	new_active = "#spogg_mobile_Menu li:nth-child(" + obj + ") a";
	li_img = "#spogg_mobile_Menu li:nth-child(" + obj + ") a img";

	$(new_active).addClass("active");
	$(li_nth + " a img").attr("src", src_active); // 이미지 변경 해주기
	beforetag = obj;
}
jQuery(document).ready(
		function() {

			/*
				탭메뉴 클릭 시 메뉴에 활성화 시키기 위한 코드 : URL로 판단
			 */
			var pathname = jQuery(location).attr('pathname');
			var pathname_split = pathname.split('/'); //ex) 선수단 클릭 시 player_list.html가 변수에 저장 됨
			var pathname_split_name = pathname_split[2].split('.'); //.html를 떼기 위함	
			//alert("pathname_split_name: "+pathname_split_name[0]);
			
			var tabname = pathname_split_name[0];
			var index_load = 1;

			if (tabname == "index") {
				beforetag_src = menu1_img;
				src_active = menu1_img_active;
				index_load = 1;
			} else if (tabname == "player_list") {
				beforetag_src = menu2_img;
				src_active = menu2_img_active;
				index_load = 2;
			} else if (tabname == "schedule"||tabname == "add_schedule"||tabname == "update_schedule") {
				beforetag_src = menu3_img;
				src_active = menu3_img_active;
				index_load = 3;
			} else if (tabname == "recode") {
				beforetag_src = menu4_img;
				src_active = menu4_img_active;
				index_load = 4;
			} else if (tabname == "menu_more" ||tabname == "household_ledger") {
				beforetag_src = menu5_img;
				src_active = menu5_img_active;
				index_load = 5;
			} else {
				//alert("!");
				beforetag_src = menu1_img;
				src_active = menu1_img_active;
				index_load = 1;
			}
			active_cancel();
			active_accept(index_load);

			beforetag = 1;
			$("#spogg_mobile_Menu li").click(
					function() {

						var index = $(this).index(); //몇번째 li인지
						index += 1; //index는 0부터, nth-child는 1부터

						/*기존 active 해제 하기*/
						check_active = $("#spogg_mobile_Menu li a")
								.hasClass("active");

						//var beforetag =$("#spogg_mobile_Menu li").children(".active").index();

						li_img_before = "#spogg_mobile_Menu li:nth-child("
								+ beforetag + ") a img";
						if (check_active) {
							console.log("index : " + index);
							active_cancel(index);
						}
						/*
						var check_active = $("#spogg_mobile_Menu li a.active").index();
						var beforetag =$("#spogg_mobile_Menu li").children(".active").index();
						var before_active = "#spogg_mobile_Menu li:nth-child("+beforetag+") a";
						//var beforetag = $("#spogg_mobile_Menu li a.active").parent().attr('class');;
						$(before_active).removeClass(".active");
						console.log("check_active : "+beforetag);
						
						 */
						/*기존 active 해제 하기*/

						li_nth = "#spogg_mobile_Menu li:nth-child(" + index
								+ ")"; //
						new_active = "#spogg_mobile_Menu li:nth-child("
								+ index + ") a";
						li_img = "#spogg_mobile_Menu li:nth-child(" + index
								+ ") a img";
						if (index == 1) {
							src_active = menu1_img;

							nowActive_img = "";
							nowActive_menuName = "";
							nowActive_li = "";

						} else if (index == 2) {
							src_active = menu2_img_active;
						} else if (index == 3) {
							src_active = menu3_img_active;
						} else if (index == 4) {
							src_active = menu4_img_active;
						} else if (index == 5) {
							src_active = menu5_img_active;
						} else {
							src_active = menu1_img_active;
						}

					});

			//$("li:eq(" + index + ")").attr("data-val", "hello");
		});
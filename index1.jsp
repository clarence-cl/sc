<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>首页</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sm.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flickity.min.css">
</head>
<body>
<%
    UserLoginResult userLoginResult = (UserLoginResult) session.getAttribute("activeUser");
    String userId = null;
    if (userLoginResult != null) {
        userId = userLoginResult.getAccount().getAccount_id();
    }
%>
<a class="toTop" href="#" id="toTop"></a>
<div class="page-group">
    <div class="content  sub-content">
        <div class="index_bar">
            <div class="b1">
                <a><i class="icon icon-form-index-ma"></i></a>
            </div>
            <div class="b4">
                <select id="search_type" class="select-obj ">
                    <option value="1" selected>商品</option>
                    <option value="2">拼团</option>
                </select>
            </div>
            <div class="b2">
                <input type="text" placeholder="搜索关键字、商品" id="search">
                <a><i class="icon icon-form-index-search"></i></a>
            </div>
            <div class="b3" onclick="toMine()">
                <a><i class="icon icon-form-index-user"></i></a>
            </div>
        </div>
        <div class="tipsInfo tipsIndex" id="tipsInfo"><label id="tips_label"></label></div>
        <!-- Slider -->
        <div class="indexImgbox">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                </div>
                <div class="swiper-pagination swiper-pagination-white"></div>
            </div>
        </div>
        <!-- Category -->
        <div class="index_nav" id="category_container" style="margin: 0px;">
        </div>
        <!-- PinTuan Category -->
        <div class="index_nav" id="pintuan_category_container" style="margin: 0px;">
        </div>
        <!-- HotPinTuan Opened -->
        <div class="tuan-title-01" id="opened_pintuan_title"></div>
        <div class="list-type list-tuan" id="opened_hotpintuan_list_group">
            <ul id="opened_hotpintuan_list">
            </ul>
            <div class="loadMore" id="opened_hotpintuan_more"><a href="#">加载更多</a></div>
        </div>
        <!-- HotPinTuan next -->
        <div class="tuan-title-02 mt1" id="next_pintuan_title"></div>
        <div class="list-type list-tuan" id="next_hotpintuan_list_group">
            <ul id="next_hotpintuan_list">
            </ul>
            <div class="loadMore" id="next_hotpintuan_more"><a href="#">加载更多</a></div>
        </div>
        <!-- Ads 1 -->
        <div class="bannerBox" id="ads_1_group">
        </div>
        <!-- HotGoods -->
        <div class="tuan-title-03 " id="hot_goods_title"></div>
        <div class="tuan-jian" id="hot_goods_group">
            <div id="hot_goods_list" class="gallery tuijianbox ">
            </div>
        </div>
        <!--Ads 2-->
        <div class="bannerBox" id="ads_2_group">
        </div>
        <!--猜你喜欢-->
        <div class="tuan-title-04 " id="guess_like_title"></div>
        <div class="tuan-caicai" id="guess_like_group">
        </div>
        <div class="bottom-tips">已经到底啦！</div>
    </div>
</div>
<nav class="bar bar-tab bar-tuan">
    <a class="tab-item external tuan-bar-a1 active" href="#">
        <span class="icon icon-tuan-01"></span>
        <span class="tab-label">首页</span>
    </a>
    <a class="tab-item external tuan-bar-a2" href="${pageContext.request.contextPath}/client/toDiscover.action">
        <span class="icon icon-tuan-02"></span>
        <span class="tab-label">发现</span>
    </a>
    <a class="tab-item external tuan-bar-a3" href="${pageContext.request.contextPath}/client/toShoppingCart.action">
        <span class="icon icon-tuan-03"></span>
        <span class="tab-label">购物车</span>
    </a>
    <a class="tab-item external tuan-bar-a4" href="${pageContext.request.contextPath}/client/toMine.action">
        <span class="icon icon-tuan-04"></span>
        <span class="tab-label">我的</span>
    </a>
</nav>
</body>
<script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/zepto.min.js'
        charset='utf-8'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/totop.js' charset='utf-8'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/fx.js' charset='utf-8'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/sm.js' charset='utf-8'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/swiper.min.js'
        charset='utf-8'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/flickity.pkgd.min.js'
        charset='utf-8'></script>
<%@include file="commonjs.jsp" %>
<script type="text/javascript">
    function toWebsite(url) {
        window.location.href = url;
    }

    function toGoodsDetail(goodsId) {
        window.location.href = "${pageContext.request.contextPath}/client/toGoodsDetail.action?goodsId=" + goodsId;
    }

    function toPinTuanDetail(pintuan_id) {
        window.location.href = "${pageContext.request.contextPath}/client/toPinTuanDetail.action?pinTuanId=" + pintuan_id;
    }

    function toMine() {
        if ('<%=userId%>' == 'null' || '<%=userId%>' == '') {
            window.parent.parent.location.href = "${pageContext.request.contextPath}/client/toLogin.action";
            return;
        }
        window.location.href = "${pageContext.request.contextPath}/client/toMine.action";
    }

    //获取轮播图
    function getBannerInfo() {
        $.ajax({
            "url": "${pageContext.request.contextPath}/client/activityList.action?location=10",
            "type": "post",
            "contentType": "application/json;charset=utf-8",
            "dataType": "json",
            "success": function (data) {
                if (data != null && data.length > 0) {
                    var swiper = new Swiper('.swiper-container', {
                        spaceBetween: 30,
                        centeredSlides: true,
                        autoplay: {
                            delay: 2500,
                            disableOnInteraction: false
                        },
                        pagination: {
                            el: '.swiper-pagination',
                            clickable: true
                        }
                    });
                    for (i = 0; i < data.length; i++) {
                        var funPtr = 'javascript:void(0)';
                        var type = data[i].type || '';
                        var type_param = data[i].type_param || '';
                        if (type == '1' && type_param != '') {
                            funPtr = 'toWebsite(\'' + type_param + '\')';
                        } else if (type == '2' && type_param != '') {
                            funPtr = 'toGoodsDetail(\'' + type_param + '\')';
                        } else if (type == '3' && type_param != '') {
                            funPtr = 'toPinTuanDetail(\'' + type_param + '\')';
                        }
                        var templete = '<div class="swiper-slide" data-swiper-autoplay="5000" onclick="' + funPtr + '"><img style="width: 100%; height: 160px;" src="' + data[i].path_url + '" alt=""></div>';
                        swiper.appendSlide(templete);
                    }
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $.alert('获取轮播图数据失败', '<div class="warning"><span class="icon icon_warning"></span></div>');
            }
        });
    }

    //获取分类
    function getCategoryInfo() {
        $.ajax({
            "url": "${pageContext.request.contextPath}/client/categoryList.action",
            "type": "post",
            "contentType": "application/json;charset=utf-8",
            "dataType": "json",
            "success": function (data) {
                $('#category_container').empty();
                if (data != null && data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var category_name = data[i].category_name || '';
                        var icon_url = data[i].icon_path_url || '';
                        var icon = '';
                        if (icon_url != null) {
                            icon = ' src="' + icon_url + '"';
                        }
                        var hrefStr = '${pageContext.request.contextPath}/client/toGoodsList.action?categoryId=' + data[i].category_id;
                        var templete = '<a href="' + hrefStr + '" class="nav_a">\n' +
                            '    <i><img ' + icon + '></i>\n' +
                            '    <span>' + category_name + '</span>\n' +
                            '</a>';
                        $(templete).appendTo($('#category_container'));
                    }
                }
            },
            error: function () {
                $.alert('获取分类数据失败', '<div class="warning"><span class="icon icon_warning"></span></div>');
            }
        });
    }

    //获取拼团分类
    function getPinTuanCategoryInfo() {
        $.ajax({
            "url": "${pageContext.request.contextPath}/client/pinTuanCategoryList.action",
            "type": "post",
            "contentType": "application/json;charset=utf-8",
            "dataType": "json",
            "success": function (data) {
                $('#pintuan_category_container').empty();
                if (data != null && data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var category_name = data[i].category_name || '';
                        var icon_url = data[i].icon_path_url || '';
                        var icon = '';
                        if (icon_url != null) {
                            icon = ' src="' + icon_url + '"';
                        }
                        var hrefStr = '${pageContext.request.contextPath}/client/toPinTuanList.action?categoryId=' + data[i].category_id;
                        var templete = '<a href="' + hrefStr + '" class="nav_a">\n' +
                            '    <i><img ' + icon + '></i>\n' +
                            '    <span>' + category_name + '</span>\n' +
                            '</a>';
                        $(templete).appendTo($('#pintuan_category_container'));
                    }
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $.alert('获取拼团分类数据失败', '<div class="warning"><span class="icon icon_warning"></span></div>');
            }
        });
    }

    //获取推荐商品
    function getHotGoodsInfo() {
        var goodsJsondata = {
            rows: '-1'
        };
        $.ajax({
            "url": "${pageContext.request.contextPath}/client/hotGoodsList.action",
            "type": "post",
            "contentType": "application/json;charset=utf-8",
            "data": JSON.stringify(goodsJsondata),
            "dataType": "json",
            "success": function (data) {
                $('#hot_goods_title').hide();
                $('#hot_goods_group').hide();
                $('#hot_goods_list').empty();
                if (data != null && data.rows != null && data.rows.length > 0) {
                    $('#hot_goods_title').show();
                    $('#hot_goods_group').show();
                    var flicky = new Flickity('#hot_goods_list', {
                        freeScroll: true,
                        contain: true,
                        // disable previous & next buttons and dots
                        prevNextButtons: false,
                        pageDots: false,
                        cellAlign: 'left'
                    });
                    for (i = 0; i < data.rows.length; i++) {
                        var goodsInfo = data.rows[i];
                        var goods_id = goodsInfo.goods_id || '';
                        var goods_cover_url = goodsInfo.goods_cover_url || '';
                        var cover = '';
                        if (goods_cover_url != null) {
                            cover = ' src="' + goods_cover_url + '"';
                        }
                        var templete = ' <div class="cell" onclick="toGoodsDetail(\'' + goods_id + '\')">\n' +
                            ' <a href="#"><img ' + cover + '></a>\n' +
                            '</div>';
                        flicky.append($(templete));
                    }
                }
            },
            error: function () {
                $.alert('获取推荐商品数据失败', '<div class="warning"><span class="icon icon_warning"></span></div>');
            }
        });
    }

    //获取推荐拼团
    function getHotPinTuanInfo() {
        var goodsJsondata = {
            rows: '-1'
        };
        $.ajax({
            "url": "${pageContext.request.contextPath}/client/hotPinTuanList.action",
            "type": "post",
            "contentType": "application/json;charset=utf-8",
            "data": JSON.stringify(goodsJsondata),
            "dataType": "json",
            "success": function (data) {
                $('#opened_pintuan_title').hide();
                $('#opened_hotpintuan_list_group').hide();
                $('#opened_hotpintuan_list').empty();
                $('#next_pintuan_title').hide();
                $('#next_hotpintuan_list_group').hide();
                $('#next_hotpintuan_list').empty();
                var opened_count = 0;
                var next_count = 0;
                if (data != null && data.rows != null && data.rows.length > 0) {
                    for (i = 0; i < data.rows.length; i++) {
                        var pinTuanInfo = data.rows[i];
                        var pintuan_id = pinTuanInfo.pintuan_id || '';
                        var goods_cover_url = pinTuanInfo.goods_cover_url || '';
                        var pintuan_name = pinTuanInfo.pintuan_name || '';
                        var settlement_fee = pinTuanInfo.settlement_fee || '0.00';
                        var price = pinTuanInfo.price || '0.00';
                        var back_type = pinTuanInfo.back_type || '';
                        var min_buyer = pinTuanInfo.min_buyer || '';
                        var ordered_count = pinTuanInfo.ordered_count_ugly || '0';
                        var start_time = pinTuanInfo.start_time || '';
                        var end_time = pinTuanInfo.end_time || '';
                        var startTime = new Date(Date.parse(start_time.replace(/-/g, "/")));
                        var endTime = new Date(Date.parse(end_time.replace(/-/g, "/")));
                        var status = pinTuanInfo.status || '';
                        var cover = '';
                        if (goods_cover_url != null) {
                            cover = ' src="' + goods_cover_url + '"';
                        }
                        var time_tips = '';
                        var cls = '';
                        var style = '';
                        var min_diff_tips = '';
                        if (status == '1') {
                            min_diff_tips = '';
                            next_count = next_count + 1;
                            if (next_count > 1) {
                                cls = 'NEXT_MORE';
                                style = 'display:none';
                            }
                            time_tips = '<span>' + (startTime.getMonth() + 1) + '月' + startTime.getDate() + '日</span>开团';
                            ordered_count = '0';
                        } else {
                            var diff_buyer = pinTuanInfo.diff_buyer || '-1';
                            min_diff_tips = '';
                            if (parseInt(diff_buyer) > 0) {
                                min_diff_tips = '还差<span class="color-orange">' + diff_buyer + '人</span>待加入';
                            }
                            opened_count = opened_count + 1;
                            if (opened_count > 3) {
                                cls = 'OPENED_MORE';
                                style = 'display:none';
                            }
                            time_tips = '截止<span>' + (endTime.getMonth() + 1) + '月' + endTime.getDate() + '日</span>';
                        }
                        var tips = back_type == '1' ? '免单' : '优惠';
                        var templete = '<li onclick="toPinTuanDetail(\'' + pintuan_id + '\')" class="' + cls + '" style="' + style + '">\n' +
                            '    <div class="lt-item">\n' +
                            '        <div class="lt-img">\n' +
                            '            <a href="#"> <img ' + cover + '>  <div class="tuan-tips" style="display: none;">发团满' + min_buyer + '人' + tips + '</div></a>\n' +
                            '        </div>\n' +
                            '        <div class="lt-text">\n' +
                            '            <div class="lt-t1"><a href="#">' + pintuan_name + '</a></div>\n' +
                            '            <div class="lt-t2">\n' +
                            '                    <span class="span1 g-price">\n' +
                            '                        <strong>￥' + price + '</strong>\n' +
                            '                        <span class="gp1" style="display: none;">￥' + settlement_fee + '</span>\n' +
                            '                    </span>\n' +
                            '                <span class="span2"> 已团' + ordered_count + '件</span>\n' +
                            '            </div>\n' +
                            '        </div>\n' +
                            '    </div>\n' +
                            '    <div class="tuan-bar">\n' +
                            '        <div class="tb-01">\n' +
                            '            <div class="tb-01-01">' + time_tips + '</div>\n' +
                            '            <div class="tb-01-02">' + min_diff_tips + '</div>\n' +
                            '        </div>\n' +
                            '        <div class="tb-02">\n' +
                            '            <a href="#" class="button button-warning">我要发团</a>\n' +
                            '            <a href="#" class="button button-fill button-warning">立即参团 </a>\n' +
                            '        </div>\n' +
                            '    </div>\n' +
                            '</li>';
                        if (status == '1') {
                            $('#next_pintuan_title').show();
                            $('#next_hotpintuan_list_group').show();
                            $(templete).appendTo($('#next_hotpintuan_list'));
                        } else {
                            $('#opened_pintuan_title').show();
                            $('#opened_hotpintuan_list_group').show();
                            $(templete).appendTo($('#opened_hotpintuan_list'));
                        }
                    }
                    if (next_count > 1) {
                        $('#next_hotpintuan_more').show();
                    } else {
                        $('#next_hotpintuan_more').hide();
                    }
                    if (opened_count > 3) {
                        $('#opened_hotpintuan_more').show();
                    } else {
                        $('#opened_hotpintuan_more').hide();
                    }
                }
            },
            error: function () {
                $.alert('获取推荐拼团数据失败', '<div class="warning"><span class="icon icon_warning"></span></div>');
            }
        });
    }

    //广告1
    function getAds1Info() {
        $.ajax({
            "url": "${pageContext.request.contextPath}/client/activityList.action?location=20",
            "type": "post",
            "contentType": "application/json;charset=utf-8",
            "dataType": "json",
            "success": function (data) {
                $('#ads_1_group').hide();
                $('#ads_1_group').empty();
                if (data != null && data.length > 0) {
                    $('#ads_1_group').show();
                    var ads = data[0];
                    var funPtr = 'javascript:void(0)';
                    var type = ads.type || '';
                    var type_param = ads.type_param || '';
                    if (type == '1' && type_param != '') {
                        funPtr = 'toWebsite(\'' + type_param + '\')';
                    } else if (type == '2' && type_param != '') {
                        funPtr = 'toGoodsDetail(\'' + type_param + '\')';
                    } else if (type == '3' && type_param != '') {
                        funPtr = 'toPinTuanDetail(\'' + type_param + '\')';
                    }
                    var templete = '<a href="#" onclick="' + funPtr + '"><img src="' + ads.path_url + '"></a>';
                    $(templete).appendTo($('#ads_1_group'));
                }
            },
            error: function () {
                $.alert('获取广告数据失败', '<div class="warning"><span class="icon icon_warning"></span></div>');
            }
        });
    }

    //广告2
    function getAds2Info() {
        $.ajax({
            "url": "${pageContext.request.contextPath}/client/activityList.action?location=21",
            "type": "post",
            "contentType": "application/json;charset=utf-8",
            "dataType": "json",
            "success": function (data) {
                $('#ads_2_group').hide();
                $('#ads_2_group').empty();
                if (data != null && data.length > 0) {
                    $('#ads_2_group').show();
                    var ads = data[0];
                    var funPtr = 'javascript:void(0)';
                    var type = ads.type || '';
                    var type_param = ads.type_param || '';
                    if (type == '1' && type_param != '') {
                        funPtr = 'toWebsite(\'' + type_param + '\')';
                    } else if (type == '2' && type_param != '') {
                        funPtr = 'toGoodsDetail(\'' + type_param + '\')';
                    } else if (type == '3' && type_param != '') {
                        funPtr = 'toPinTuanDetail(\'' + type_param + '\')';
                    }
                    var templete = '<a href="#" onclick="' + funPtr + '"><img src="' + ads.path_url + '"></a>';
                    $(templete).appendTo($('#ads_2_group'));
                }
            },
            error: function () {
                $.alert('获取广告数据失败', '<div class="warning"><span class="icon icon_warning"></span></div>');
            }
        });
    }

    //猜你喜欢
    function getGuessLikeInfo() {
        $.ajax({
            "url": "${pageContext.request.contextPath}/client/activityList.action?location=40",
            "type": "post",
            "contentType": "application/json;charset=utf-8",
            "dataType": "json",
            "success": function (data) {
                $('#guess_like_title').hide();
                $('#guess_like_group').hide();
                $('#guess_like_group').empty();
                if (data != null && data.length > 0) {
                    $('#guess_like_title').show();
                    $('#guess_like_group').show();
                    for (i = 0; i < data.length; i++) {
                        var ads = data[i];
                        var funPtr = 'javascript:void(0)';
                        var type = ads.type || '';
                        var type_param = ads.type_param || '';
                        if (type == '1' && type_param != '') {
                            funPtr = 'toWebsite(\'' + type_param + '\')';
                        } else if (type == '2' && type_param != '') {
                            funPtr = 'toGoodsDetail(\'' + type_param + '\')';
                        } else if (type == '3' && type_param != '') {
                            funPtr = 'toPinTuanDetail(\'' + type_param + '\')';
                        }
                        var templete = '<a href="#" onclick="' + funPtr + '"><img src="' + ads.path_url + '"></a>';
                        $(templete).appendTo($('#guess_like_group'));
                    }
                }
            },
            error: function () {
                $.alert('获取猜你喜欢数据失败', '<div class="warning"><span class="icon icon_warning"></span></div>');
            }
        });
    }

    $(function () {
        SHARE.shareEnable(true);
        getBannerInfo();
        getCategoryInfo();
        getPinTuanCategoryInfo();
        getHotPinTuanInfo();
        getHotGoodsInfo();
        getAds1Info();
        getAds2Info();
        getGuessLikeInfo();
        $('#opened_hotpintuan_more').bind('click', function () {
            $(this).hide();
            $('.OPENED_MORE').show();
        });
        $('#next_hotpintuan_more').bind('click', function () {
            $(this).hide();
            $('.NEXT_MORE').show();
        });

        /*左侧信息弹出示例*/
        window.outInter = "";

        function showTips() {
            var random = Math.floor(Math.random() * 100) + 1;
            $('#tips_label').text('五分钟前，有' + random + '名会员下单成功');
            $("#tipsInfo").show().css({left: -$(this).width()}).animate({
                opacity: 1,
                left: 0
            }, 2000, function () {
                clearTimeout(outInter);
                outInter = window.setTimeout(function () {
                    $("#tipsInfo").animate({
                        opacity: 0.5,
                        left: -$(this).width()
                    }, 2000)
                }, 5000)//5秒后收回
            })
        }

        window.setTimeout(function () {
            showTips();
        }, 1000);//  1秒后弹出
        /*循环展示*/
        window.setInterval(function () {
            showTips();
        }, 5 * 60 * 1000);//5分钟弹循环一次

        $("#toTop").click(function () {
            $(".content").scrollTo({toT: 0});
        });

        $('#search').bind('keypress', function (event) {
            if (event.keyCode == "13") {
                var keyword = $(this).val() || '';
                if (keyword == '') {
                    $.alert('搜索关键字不能为空', '<div class="warning"><span class="icon icon_warning"></span></div>');
                    return;
                }
                var search_type = $('#search_type').val() || '1';
                if (search_type == '1') {
                    //商品列表
                    window.location.href = "${pageContext.request.contextPath}/client/toGoodsList.action?keyword=" + keyword;
                } else if (search_type == '2') {
                    //拼团列表
                    window.location.href = "${pageContext.request.contextPath}/client/toPinTuanList.action?keyword=" + keyword;
                }
            }
        });
    });
</script>
</html>

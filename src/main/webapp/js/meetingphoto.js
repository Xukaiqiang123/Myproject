//页面加载数据
$(function () {
    var xAxis = [];
    var serData =[];
    var barChart2 = echarts.init(document.getElementById("main_hover"));
    option = {
        title: {
            text: '柱状图展示'//标题内容
        },
        tooltip: {},
        legend: {
            data: ['会议次数分布图']//标签内容
            // 注意例子格式为数组，后台传过来的需要对应格式处理数据
        },
        xAxis: {
            name: '月份（/月）',
            axisLabel: {
                interval: 0,
            },
            //x轴项目名竖直排列
            data: xAxis,
        },
        yAxis: {
            name: '次数（/次）',
        },
        series: [{
            name: '会议次数分布',//与标签内容相同
            type: 'bar',
            //增加数据的单位展示
            label: {
                normal: {
                    show: true,
                    position: 'top',
                    formatter: '{c}次'
                }
            },
            data: serData,
        }]
    };		            	 // 使用刚指定的配置项和数据显示图表。
    barChart2.setOption(option);
});
var xAxis = [];
var serData =[];
function showPhoto() {
    var barChart = echarts.init(document.getElementById("main"));
    option = {
        title: {
            text: '柱状图展示'//标题内容
        },
        tooltip: {},
        legend: {
            data: ['会议次数分布图']//标签内容
            // 注意例子格式为数组，后台传过来的需要对应格式处理数据
        },
        xAxis: {
            name: '月份（/月）',
            axisLabel: {
                interval: 0,
            },
            //x轴项目名竖直排列
            data: xAxis,
        },
        yAxis: {
            name: '次数（/次）',
        },
        series: [{
            name: '会议次数分布',//与标签内容相同
            type: 'bar',
            //增加数据的单位展示
            label: {
                normal: {
                    show: true,
                    position: 'top',
                    formatter: '{c}次'
                }
            },
            data: serData,
        }]
    };		            	 // 使用刚指定的配置项和数据显示图表。
    barChart.setOption(option);
}
function photo(){
    document.getElementById("main").style.display = "block";
    document.getElementById("main_hover").style.display = "none";
    // 基于准备好的dom，初始化echarts实例
    var year = document.getElementById("year").value;
    $.ajax({
        method: 'POST',
        url: "daydate/selectday?year="+year,
        async:false,
        dateType: 'JSON',
        success: function (data) {
            var map = jQuery.parseJSON(data);
            xAxis = map.mouth;
            serData = map.count;
            showPhoto();
        },
        error:function (data) {
            alert("图标加载失败！");
        }
    });
}
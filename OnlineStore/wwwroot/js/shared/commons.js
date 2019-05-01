﻿var commons = {
    configs: {
        pageSize: 10,
        pageIndex: 1
    },
    notify: function (message, type) {
        $.notify(message, {
            // whether to hide the notification on click
            clickToHide: true,
            // whether to auto-hide the notification
            autoHide: true,
            // if autoHide, hide after milliseconds
            autoHideDelay: 5000,
            // show the arrow pointing at the element
            arrowShow: true,
            // arrow size in pixels
            arrowSize: 5,
            // position defines the notification position though uses the defaults below
            position: '...',
            // default positions
            elementPosition: 'top right',
            globalPosition: 'top right',
            // default style
            style: 'bootstrap',
            // default class (string or [string])
            className: type,
            // show animation
            showAnimation: 'slideDown',
            // show animation duration
            showDuration: 400,
            // hide animation
            hideAnimation: 'slideUp',
            // hide animation duration
            hideDuration: 200,
            // padding between element and notification
            gap: 2
        });
    },
    confirm: function (message, okCallback) {
        bootbox.confirm({
            message: message,
            buttons: {
                confirm: {
                    label: 'Confirm',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Cancel',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result === true) {
                    okCallback();
                }
            }
        });
    },
    dateFormatJson: function (datetime) {
        if (datetime === null || datetime === '') {
            return '';
        }
        var newDate = new Date(parseInt(datetime.substr(6)));
        var month = newDate.getMonth() + 1;
        var day = newDate.getDate();
        var year = newDate.getFullYear();
        var hh = newDate.getHours();
        var mm = newDate.getMinutes();
        if (month < 10)
            month = `0${day}`;
        if (hh < 10)
            hh = `0${hh}`;
        if (mm < 10)
            mm = `0${mm}`;
        return `${day}/${month}/${year}`;
    },
    dateTimeFormatJson: function (datetime) {
        if (datetime === null || datetime === '')
            return '';
        var newdate = new Date(parseInt(datetime.substr(6)));
        var month = newdate.getMonth() + 1;
        var day = newdate.getDate();
        var year = newdate.getFullYear();
        var hh = newdate.getHours();
        var mm = newdate.getMinutes();
        var ss = newdate.getSeconds();
        if (month < 10)
            month = `0${month}`;
        if (day < 10)
            day = `0${day}`;
        if (hh < 10)
            hh = `0${hh}`;
        if (mm < 10)
            mm = `0${mm}`;
        if (ss < 10)
            ss = `0${ss}`;
        return `${day}/${month}/${year} ${hh}:${mm}:${ss}`;
    },
    startLoading: function () {
        if ($('.dv-loading').length > 0) {
            $('.dv-loading').addClass('hide');
        }
    },
    stopLoading: function () {
        if ($('.dv-loading').length < 0) {
            $('.dv-loading').removeClass('hide');
        }
    },
    getStatus: function (status) {
        if (status === 1)
            return '<span class="badge bg-green">Kích hoạt</span>';
        else {
            return '<span class="badge bg-red">Khóa</span>';
        }
    },
    formatNumber: function (number, precision) {
        if (!isFinite(number)) {
            return number.toString();
        }

        var a = number.toFixed(precision).split('.');
        a[0] = a[0].replace(/\d(?=(\d{3})+$)/g, '$&,');
        return a.join('.');
    },

    unflattern: function (arr) {
        var map = {};
        var roots = arr;
        for (var i = 0; i < roots.length; i++) {
            var node = roots[i];
            map[node.id] = i; // use map to look-up the parents
            if (node.parentId !== null && node.parentId !== undefined) {
                if (map[node.parentId] !== null && map[node.parentId] !== undefined) {
                    if (roots[map[node.parentId]].children === undefined) {
                        roots[map[node.parentId]].children = [];
                    }
                    roots[map[node.parentId]].children.push(node);
                    roots.splice(i, 1);
                    i--;
                } else {
                    for (let j = roots.length - 1; j > i; j--) {
                        if (roots[j].id === node.parentId) {
                            if (roots[j].children === undefined) {
                                roots[j].children = [];
                            }
                            roots[j].children.push(node);
                            roots.splice(i, 1);
                        }
                    }
                    i--;
                }
            } 
        }
        return roots;
    }
};
$(document).ajaxSend(function (e, xhr, options) {
    if (options.type.toUpperCase() === "POST" || options.type.toUpperCase() === "PUT") {
        var token = $('form').find("input[name='__RequestVerificationToken']").val();
        xhr.setRequestHeader("RequestVerificationToken", token);
    }
});
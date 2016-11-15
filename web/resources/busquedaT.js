/* 
 * Dillan Barbosa Hdz 2016
 */
$(window).load(function () {
    var $rows = $('#table tr[class!="header"]');
    var $rows2 = $('#table2 tr[class!="header"]');
    $('#search').keyup(function () {

        var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
                reg = RegExp(val, 'i'),
                text;

        $rows.show().filter(function () {
            text = $(this).text().replace(/\s+/g, ' ');
            return !reg.test(text);
        }).hide();

        $rows2.show().filter(function () {
            text = $(this).text().replace(/\s+/g, ' ');
            return !reg.test(text);
        }).hide();
    });
});

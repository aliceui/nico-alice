seajs.use(['$'], function($) {
  $(function(){
    $('.highlight').on('click', '.code-toggle', function() {
      var pre = $(this).parents('.highlight')
      if (pre.hasClass('collapse')) {
        pre.removeClass('collapse')
        $(this).text('收起')
      } else {
        pre.addClass('collapse')
        $(this).text('展开')
      }
      return false
    });

    $('h4 em, h3 em, h3 code, h4 code').parent().addClass('doc-api')
    // 给 iframe 加链接
    $('.nico-iframe').each(function(i, item) {
      var src = $(item).find('iframe').attr('src')
      var html = '<a class="new-window" target="_blank" href="' + src + '">新窗口打开</a>'
      $(item).append(html)
    });
    // 给 code 加收起和展开
    $('.highlight').each(function(i, item) {
      var $item = $(item)
      if ($item.height() > 300) {
        $item.append('<a class="code-toggle" href="#">展开</a>')
        $item.addClass('collapse')
      }
    });
  });
});

seajs.use(['$', 'arale/popup/1.1.2/popup'], function($, Popup) {

  // spm install message
  var root = $('#sidebar-wrapper h1 sup a').html();
  if (root && Popup) {
    var name = $('#sidebar-wrapper h1 > a').html().toLowerCase();
    var version = $('#sidebar-wrapper .version a').html();
    new Popup({
      trigger: '#sidebar-wrapper h1 > a',
      template: '<div class="popup-install">spm install '
          +root+'/'+name+'@'+version+'</div>',
      align: {
          baseXY: [0, '100%+5']
      }
    });
  }

  // output card
  if ($('#module-output')[0] && Popup) {
      new Popup({
        trigger: '#module-output li a',
        element: '#output-card',
        effect: 'fade',
        beforeShow: function() {
            var file = this.activeTrigger.data('file');
            file = file.replace('./', '').replace('.js', '');
            this.element.find('#output-file').html(file)
                                             .attr('href', this.activeTrigger.attr('href'));
        }
      });
  }

});

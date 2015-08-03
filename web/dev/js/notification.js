var Notification = {

  wrapper: document.getElementById('notification'),
  content: document.getElementById('notification-content'),
  count: document.querySelectorAll('.js-isNotice').length,

  init : function() {
    if (this.count > 0)
    this.show();
  },

  show : function() {
    var closeBtn = document.querySelectorAll('.js-notificationCloseBtn');
    closeBtn[0].addEventListener('click', this.close.bind(this), false);
    this.wrapper.classList.add('js-isShown');
  },

  close : function() {
    this.wrapper.classList.remove('js-isShown');
  }

}

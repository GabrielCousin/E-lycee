var Pagination = {
  content: document.getElementById('posts-wrapper'),
  loadMore: document.getElementById('load-more-btn'),

  init: function() {
    this.loadMore.addEventListener('click', this.load.bind(this), false);
  },

  load: function() {
    this.pageToLoad = this.current + 1;
    this.loadMore.setAttribute('disabled', 'true');
    Loading.show();

    if (this.type == "search") {
      var route = Routing.generate('public.news.ajax', { page: this.pageToLoad , expression: this.expression}, true);
    } else {
      var route = Routing.generate('public.news.ajax', { page: this.pageToLoad }, true);
    }
    this.xhr = new XMLHttpRequest();
    this.xhr.open('POST', route, true);
    this.xhr.send(null);
    this.xhr.addEventListener('readystatechange', this.success.bind(this), false);
  },

  success: function(e) {
    if(this.xhr.readyState == 4 && this.xhr.status == 200) {
      var response = JSON.parse(this.xhr.responseText);
      this.content.innerHTML += response.articleSection;
      Loading.hide();
      componentHandler.upgradeDom();
      this.current = this.pageToLoad;

      if (this.current >= this.max) {
        this.loadMore.setAttribute('disabled', 'true');
        this.loadMore.innerHTML = 'Tous les articles sont chargés';
      } else {
        this.loadMore.removeAttribute('disabled');
      }
    }
  }

}

var Graph = {

  init: function() {
    this.angle = (100 - this.percent) * 180 / 50;
    this.calcul();
  },

  calcul: function() {
    this.rad = this.angle * Math.PI / 180 ;
    this.x = Math.sin(this.rad) * 0.5 + 0.5;
    this.y = -Math.cos(this.rad) * 0.5 + 0.5;
    this.updateSVG();
  },

  updateSVG: function() {
    this.path = document.getElementById("path" + this.id);
    if (this.percent > 50) {
      this.path.setAttribute("d", "M 0.5 0.5 0.5 0 A 0.5 0.5 0 0 1 " + this.x + " " + this.y + " z")
    } else if (this.percent == 0) {
      this.path.setAttribute("d", "M 0.5 0.5 0.5 0 A 0.5 0.5 0 1 1 0.49 0.5 z")
    } else {
      this.path.setAttribute("d", "M 0.5 0.5 0.5 0 A 0.5 0.5 0 1 1 " + this.x + " " + this.y + " z")
    }
  }

}

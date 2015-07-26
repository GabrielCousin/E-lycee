var UpdateNotice = {

  target: document.getElementById('dashboardbundle_fiche_niveau'),

  init: function() {
    this.lastValue = this.target.value;
  },

  check: function() {
    this.newValue = this.target.value;

    if (this.newValue !== this.lastValue) {
      if (!confirm('Vous avez modifié la niveau. Les scores enregistrés par les autres niveaux seront supprimés. Voulez-vous continuer ?')) {
        return false;
      }
    }
  }

}

// Récupère le div qui contient la collection de tags
var collectionHolder = $('.form-choices');
var $addTagLink = $('<button class="fiche-question-adder add_tag_link mdl-button mdl-js-button mdl-js-ripple-effect">Ajouter une question</button>');
var $newLinkLi = $('<li></li>').append($addTagLink);
$(document).ready(function() {
    // ajoute l'ancre « ajouter un tag » et li à la balise ul
    collectionHolder.append($newLinkLi);

    $addTagLink.on('click', function(e) {
        e.preventDefault();
        addTagForm(collectionHolder, $newLinkLi);
        Allow.init();
    });
});
function addTagForm(collectionHolder, $newLinkLi) {
    // Récupère l'élément ayant l'attribut data-prototype comme expliqué plus tôt
    var prototype = collectionHolder.attr('data-prototype');

    // Remplace '__name__' dans le HTML du prototype par un nombre basé sur
    // la longueur de la collection courante
    var newForm = prototype.replace(/__name__/g, collectionHolder.children().length);

    // Affiche le formulaire dans la page dans un li, avant le lien "ajouter un tag"
    var $newFormLi = $('<li class="fiche-question"></li>').append(newForm);
    $newLinkLi.before($newFormLi);
    // ajoute un lien de suppression au nouveau formulaire
    addTagFormDeleteLink($newFormLi);
    componentHandler.upgradeDom();
}

function addTagFormDeleteLink($tagFormLi) {
    var $removeFormA = $('<button class="add_tag_link mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--accent">Supprimer</button>');
    $tagFormLi.append($removeFormA);

    $removeFormA.on('click', function(e) {
        // empêche le lien de créer un « # » dans l'URL
        e.preventDefault();

        // supprime l'élément li pour le formulaire de tag
        $tagFormLi.remove();
        componentHandler.upgradeDom();
    });
}

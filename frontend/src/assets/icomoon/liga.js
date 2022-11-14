/* A polyfill for browsers that don't support ligatures. */
/* The script tag referring to this file must be placed before the ending body tag. */

/* To provide support for elements dynamically added, this script adds
   method 'icomoonLiga' to the window object. You can pass element references to this method.
*/
(function () {
    'use strict';
    function supportsProperty(p) {
        var prefixes = ['Webkit', 'Moz', 'O', 'ms'],
            i,
            div = document.createElement('div'),
            ret = p in div.style;
        if (!ret) {
            p = p.charAt(0).toUpperCase() + p.substr(1);
            for (i = 0; i < prefixes.length; i += 1) {
                ret = prefixes[i] + p in div.style;
                if (ret) {
                    break;
                }
            }
        }
        return ret;
    }
    var icons;
    if (!supportsProperty('fontFeatureSettings')) {
        icons = {
            'Autre': '&#xe930;',
            'Magasin non spécialisé': '&#xe931;',
            'Magasin spécialisé': '&#xe932;',
            'Marché': '&#xe933;',
            'dupli_commande': '&#xe92f;',
            'annul commande': '&#xe92e;',
            'Coché': '&#xe92b;',
            'Non coché': '&#xe92c;',
            'Précédent': '&#xe929;',
            'Suivant': '&#xe92a;',
            'Commande': '&#xe925;',
            'Danger': '&#xe926;',
            'Valider': '&#xe927;',
            'Attention': '&#xe928;',
            'Ok': '&#xe921;',
            'Désolé': '&#xe923;',
            'Erreur': '&#xe924;',
            'Stock': '&#xe920;',
            'email': '&#xe909;',
            'fiche complète': '&#xe91e;',
            'Modifier': '&#xe91f;',
            'répertoire': '&#xe916;',
            'calendrier': '&#xe902;',
            'coordonnées': '&#xe906;',
            'informations administratives': '&#xe91c;',
            'informations bancaires': '&#xe91d;',
            'administratif': '&#xe900;',
            'automne': '&#xe901;',
            'clients': '&#xe903;',
            'collectivité privée': '&#xe904;',
            'collectivité publique': '&#xe905;',
            'culture': '&#xe907;',
            'dupliquer': '&#xe908;',
            'entreprise': '&#xe90a;',
            'été': '&#xe90b;',
            'fournisseur': '&#xe90c;',
            'fruit': '&#xe90d;',
            'hiver': '&#xe90e;',
            'légume': '&#xe90f;',
            'mesure': '&#xe910;',
            'particulier': '&#xe911;',
            'produit congelé': '&#xe912;',
            'produit manufacturé': '&#xe913;',
            'produit préparé': '&#xe914;',
            'printemps': '&#xe915;',
            'société': '&#xe917;',
            'créer un xls': '&#xe918;',
            'envoyer un xls': '&#xe919;',
            'ouvrir un xls': '&#xe91a;',
            'file-text2': '&#xe92d;',
            'file4': '&#xe92d;',
            'reload': '&#xe984;',
            'outils': '&#xe994;',
            'Modifi': '&#xea2d;',
            'Réservé': '&#xe98f;',
            'Liste complète': '&#xe9ba;',
            'Site Internet': '&#xe9c9;',
            'imprimer': '&#xe954;',
            'panier': '&#xe93a;',
            'image': '&#xe91b;',
            'fichier': '&#xe922;',
            'localisation': '&#xe947;',
            'ajouter': '&#xf067;',
            'livraison': '&#xf0d1;',
            'dossier': '&#xf114;',
            'dossier ouvert': '&#xf115;',
            'précédent': '&#xf137;',
            'suivant': '&#xf138;',
            'pdf': '&#xf1c1;',
            'excel': '&#xf1c3;',
          '0': 0
        };
        delete icons['0'];
        window.icomoonLiga = function (els) {
            var classes,
                el,
                i,
                innerHTML,
                key;
            els = els || document.getElementsByTagName('*');
            if (!els.length) {
                els = [els];
            }
            for (i = 0; ; i += 1) {
                el = els[i];
                if (!el) {
                    break;
                }
                classes = el.className;
                if (/icon-/.test(classes)) {
                    innerHTML = el.innerHTML;
                    if (innerHTML && innerHTML.length > 1) {
                        for (key in icons) {
                            if (icons.hasOwnProperty(key)) {
                                innerHTML = innerHTML.replace(new RegExp(key, 'g'), icons[key]);
                            }
                        }
                        el.innerHTML = innerHTML;
                    }
                }
            }
        };
        window.icomoonLiga();
    }
}());

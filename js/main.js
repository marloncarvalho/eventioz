(function () {
    'use strict';

    var conf = {};

    // Init functions, called on DOMContentLoaded event
    conf.init = function () {
        conf.map.init($('#map-canvas'));
        conf.menu.init();
    };

    /***
     Google Maps implementation
     ***/
    conf.map = {
        marker: 'img/marker-default.png'
    };

    // Google Maps configs
    conf.map.init = function ($element) {
        conf.map.element = $element;

        conf.map.geocoder = new google.maps.Geocoder();

        conf.map.latlng = new google.maps.LatLng(0, 0);

        conf.map.options = {
            zoom: 16,
            center: conf.map.latlng,
            scrollwheel: false,
            streetViewControl: true,
            labels: true,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        conf.map.canvas = new google.maps.Map(conf.map.element.get(0), conf.map.options);
        conf.map.canvas.setCenter(conf.map.latlng);

        conf.map.createMarker();
    };

    conf.map.createMarker = function () {
        conf.map.latlng = new google.maps.LatLng(conf.map.element.attr('data-latitude'), conf.map.element.attr('data-longitude'));
        conf.map.canvas.setCenter(conf.map.latlng);
        new google.maps.Marker({
            map: conf.map.canvas,
            position: conf.map.latlng,
            icon: conf.map.marker
        });
    };

    /***
     Create animated scroll for menu links
     ***/
    conf.menu = {
        itemsSelector: '.nav-link[href^="#"]',
        animationSpeed: 400
    };

    conf.menu.init = function () {
        conf.menu.menuItems = $(conf.menu.itemsSelector);
        conf.menu.document = $('html, body');

        conf.menu.menuItems.on('click.animateScroll', function (event) {
            event.preventDefault();

            conf.menu.animateTo(event.target);
        });
    };

    conf.menu.animateTo = function (link) {

        var $link = $(link),
            href = $link.attr('href'),
            offSetTop = $(href).offset().top;

        conf.menu.document.finish().animate({scrollTop : offSetTop}, conf.menu.animationSpeed, function () {
            location.hash = href;
        });
    };

    conf.init();
}());
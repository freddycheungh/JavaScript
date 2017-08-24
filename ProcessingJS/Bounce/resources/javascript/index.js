"use strict";

var app = app || {};

(function(app) {

    app.showMenu = function() {
        var menu = document.querySelectorAll(".menu--icon");
        for (var i = 0, length = menu.length; i < length; i++) {
            if (menu[i].className.indexOf("active-menu")) {
                menu[i].className = menu[i].className.replace("active-menu", "inactive-menu");
            }
            else {
                menu[i].className = menu[i].className.replace("inactive-menu", "active-menu");
            }
        }
        document.querySelector(".menu").className += " active";
        document.querySelector(".menu--content").className = document.querySelector(".menu--content").className.replace("inactive", "active");
        document.querySelector(".content--holder").className += " active";
        document.getElementsByTagName("FOOTER")[0].className += " active";
        document.body.style.overflowY = "hidden";
    }

    app.closeMenu = function() {
        var menu = document.querySelectorAll(".menu--icon");
        for (var i = 0, length = menu.length; i < length; i++) {
            if (menu[i].className.indexOf("inactive-menu")) {
                menu[i].className = menu[i].className.replace("inactive-menu", "active-menu")
            }
            else {
                menu[i].className = menu[i].className.replace("active-menu", "inactive-menu")
            }
        }
        document.querySelector(".menu").className = document.querySelector(".menu").className.replace(" active", "");
        document.querySelector(".menu--content").className = document.querySelector(".menu--content").className.replace("active", "inactive");
        document.querySelector(".content--holder").className = document.querySelector(".content--holder").className.replace(" active", "");
        document.getElementsByTagName("FOOTER")[0].className = document.getElementsByTagName("FOOTER")[0].className.replace(" active", "");
        document.body.style.overflowY = "auto";
    }

    app.handleSubMenu = function(type, parent) {
        switch (type) {
            case "lab":
                var element = document.getElementById("menu-lab");
                if (element.className.indexOf("inactive") > -1) {
                    element.className = element.className.replace("inactive", "active");
                    parent.children[0].className = parent.children[0].className.replace("fa-rotate-270", "vertical-align-top");
                }
                else {
                    element.className = element.className.replace("active", "inactive");
                    parent.children[0].className = parent.children[0].className.replace("vertical-align-top", "fa-rotate-270");
                }
            break;
            case "assignment":
                var element = document.getElementById("menu-assignment");
                if (element.className.indexOf("inactive") > -1) {
                    element.className = element.className.replace("inactive", "active");
                    parent.children[0].className = parent.children[0].className.replace("fa-rotate-270", "vertical-align-top");
                }
                else {
                    element.className = element.className.replace("active", "inactive");
                    parent.children[0].className = parent.children[0].className.replace("vertical-align-top", "fa-rotate-270");
                }
            break;
        }
    }

})(app);

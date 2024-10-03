/*
Template Name: TechUI - Responsive Bootstrap 5 Admin Dashboard
Author: GetAppui
File: Vecor maps init js
*/
import jsVectorMap  from "jsvectormap";
import 'jsvectormap/dist/css/jsvectormap.min.css'
window.jsVectorMap = jsVectorMap;

import 'jsvectormap/dist/maps/world.js'
import 'jsvectormap/dist/maps/world-merc.js'


class VectorMap {

    initWorldMapMarker() {
        const map = new jsVectorMap({
            map: 'world',
            selector: '#world-map-markers',
            zoomOnScroll: false,
            zoomButtons: true,
            markersSelectable: true,
            markers: [
                { name: "Greenland", coords: [72, -42] },
                { name: "Canada", coords: [56.1304, -106.3468] },
                { name: "Brazil", coords: [-14.2350, -51.9253] },
                { name: "Egypt", coords: [26.8206, 30.8025] },
                { name: "Russia", coords: [61, 105] },
                { name: "China", coords: [35.8617, 104.1954] },
                { name: "United States", coords: [37.0902, -95.7129] },
                { name: "Norway", coords: [60.472024, 8.468946] },
                { name: "Ukraine", coords: [48.379433, 31.16558] },
            ],
            markerStyle: {
                initial: { fill: "#3980c0" },
                selected: { fill: "#3980c06e" }
            },
            labels: {
                markers: {
                    render: marker => marker.name
                }
            }
        });
    }

    // World Map Markers with Line
    initWorldMarkerLine() {
        const worldlinemap = new jsVectorMap({
            map: "world_merc",
            selector: "#world-map-markers-line",
            zoomOnScroll: false,
            zoomButtons: false,
            markers: [{
                name: "Greenland",
                coords: [72, -42]
            },
            {
                name: "Canada",
                coords: [56.1304, -106.3468]
            },
            {
                name: "Brazil",
                coords: [-14.2350, -51.9253]
            },
            {
                name: "Egypt",
                coords: [26.8206, 30.8025]
            },
            {
                name: "Russia",
                coords: [61, 105]
            },
            {
                name: "China",
                coords: [35.8617, 104.1954]
            },
            {
                name: "United States",
                coords: [37.0902, -95.7129]
            },
            {
                name: "Norway",
                coords: [60.472024, 8.468946]
            },
            {
                name: "Ukraine",
                coords: [48.379433, 31.16558]
            },
            ],
            lines: [{
                from: "Canada",
                to: "Egypt"
            },
            {
                from: "Russia",
                to: "Egypt"
            },
            {
                from: "Greenland",
                to: "Egypt"
            },
            {
                from: "Brazil",
                to: "Egypt"
            },
            {
                from: "United States",
                to: "Egypt"
            },
            {
                from: "China",
                to: "Egypt"
            },
            {
                from: "Norway",
                to: "Egypt"
            },
            {
                from: "Ukraine",
                to: "Egypt"
            },
            ],
            regionStyle: {
                initial: {
                    stroke: "#9ca3af",
                    strokeWidth: 0.25,
                    fill: '#9ca3af69',
                    fillOpacity: 1,
                },
            },
            markerStyle: {
                initial: { fill: "#9ca3af" },
                selected: { fill: "#9ca3af" }
            },
            lineStyle: {
                animation: true,
                strokeDasharray: "6 3 6",
            },
        });
    }

    init() {
        this.initWorldMapMarker();
        this.initWorldMarkerLine();
    }

}

document.addEventListener('DOMContentLoaded', function (e) {
    new VectorMap().init();
});

// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "@hotwired/stimulus"
import "@popperjs/core"
import "./controllers"
import "bootstrap"
import "chartkick/chart.js"
import Chartkick from "chartkick";
window.Chartkick = Chartkick;

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require autocomplete-rails
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
//= require nested_form_fields
//= require jquery_ujs

<script type="text/javascript">
    var mytextbox = document.getElementById('mytext');
    var mydropdown = document.getElementById('dropdown');

    mydropdown.onchange = function(){
          mytextbox.value = mytextbox.value  + this.value; //to appened
         //mytextbox.innerHTML = this.value;
    }
</script>

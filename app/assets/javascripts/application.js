// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  var check_upload_file_size = function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 3) {
      alert('Maximum file size is 3MB. Please choose a smaller file.');
    }
  }

  $('#fightpost_picture').change(check_upload_file_size);
  $('#profile_avatar').change(check_upload_file_size);
});

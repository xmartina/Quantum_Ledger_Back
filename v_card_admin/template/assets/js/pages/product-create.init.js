/*
Template Name: TechUI - Responsive Bootstrap 5 Admin Dashboard
Author: GetAppui
File: Quilljs init js
*/



// Snow theme
import Quill from "quill";

import 'quill/dist/quill.core.css';
import 'quill/dist/quill.snow.css';
import 'quill/dist/quill.bubble.css'

import Dropzone from "dropzone";
import 'dropify/dist/js/dropify.min';


import Dropify from 'dropify';
import 'dropify/dist/css/dropify.min.css';


var quill = new Quill("#snow-editor", {
  theme: "snow",
  modules: {
    toolbar: [
      [{ font: [] }, { size: [] }],
      ["bold", "italic", "underline", "strike"],
      [{ color: [] }, { background: [] }],
      [{ script: "super" }, { script: "sub" }],
      [{ header: [false, 1, 2, 3, 4, 5, 6] }, "blockquote", "code-block"],
      [
        { list: "ordered" },
        { list: "bullet" },
        { indent: "-1" },
        { indent: "+1" },
      ],
      ["direction", { align: [] }],
      ["link", "image", "video"],
      ["clean"],
    ],
  },
});

!(function (i) {
  "use strict";
  function e() {
    this.$body = i("body");
  }
  (e.prototype.init = function () {
    (Dropzone.autoDiscover = !1),
      i('[data-plugin="dropzone"]').each(function () {
        var e = i(this).attr("action"),
          o = i(this).data("previewsContainer"),
          e = { url: e },
          o =
            (o && (e.previewsContainer = o),
              i(this).data("uploadPreviewTemplate"));
        o && (e.previewTemplate = i(o).html()), i(this).dropzone(e);
      });
  }),
    (i.FileUpload = new e()),
    (i.FileUpload.Constructor = e);
})(window.jQuery),
  (function () {
    "use strict";
    window.jQuery.FileUpload.init();
  })(),
  0 < $('[data-plugins="dropify"]').length &&

  new Dropify($('[data-plugins="dropify"]'), {
    messages: {
      'default': 'Drag and drop a file here or click',
      'replace': 'Drag and drop or click to replace',
      'remove': 'Remove',
      'error': 'Ooops, something wrong appended.'
    },
    error: {
      'fileSize': 'The file size is too big (1M max).'
    }
  });

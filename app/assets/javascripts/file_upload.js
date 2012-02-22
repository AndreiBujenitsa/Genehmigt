$(document).ready(function(){
    $('#dropZone').fileupload({
        dataType: 'json',
        url: '/upload',
        fileInput: $('#inputFile'),
        done: function (e, data) {
            $.each(data.result, function (index, file) {
                $('#dropZone').append('<p>Attached file: ' + file.name + ' (' + file.size + ') <input type="hidden" name="files[]" value="' + file.id + '"></p>');
            });
        }
    });
});
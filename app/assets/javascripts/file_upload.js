$(document).ready(function(){
    $('#dropZone').fileupload({
        dataType: 'json',
        url: '/upload',
        fileInput: $('#inputFile'),
        done: function (e, data) {
            $.each(data.result, function (index, file) {
                var file_row_id = 'file_row_'+ file.id;
                var remove_icon_id = 'remove_file_' + file.id;
                
                $('#dropZone').append('<p id="' + file_row_id + '" class="file_line">Attached file: ' + file.name + ' (' + file.size + ') <input type="hidden" name="files_ids[]" value="' + file.id + '"><a id=' + remove_icon_id + '><i" class="icon-trash"></i></a></p>');
                $("#" + remove_icon_id).click(function(){
                    $("#" + file_row_id).remove();
                })
            });
        }
    });
});
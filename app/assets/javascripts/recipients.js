$(document).ready(function(){
    var id_counter = 0;
    function insertRow(email, role_id, role_title){
        var uniq = true;
        var items = $('input[role="email"]');
        items.each(function(i,element){
           if($(element).val() == email){
              uniq = false;
             alert('This e-mail is already in the recipients list.');
        }
    })
    
    if(uniq){
        $('#recipients > tbody:last').append(
            '<tr id="recipient_row' + id_counter + '"><td><a id="remove_recipient_row' + id_counter + '"><i class="icon-trash"></i></a></td><td>' + email + '<input type="hidden" role="email" name="user_process[recipients[rec_' + id_counter + '][email]]" value="' + email + '"></td><td>' + role_title + '<input type="hidden" name="user_process[recipients[rec_' + id_counter + '][role]]" value="' + role_id + '"></td></tr>'
        );

        var remove_id_string = '#recipient_row' + id_counter;

        $('#remove_recipient_row' + id_counter).click(function(){
            $(remove_id_string).remove();
        });

        $('#email').val('');
        id_counter++;
      }
      $('#role').val(0);
      $('#role').attr('disabled', '');
    }

    $('#submit_btn').click(function(){
        $('#create_form').submit();
    });

    $('#role').attr('disabled', '');

    $('#email').bind('keyup change', function(){
        var email_string = $('#email').val();
        if(email_string.match(/^[\w-\+\.]+@([\w-]+\.)+[\w-]{2,4}$/i)){
            $('#role').removeAttr('disabled');
        } else {
            $('#role').attr('disabled', '');
        }
    })

    $('#role').change(function(){
        insertRow($('#email').val(), $('#role').val(), $('#role option:selected').text());
    })
})
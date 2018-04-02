$(document)
    .ready(function() {
        $('#btnShowAddContact')
            .click(function() {
                $('#addContactModal').modal('show');
                $('#name').val('');
                $('#phoneNumber').val('');
            });

        $('#btnSaveContact')
            .click(function() {
                var contact = {};

                contact.Name = $('#name').val();
                contact.PhoneNumber = $('#phoneNumber').val();

                $.post(contactPath, contact)
                    .done(function() {
                        loadContacts();
                        $('#addContactModal').modal('hide');
                    })
                    .fail(function(jqXhr, status, err) {
                        alert(status + ' - ' + err);
                    });
            });
    });
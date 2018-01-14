$(document).ready ->
    $("#result").attr('disabled','disabled'); #disabled field result
    $('#submit').attr('disabled','disabled'); #disabled field submit
    $('#currency, #currency_destination, #quantity').change -> handle() # get value id
    $('#quantity').keyup -> handle() #in event keyup call the function handle
    handle = ->
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json',
          beforeSend: ->
            $('#loading').show() #show loading
            $('#submit').removeAttr('disabled'); #disabled field submit
            $('#quantity').attr('disabled','disabled');
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            currency = $("#currency").val()
            if currency != "" # if currency is diferent of blank
                $('#result').val(data.value) #put value in field result
                $('#loading').hide(); #hide loading
                $('#quantity').removeAttr('disabled');

    #during submit
    $('#invert_currency').click ->
            currency = $("#currency option:selected").text() #get value field currency
            currency_destination = $("#currency_destination option:selected").text() #get value field
            $("#currency").val(currency_destination) #set val of currency_destination in currency
            $("#currency_destination").val(currency) #set val of currency in currency_destination
            $("#currency").change()
            $('#quantity').removeAttr('disabled');
            return false;

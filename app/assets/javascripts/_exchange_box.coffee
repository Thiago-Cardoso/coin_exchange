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
          #during submit
          $('form').submit ->
              if $('form').attr('action') == '/exchange'
                $.ajax '/exchange',
                    type: 'POST'
                    dataType: 'json',
                    beforeSend: ->
                        $('#submit').attr('disabled','disabled'); #disable field submit
                        $('#loading').show() #show loading
                        $('#submit').removeAttr('disabled'); #enable field submit
                    data: {
                            currency: $("#currency_destination").val(),
                            currency_destination: $("#currency").val(),
                            quantity: $("#quantity").val()
                          }
                    error: (jqXHR, textStatus, errorThrown) ->
                      alert textStatus
                    success: (data, text, jqXHR) ->
                      currency = $("#currency option:selected").text() #get value field currency
                      currency_destination = $("#currency_destination option:selected").text() #get value field currency_destination
                      $("#currency").val(currency_destination)
                      $("#currency_destination").val(currency)
                      $('#result').val(data.value) #put value in field result
                      $('#loading').hide(); #hide loading
                  return false;

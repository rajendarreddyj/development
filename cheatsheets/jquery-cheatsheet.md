jquery-cheatsheet
===================

A cheatsheet on the usage of jquery.

$(document).ready(function() { 
    //start here
});
 
//get element by id
$('#something')
 
//get element by class
$('.something')
 
//get input that by name in a element with id and set its value
$(':[name=txtCardNumber]', '#somediv').val('');
 
//get elements that have some class in some element that is not visible
$('.someclass', '#someid').not(':visible')
 
//get the selected value in a drop down
$('option:selected', '#someid').val();
 
//get the checked value of a checkbox in some element
    1) $('input[name=someCheckBox]', '#someid').attr('checked');
    2) $('#somecheckbox').is(':checked')
 
//set the value of some asp.net control
$('#<%= aspnet_object.ClientID %>').val(newZip);
 
//simple function to check all checkboxes
//<input type="checkbox" onclick="InterestOptionAll_OnChange(this);" /><b>Check All</b>
function InterestOptionAll_OnChange(obj) {
    var isChecked = $(obj).is(':checked');
        
    $('input:checkbox', '.interestOptions').each( function(){
        this.checked = isChecked;
    });
}

//Get value of select
$("#myselect").val();
 
//Get string of selected option
$("#myselect option:selected").text();
 
//Setting select to first option value (default)
$('#myselect').prop('selectedIndex',0);
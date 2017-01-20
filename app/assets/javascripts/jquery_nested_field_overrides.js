// Sobrescrevendo nested_form para funcionar em tabelas.
//
// Fonte:
// https://github.com/ryanb/nested_form/wiki/How-To:-Render-nested-fields-inside-a-table 
window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
  var $tr = $(link).closest('tr');
  return $(content).insertBefore($tr);
}

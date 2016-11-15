/*
 * BY: Dillan Esaú Barbosa.
 *  2016/11/14
 */

function submitform(formName, idElement, value, msg)
{
    if (msg === undefined) {
        msg = 'este elemento';
    }
    if (confirm('Seguro que quiere eliminar ' + msg + ' ?') === true) {
        document.getElementById(idElement).value = value;
        document.forms[formName].submit();
    }
}
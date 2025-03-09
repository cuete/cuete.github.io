function encodeToBase64(input) {
    return btoa(input);
}
function decodeFromBase64(input) {
    return atob(input);
}
function pad(num, size) {
    var s = num + "";
    while (s.length < size)
        s = "0" + s;
    return s;
}
function getCurrentDateTime() {
    var now = new Date();
    var year = now.getFullYear();
    var month = pad(now.getMonth() + 1, 2);
    var day = pad(now.getDate(), 2);
    var hours = pad(now.getHours(), 2);
    var minutes = pad(now.getMinutes(), 2);
    return "".concat(year).concat(month).concat(day).concat(hours).concat(minutes);
}
document.addEventListener('DOMContentLoaded', function () {
    var inputElement = document.getElementById('inputText');
    var outputElement = document.getElementById('outputText');
    var encodeButton = document.getElementById('encodeButton');
    var decodeButton = document.getElementById('decodeButton');
    encodeButton.addEventListener('click', function () {
        var datetime = getCurrentDateTime();
        var inputText = inputElement.value + '_' + datetime;
        var encodedText = encodeToBase64(inputText);
        outputElement.innerHTML = inputText + '<br><br>' + '-ae<img src="https://hostedservices.blob.core.windows.net/$web/eof.jpg?type=' + encodedText + '">' + '<br><br>';
    });
    decodeButton.addEventListener('click', function () {
        var inputText = inputElement.value;
        var decodedText = decodeFromBase64(inputText);
        outputElement.textContent = decodedText;
    });
});

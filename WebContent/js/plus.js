function jia() {
	var count = parseInt(document.getElementById("count").value);
	document.getElementById("count").value = count + 1;
	}
function jian() {
	var count = parseInt(document.getElementById("count").value);
	if (count > 1) {
		document.getElementById("count").value = count - 1;
	}
}
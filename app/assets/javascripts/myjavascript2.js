function getData(data) {
  var p1 = data.replace('[', "");
  var p2 = p1.replace(']', "");
  p1 = p2.replace(/"/g, "");
  p2 = p1.replace(/,/g, "");
  var data_array = p2.split(" ");
  data_array.shift();
  data_array.pop();
  return data_array;
}

  function overagePhoneNumber() {
    //******* need to match customer to csr and day
    var names = document.getElementById("phonenames").innerHTML;
    var numbers = document.getElementById("phonenumbers").innerHTML;
    var name_array = getData(names);
    var number_array = getData(numbers);
    var name_list = document.getElementById("overage_name");
    var name = name_list.options[name_list.selectedIndex].text;
    var numberlength = number_array.length;
    var number = document.getElementById("overage_number");
    var number_id = ' ';
    var o = document.createElement("option");
    var sortarray = [];
    var i = 0;
    number.options.length = 0;
    var o = document.createElement("option");
    var sortarray = [];
    var i = 0;

    for (i = 0; i < numberlength; i++) {
      var name_str = name_array[i].replace('*', ', ')
      if (name_str == name) {
        if (sortarray.includes(number_array[i]) == false) {
          sortarray[sortarray.length] = number_array[i];
        }
      }
    }
    sortarray.sort();
    var sortlength = sortarray.length;
    o.selected = true;
    number_id = sortarray[0];
    for (i = 0; i < sortlength; i++) {
      o.text = sortarray[i];
      number.options.add(o, number.options.length);
      o.selected = false;
      o = document.createElement("option");
    }

  }

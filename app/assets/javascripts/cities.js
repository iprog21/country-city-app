document.addEventListener("turbolinks:load", function(){
  var country = document.getElementById("country");
  var cities = document.getElementById("cities");

  country.addEventListener("change", function(){
    Rails.ajax({
      url: "/cities?country=" + country.value,
      type: "GET"
    })
  })

  cities.addEventListener("change", function(){
    Rails.ajax({
      url: "/display_greetings?country=" + country.value + "&city=" + cities.value,
      type: "GET"
    })
  })
})

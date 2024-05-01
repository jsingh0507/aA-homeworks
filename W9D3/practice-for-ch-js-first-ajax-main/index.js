console.log("Hello from the console!");

const id = "bcb83c4b54aee8418983c2aff3073b3b";
const city = "London,GB";

fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${id}`)
  .then(response => {
    if(!response.ok) {
        throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    console.log("Success!", data);
  })
  .catch(error => {
    console.error("Failure!", error);
  });
  

console.log("The AJAX request has been dispatched.");
// Your code here
// simple timeout
window.setTimeout(function () {
    alert('HAMMER TIME!');
}, 5000);
  
// timmeout w/ closure  
function hammerTime (time) {
    window.setTimeout(function () {
      alert(`${time} is HAMMER TIME!`);
    });
}
// Some tea? Some biscuits?
const readline = require('readline');
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
function teaAndBiscuits () {
    reader.question('Would you like some tea?', function (ans1) {
      console.log(`You replied ${ans1}.`);
      reader.question('Would you like some biscuits?', function (ans2) {
        console.log(`You replied ${ans2}.`);
        
        const i = (ans1==='yes') ? 'do':'don\'t';
        const j = (ans2==='yes') ? 'do':'don\'t';
  
        console.log(`So you ${i} want tea and you ${j} want biscuits.`);
        reader.close();
      });
    });
}

// catsdogs

//cunstroctor
function Cat () {
    this.name = 'Markov';
    this.age = 3;
}
  
function Dog () {
    this.name = 'Noodles';
    this.age = 4;
}
//function on dog passing cat 
Dog.prototype.chase = function (cat) {
    console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
 };
  
const Markov = new Cat ();
const Noodles = new Dog ();
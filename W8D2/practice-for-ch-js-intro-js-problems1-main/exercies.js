function madLib(verb, adj, noun) {
    console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`);
}
// madLib('make', 'best', 'guac');

function isSubstring(searchString, subString){
    return searchString.includes(subString);
}

// console.log(isSubstring("time to program", "time")); //true
// console.log(isSubstring("Jump for joy", "joys"));//false

function fizzBuzz(array) {
    const result = [];
    for (let i = 0; i < array.length; i++) {
      const num = array[i];
      if ((num % 3 === 0 || num % 5 === 0) && !(num % 3 === 0 && num % 5 === 0)) {
        result.push(num);
      }
    }
    return result;
  }

// console.log(fizzBuzz([1, 3, 5, 7,9,15])) // 3,5,9

function isPrime(n){
    if (n<2){
        return false
    }
    for (let i = 2; i< n-1; i++){
        if (n%i == 0){
            return false
        }
    }
    return true
}

// console.log(isPrime(3548563)) // false
// console.log(isPrime(2)) //true

function sumOfNPrimes(n){
    let sum=0;
    let count=0;
    let i=2;

    while (count<n){
        if(isPrime(i)){
            sum+=i;
            count++;
        }
        i++
    }
    return sum
}

// console.log(sumOfNPrimes(0)) //0
// console.log(sumOfNPrimes(1)) //2
// console.log(sumOfNPrimes(4)) //17
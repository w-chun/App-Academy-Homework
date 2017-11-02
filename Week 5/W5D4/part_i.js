function madLib(verb, adj, noun) {
  return `We shall ${verb} the ${adj} ${noun}.`
}

madLib('make', 'best', 'guac');

function isSubstring(phrase, subphase) {
  return phrase.includes(subphase);
}

isSubstring("time to program", "time");


function fizzBuzz(array) {
  const result = [];

  array.forEach( el => {
    if ((el % 3 ===0) ^ (el % 5 === 0)) {
      result.push(el);
    }
  });

  return result;
}

fizzBuzz([1,2,3,4,5,6]);

function isPrime(n) {
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

isPrime(2);

function sumOfNPrimes(n) {
  let sum = 0;
  let count = 0;
  let i = 2;

  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }

  return sum;
}

sumOfNPrimes(7);

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question("Would you like some tea?"), function (response) {
    console.log(`Your response: ${response}`);
    reader.question("Would you like some biscuits?"), function (answer) {
      console.log(`Your response: ${answer}`);

      const firstAns = (response === "yes") ? "do" : "don't" ;
      const secondAns = (response === "yes") ? "do" : "don't" ;

      console.log(`So you ${firstAns} want tea and you ${secondAns} want coffee.`);
      reader.close();

    };
  };
}

teaAndBiscuits();

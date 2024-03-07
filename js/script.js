document.addEventListener('DOMContentLoaded', function () {
  var startButton = document.getElementById('startButton');
  var gameContent = document.getElementById('gameContent');
  var storyText = document.getElementById('storyText');
  var result = document.getElementById('result');
  var pathButtons = document.querySelectorAll('.choice-btn');

  var path1 = document.getElementById('path1');
  var path2 = document.getElementById('path2');
  var path3 = document.getElementById('path3');

  path1.addEventListener('click', function() {
    handlePath([
      { text: 'Unisciti ai mercanti', handlerName: 'joinMerchants' },
      { text: 'Continua da solo', handlerName: 'continueAlone' },
    ], "Hai scelto il Percorso delle montagne. Il sentiero si inerpica tra le vette innevate, offrendoti panorami mozzafiato. All'improvviso, incontri un gruppo di mercanti che si dirigono verso la città. Ti unisci a loro o continui da solo?");
  });

  path2.addEventListener('click', function() {
    handlePath([
      { text: 'Segui il sentiero abbandonato', handlerName: 'followAbandonedPath' },
      { text: 'Esplora un nuovo percorso', handlerName: 'exploreNewPath' },
    ], "Hai scelto il Sentiero attraverso la foresta. Ti avventuri nel fitto della foresta, dove gli alberi sembrano guardarti con occhi oscuri. Trovi un sentiero abbandonato. Lo segui o cerchi un nuovo percorso?");
  });

  path3.addEventListener('click', function() {
    handlePath([
      { text: 'Indaga sull\'imbarcazione', handlerName: 'investigateShipwreck' },
      { text: 'Evita la zona', handlerName: 'avoidArea' },
    ], "Hai scelto la Strada costiera. Cammini lungo la riva del mare, il vento salmastro che ti accarezza il viso. Improvvisamente, vedi un'imbarcazione distrutta sulla spiaggia. Indaghi o eviti la zona?");
  });

  startButton.addEventListener('click', function () {
    startButton.style.display = 'none';
    gameContent.style.display = 'block';
  });
  
  function handlePath(choices, phrase) {
    for (var i = 0; i < pathButtons.length; i++) {
      pathButtons[i].style.display = 'none';
    }
    storyText.innerHTML = phrase;
    displayChoices(choices);
  }

  function displayChoices(choices) {
    var buttonsHTML = '';
    for (var i = 0; i < choices.length; i++) {
      buttonsHTML += '<button class="btn btn-info choice-btn" data-handler="' + choices[i].handlerName + '">' + choices[i].text + '</button>';
    }
    result.innerHTML = buttonsHTML;
    result.style.display = 'block';
    var choiceButtons = result.querySelectorAll('.choice-btn');
    for (var j = 0; j < choiceButtons.length; j++) {
      choiceButtons[j].addEventListener('click', handleChoice);
    }
  }

  function handleChoice(event) {
    var handlerName = event.target.getAttribute('data-handler');
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "php/response.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4 && xhr.status === 200) {
        var response = JSON.parse(xhr.responseText);
        storyText.innerHTML = response.phrase;
        displayChoices(JSON.parse(response.choices));
      }
    };
    xhr.send("handlerName=" + encodeURIComponent(handlerName));
  }

  var pathButtonsArray = Array.from(pathButtons);
  pathButtonsArray.forEach(function (button) {
    button.addEventListener('click', function () {
      for (var i = 0; i < pathButtons.length; i++) {
        pathButtons[i].style.display = 'none';
      }
    });
  });
});

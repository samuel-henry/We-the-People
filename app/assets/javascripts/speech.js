	onload=playSpeech;

  	function playSpeech() {
  		var sound 	//store audio elements while iterating over corresponding words
  		, words = document.getElementsByClassName("word") 	//get words that have been recorded
  		, wordSounds = new Array()	//store the audio elements for the recorded words
  		, i;	//declare i outside loop for performance

  		//collect audio elements for each word
  		for (i = 0; i < words.length; i++) {
  			sound = document.getElementById("audio_" + words[i].innerHTML.toLowerCase().replace(/\W/g, ''));
  			wordSounds.push(sound);
  		}

  		//if we found at least one recorded word, start playback
  		if (wordSounds.length > 0) {
  			playSoundQueue(wordSounds, words);
  		}
  	}

	//recursive approach derived http://stackoverflow.com/a/9456425/1443027
	function playSoundQueue(sounds, words){
		//index of word to be played
	    var index = 0;

	    function recursivePlay()
	    {
	      //highlight the word as its spoken
	      words[index].className = "word spokenWord";

	      //if the index is the last of the table, play the sound
	      //without running a callback after       
	      if(index+1 === sounds.length)
	      { play(sounds[index],null);
	      } else {
	        //else, play the sound, and when the playing is complete
	        //remove the event listener, increment index by one and 
	        //play the sound in the indexth position of the array
	        play(sounds[index],function(){$(sounds[index]).unbind('ended'); index++; recursivePlay();});
	      }
	    }

		//call recursive_play for the first time
		recursivePlay();
	}


  	//also inspired by http://stackoverflow.com/a/9456425/1443027
	function play(audio, callback) {

		//only call play() if an element was passed in
		if (audio) {

			//play the recording
		  	audio.play();

		  	if(callback) {
		      //when the audio object completes it's playback, call the callback
		      //provided. use bind() so we can unbind it after playback since the same 
		      //audio element could be played multiple times     
		      $(audio).bind('ended', callback);
		  	}
	  	} 
	}
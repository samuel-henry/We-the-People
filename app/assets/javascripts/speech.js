
  	onload=load;

  	function load() {
  		var sound
  		, words = document.getElementsByClassName("word")
  		, wordSounds = new Array()
  		, wordSoundMap = {};

  		for (var i = 0; i < words.length; i++) {
  			sound = document.getElementById("audio_" + words[i].innerHTML.toLowerCase().replace(/\W/g, ''));
  			wordSoundMap[sound] = words[i];
  			wordSounds.push(sound);
  		}
  		if (wordSounds.length > 0) {
  			play_sound_queue(wordSounds, words);
  		}
  	}

	//from user Loupax at http://stackoverflow.com/a/9456425/1443027
	function play_sound_queue(sounds, words){

	    var index = 0;
	    function recursive_play()
	    {
	      words[index].className = "word spokenWord";
	      //If the index is the last of the table, play the sound
	      //without running a callback after       
	      if(index+1 === sounds.length)
	      {
	        play(sounds[index],null);
	      }
	      else
	      {
	        //Else, play the sound, and when the playing is complete
	        //increment index by one and play the sound in the 
	        //indexth position of the array
	        play(sounds[index],function(){index++; recursive_play();});
	      }
	    }

		//Call the recursive_play for the first time
		recursive_play();   
	}


  	//from user Loupax at http://stackoverflow.com/a/9456425/1443027
	function play(audio, callback) {

	  //if (checkFileExists(audio)) {
	  if (audio) {
	  	audio.play();
	  	if(callback) {
	      //When the audio object completes it's playback, call the callback
	      //provided      
	      audio.addEventListener('ended', callback);
	  	}
	  } else {
	  	callback.call;
	  }
	}

	
/*
  <script>
  
  	onload=load;

  	function load() {
  		var sound
  		, wordSounds = new Array();

  		var words = document.getElementsByClassName("word");

  		for (var i = 0; i < words.length; i++) {
  			sound = new Audio("/audio/" + words[i].innerHTML.toLowerCase() + ".wav");
  			wordSounds.push(sound);
  		}
  		play_word_queue(words);
  		//play_sound_queue(wordSounds);

  	}

  	function playFromText(word, callback) {
  		if (!word) {
  			return;
  		}

  		var audio = new Audio("/audio/" + word.innerHTML.toLowerCase() + ".wav");

  		if (checkFileExists(audio)) {
	  		audio.play();
	  		word.className = "word speechTitle";
	  		if(callback) {
	      		//When the audio object completes it's playback, call the callback
	      		//provided      
	      		audio.addEventListener('ended', callback);
	  		}
	  	} else {
	  		//callback.call;
	  	}
  	}

  	//from user Loupax at http://stackoverflow.com/a/9456425/1443027
	function play(audio, callback) {
	  
	  if (checkFileExists(audio)) {
	  	audio.play();
	  	if(callback) {
	      //When the audio object completes it's playback, call the callback
	      //provided      
	      audio.addEventListener('ended', callback);
	  	}
	  } else {
	  	callback.call;
	  }
	}

	//from user Loupax at http://stackoverflow.com/a/9456425/1443027
	function play_word_queue(words){
		if (!words) {
			return;
		}

	    var index = 0;
	    function recursive_play()
	    {
	      //If the index is the last of the table, play the sound
	      //without running a callback after       
	      if(words[index] && index === words.length)
	      {
	      	words[index].className = "speechTitle";
	      	playFromText(words[index],null);
	        //play(sounds[index],null);
	      }
	      else if (index < words.length)
	      {
	        //Else, play the sound, and when the playing is complete
	        //increment index by one and play the sound in the 
	        //indexth position of the array
	        playFromText(words[index],function(){ index++; recursive_play();});
	        //play(sounds[index],function(){words[index].className = "word"; index++; recursive_play();});
	      }
	    }

		//Call the recursive_play for the first time
		recursive_play();   
	}

	function checkFileExists(file) {
		if (!file) {
			return false;
		}

		var http = new XMLHttpRequest();
		http.open("get",file.currentSrc, false);
	    try {
	    	
	    	http.send(null);
	    } catch(e) {
	  		return false;
	  	}
	  	return true;

	}

</script>*/
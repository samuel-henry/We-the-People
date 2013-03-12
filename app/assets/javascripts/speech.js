
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
	      //highlight the word as its spoken
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
	        //remove the event listener, increment index by one and 
	        //play the sound in the indexth position of the array
	        play(sounds[index],function(){$(sounds[index]).unbind('ended'); index++; recursive_play();});
	      }
	    }

		//Call the recursive_play for the first time
		recursive_play();   
	}


  	//from user Loupax at http://stackoverflow.com/a/9456425/1443027
	function play(audio, callback) {
	  if (audio) {
	  	audio.play();
	  	if(callback) {
	      //When the audio object completes it's playback, call the callback
	      //provided      
	      $(audio).bind('ended', callback);
	  	}
	  } else {
	  	callback.call;
	  }
	}
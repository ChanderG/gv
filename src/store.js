import Vue from	'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
	commits: [
	          { "time": "timestamp 1",
		    "author": "Person 1",
		    "msg": "Commit msg 1",
		    "hash": "0000000000"
		  },
	          { "time": "timestamp 2",
		    "author": "Person 2",
		    "msg": "Commit msg 2",
		    "hash": "1111111111111"
		  }
	],
	currhash: "none"
    }
})

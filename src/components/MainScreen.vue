<template>
  <div>
<v-navigation-drawer fixed clipped app class="blue lighten-2" dark :mini-variant="mini">
  
  <v-list>
  <v-list-tile @click="screen = 'Status'">
    <v-list-tile-action>
      <v-icon>dashboard</v-icon>
    </v-list-tile-action>
    <v-list-tile-content>
      <v-list-tile-title> Status </v-list-tile-title>
    </v-list-tile-content>
  </v-list-tile>
  
  <v-list-tile @click="screen = 'Log'">
    <v-list-tile-action>
      <v-icon>account_box</v-icon>
    </v-list-tile-action>
    <v-list-tile-content>
      <v-list-tile-title> Log </v-list-tile-title>
    </v-list-tile-content>
  </v-list-tile>
  </v-list>

<v-btn dark small fixed bottom right fab @click="mini = !mini">
  <v-icon>compare_arrows</v-icon>
</v-btn>

</v-navigation-drawer>


<v-content>
  <v-container>
    <v-layout column>
      <v-flex>
        <CommitLister v-if="screen == 'Log'"/>
      </v-flex>
      <v-flex>
        <CommitViewer v-if="screen == 'Log'"/>
      </v-flex>
    </v-layout>
    <StatusViewer v-if="screen == 'Status'"/>
   </v-layout>
 </v-container>
</v-content>
</div>
</template>

<script>
import CommitLister from './CommitLister.vue'
import CommitViewer from './CommitViewer.vue'
import StatusViewer from './StatusViewer.vue'

const axios = require('axios')

export default {
    name: 'MainScreen',
    data: function () {
        return {
            screen: "Log",
            mini: true
        }
    },
    components: {
        CommitLister,
        CommitViewer,
        StatusViewer
    },
    mounted: function () {
        axios.get('http://localhost:3000/commits')
            .then(response => (this.$store.state.commits = response.data))
    },
    created: function () {
        // live updates of status
        var conn = new WebSocket('ws://localhost:3001');
        var vm = this
        
        conn.onmessage = function (e) {
            vm.$store.state.status = e.data
        }
        
        conn.onopen = function (e) {
            conn.send("status")
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
    margin: 40px 0 0;
}
ul {
    list-style-type: none;
    padding: 0;
}
li {
    display: inline-block;
    margin: 0 10px;
}
a {
    color: #42b983;
}
</style>

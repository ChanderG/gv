<template>
  <div>
    <h1>gv: Tig like git visualizer</h1>
    <div>
      <select v-model="screen">
        <option>Log</option>
        <option>Status</option>
      </select>
      <CommitLister v-if="screen == 'Log'" class="left"/>
      <CommitViewer v-if="screen == 'Log'"/>
      <StatusViewer v-if="screen == 'Status'"/>
    </div>
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
            screen: "Log"
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

.left {
    border-bottom:1px solid black;
    overflow-y: auto;
    height: 400px;
}

</style>

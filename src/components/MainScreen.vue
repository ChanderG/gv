<template>
  <div>
    <h1>gv: Tig like git visualizer</h1>
    <div class="wrapper">
      <CommitLister class="left"/>
      <CommitViewer class="right"/>
    </div>
  </div>
</template>

<script>
import CommitLister from './CommitLister.vue'
import CommitViewer from './CommitViewer.vue'

const axios = require('axios')

export default {
    name: 'MainScreen',
    components: {
        CommitLister,
        CommitViewer
    },
    mounted: function () {
        axios.get('http://localhost:3000/commits')
            .then(response => (this.$store.state.commits = response.data))
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

.wrapper {
}
.left {
    border-bottom:1px solid black;
    overflow-y: auto;
    height: 400px;
}
.right {
}
</style>

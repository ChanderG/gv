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

export default {
    name: 'MainScreen',
    components: {
	CommitLister,
	CommitViewer
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
    display: grid;
}
.left {
    grid-column: 1 / 2;
    border-right:1px solid black;
}
.right {
    grid-column: 2 / 2;
}
</style>

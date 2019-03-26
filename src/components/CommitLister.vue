<template>
  <div>
    <h2>List of commits</h2>
    <CommitEntry v-for="c in this.$store.state.commits" :commit="c"></CommitEntry>
  </div>
</template>

<script>
import CommitEntry from './CommitEntry.vue'

export default {
  name: 'CommitLister',
  components: {
    CommitEntry
  }
}
</script>

<style scoped>
</style>



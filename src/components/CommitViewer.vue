<template>
  <div>
    <h2>Commit Viewer</h2>
    <h3> {{ this.$store.state.currhash }} </h3>
  </div>
</template>

<script>
export default {
  name: 'CommitViewer'
}
</script>

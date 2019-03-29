<template>
  <div>
    <h2> Status </h2>
    <div class="status">{{this.$store.state.status}}</div>
  </div>
</template>

<script>
export default {
    name: 'StatusViewer',
    data: function () {
        return {
            status: "empty"
        }
    }
}
</script>

<style>
.status {
  white-space: pre-wrap;
  text-align: left;
  margin: 10px;
  font-size: large;
}
</style>

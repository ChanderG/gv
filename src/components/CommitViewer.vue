<template>
  <div>
    <h2>Commit Viewer</h2>
    <h3> {{ currHash }} </h3>
    <div class="commitdetails"> {{ details }} </div>
  </div>
</template>

<script>
const axios = require('axios');

export default {
    name: 'CommitViewer',
    data: function() {
        return {
            details: ""
        }
    },
    computed: {
        currHash: function () {
            return this.$store.state.currhash;
        }
    },
    watch: {
        currHash: function (val) {
            this.details = "loading"
            var vm = this
            axios.get("http://localhost:3000/commit/" + val).then(response => (vm.details = response.data))
        }
    }
}
</script>

<style>
.commitdetails {
  white-space: pre-wrap;
  text-align: left;
  margin: 10px;
  font-size: large;
}
</style>

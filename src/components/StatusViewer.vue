<template>
  <div>
    <h2> Status </h2>
    <div>{{status}}</div>
  </div>
</template>

<script>
export default {
    name: 'StatusViewer',
    data: function () {
        return {
            status: "empty"
        }
    },
    created: function () {
        // live updates of status
        var conn = new WebSocket('ws://localhost:3001');
        var vm = this

        conn.onmessage = function (e) {
            vm.status = e.data
        }

        conn.onopen = function (e) {
            conn.send("status")
        }
    }
}
</script>

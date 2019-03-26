<template>
  <div class="entry">
    <div class="time">{{commit.time}}</div>
    <div class="author">{{commit.author}}</div>
    <div class="msg">{{commit.msg}}</div>
  </div>
</template>

<script>
export default {
    name: "CommitEntry",
    props: ['commit']
}
</script>
	 
<style scoped>
.entry {
  display: flex;
  justify-content: space-between;
  font-size: large;
}

.time {
  align: center;
  color: green;
  border: 2px solid;
  padding: 2px;
  margin: 2px 5px 2px 5px;
}

.author {
  margin: 2px 5px 2px 5px;
  padding: 2px;
}

.msg {
  flex-grow: 1;
  text-align: left;
  margin: 2px 5px 2px 5px;
  padding: 2px;
}
</style>

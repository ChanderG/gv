<template>
  <div class="entry" @click="setCurrCommit" v-bind:class="{highlight: isHighlighted, selected: isSelected}" @mouseover="isHighlighted = true" @mouseleave="isHighlighted = false">
    <div class="time">{{commit.time}}</div>
    <div class="author">{{commit.author}}</div>
    <div class="msg">|| {{commit.msg}}</div>
  </div>
</template>

<script>
export default {
    name: "CommitEntry",
    props: ['commit'],
    data: function () {
        return {
            isHighlighted: false
        }
    },
    methods: {
	setCurrCommit: function () {
            this.$store.state.currhash = this.commit.hash;
	}
    },
    computed: {
        isSelected: function () {
            return this.$store.state.currhash == this.commit.hash
        }
    }
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
  color: crimson;
  padding: 2px;
}

.msg {
  flex-grow: 1;
  text-align: left;
  margin: 2px 5px 2px 5px;
  padding: 2px;
}

.highlight {
  background: yellow;
}

.selected {
  border: 3px dashed;
}
</style>

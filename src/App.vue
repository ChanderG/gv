<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <MainScreen/>
  </div>
</template>

<script>
import MainScreen from './components/MainScreen.vue'
import store from './store'

export default {
  name: 'app',
  store,
  components: {
    MainScreen
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

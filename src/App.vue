<template>
  <v-app>
    <v-toolbar app clipped-left>
      <v-toolbar-title class="headline text-uppercase">
        <span>gV</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <span class="headline font-weight-light">The tig like Git Visualizer</span>
    </v-toolbar>

    <MainScreen/>
  </v-app>
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

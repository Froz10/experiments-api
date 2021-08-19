<template>
  <div class="container">
    <Header />
    <Statistics />
  </div>
</template>

<script>
import Header from './components/Header'
import Statistics from './components/Statistics'

export default {
  name: 'App',
  components: {
    Header,
    Statistics
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400&display=swap');
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
body {
  font-family: 'Poppins', sans-serif;
}
.container {
  max-width: 800px;
  margin: 30px auto;
  overflow: auto;
  min-height: 500px;
  border: 1px solid steelblue;
  padding: 30px;
  border-radius: 5px;
}
</style>

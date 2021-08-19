<template>
  <div class="container">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Device Token</th>
          <th scope="col">Button Color</th>
          <th scope="col">Price</th>
        </tr>
      </thead>
      <tbody>
        <template v-for="statistic in statistics" :key="statistic.id">
          <tr>
            <th scope="row">{{ statistic.id }}</th>
            <td> {{ statistic.token }} </td>
            <td> {{ statistic.button_color }} </td>
            <td> {{ statistic.price }} </td>
          </tr>
        </template>
      </tbody>
    </table>
   </div>  
</template>

<script>
import axios from 'axios'

export default {
  name: 'Statistics',
  data () {
    return {
      statistics: []
    }
  },
  created: function () {
    axios
      .get('http://localhost:3000/api/statistics')
      .then(response => { this.statistics = response.data })
      .catch(error => this.setError(error, 'Something went wrong'))
  }
}
</script>

<style scoped>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
td {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
  text-align: center;

}
th {
  height: 40px;
}

</style>

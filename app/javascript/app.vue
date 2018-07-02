<template>
  <Dashboard id="dashboard" columns="5" rows="3">
      <h1>HHH</h1>

    <test testTitle="Hello I Am Test Title" position="a1:a3"></test>
  </Dashboard>
</template>

<script>
import Dashboard from './components/Dashboard';

export default {
  data: function () {
    return {
      message: "Hello 2 Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

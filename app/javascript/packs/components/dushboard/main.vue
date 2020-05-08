<template lang="pug">
  p {{ data.USD_RUB }} | Rub
</template>

<script>
export default {
  props: { data: { type: Object, required: true } }
};
</script>

<style scoped>
p {
  padding: 150px;
  font-size: 2em;
  text-align: center;
}
</style>

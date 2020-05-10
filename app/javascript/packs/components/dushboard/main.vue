<template lang="pug">
  .page-panel
    .page-panel__spinner(v-if="importInProgress")
      i(:class="`fa fa-spinner fa-spin fa-fw fa-4x`")
    .page-panel__currency(v-else="this.import_object.status === 'finished'")
      p {{ this.import_object.results }} | Rub
</template>

<script>
export default {
  data() {
    return {
      cable: null,
      import_object: {
        status: "not_started"
      }
    };
  },

  created() {
    this.initializeActionCable();
  },

  beforeDestroy() {
    this.cable.unsubscribe();
  },

  computed: {
    importInProgress() {
      return this.import_object.status === "not_started";
    }
  },

  methods: {
    initializeActionCable() {
      this.cable = App.cable.subscriptions.create("SyncChannel", {
        received: ({ data, status }) => {
          this.import_object.status = status;
          this.import_object.results = data.USD_RUB;
        }
      });
    }
  }
};
</script>

<style scoped>
.page-panel {
  padding: 150px;
  text-align: center;
}

p {
  font-size: 2em;
}
</style>

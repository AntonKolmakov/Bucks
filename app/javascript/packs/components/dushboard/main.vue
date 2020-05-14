<template lang="pug">
.page-panel
  .page-panel__spinner(v-if="importInProgress")
    i(:class="`fa fa-spinner fa-spin fa-fw fa-4x`")
  .page-panel__currency(v-else)
    p {{ currency }} | Rub
      button(
        v-if="policy('UserPolicy').index",
        data-target="#exampleModal",
        data-toggle="modal",
        type="button",
        class="btn btn-warning"
        ) {{ 'Force' }}

    rate-popup(
      :rate="currency"
      )
</template>

<script>
export default {
  components: {
    RatePopup: () => import("./popups/rate")
  },

  props: ["data"],

  data() {
    return {
      cable: null,
      currency: null,
      status: "in_progress"
    };
  },

  created() {
    this.initializeActionCable();
    this.currency = this.data || "";
    this.status = this.data.status;
  },

  beforeDestroy() {
    this.cable.unsubscribe();
  },

  computed: {
    importInProgress() {
      return this.status === "in_progress";
    }
  },

  methods: {
    initializeActionCable() {
      this.cable = App.cable.subscriptions.create("SyncChannel", {
        received: ({ data, status }) => {
          this.currency = data;
          this.status = status;
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
button {
  padding: 5px;
  margin: 5px;
}
p {
  font-size: 2em;
}
</style>

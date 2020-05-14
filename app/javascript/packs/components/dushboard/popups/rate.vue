<template lang="pug">
  #exampleModal.modal.fade(aria-hidden="true" aria-labelledby="exampleModalLabel" role="dialog" tabindex="-1" )
    .modal-dialog.modal-sm(role="document")
      .modal-content
        .modal-header
          .alert.alert-warning(v-if="serverError")
            p {{ 'Oops! Something went wrong...' }}
        .modal-body
          .form-group
            label(for="rate") {{'force rate:'}}
            input.form-control(
              v-model="rateForm.rate"
              type="number"
              ref="input"
              name="rate"
              )
          .form-group
            label(for="expired-time") {{'Choose a time:'}}
            input.form-control(
              v-model="rateForm.expired_at",
              name="meeting-time",
              type="datetime-local"
              )

        .modal-footer
          button.btn.btn-secondary(data-dismiss="modal" type="button") {{ 'close' }}
          button.btn.btn-primary(type="button", @click="onSubmit" ) {{"Force"}}
</template>

<script>
import { mapActions } from "vuex";

export default {
  props: {
    rate: { type: Number, required: true }
  },

  data: () => ({
    rateForm: {},
    serverError: false
  }),

  created() {
    this.rateForm = {
      rate: this.rate,
      expired_at: new Date().toISOString().slice(0, 16)
    };
  },

  methods: {
    onSubmit() {
      const params = { exchange_rate: this.rateForm };

      Vue.axios
        .post("api/frontend/exchange_rates", params)
        .then(r => $("#exampleModal").modal("hide"))
        .catch(e => {
          this.serverError = true;
        });
    }
  }
};
</script>

<style scoped>
</style>

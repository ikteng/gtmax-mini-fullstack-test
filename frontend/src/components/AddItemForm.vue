<template>
  <form @submit.prevent="onSubmit" class="add-item-form">
    <input
      v-model="name"
      placeholder="Enter item name"
      :class="{ 'input-error': showError }"
    />
    <button :disabled="loading">Add</button>
    <p v-if="showError" class="error-message">Item name cannot be empty</p>
  </form>
</template>

<script>
export default {
  name: 'AddItemForm',
  props: {
    loading: Boolean
  },
  data() {
    return {
      name: '',
      showError: false
    }
  },

  methods: {
    onSubmit() {
      if (!this.name.trim()) {
        this.showError = true
        return
      }
      this.showError = false
      this.$emit('add-item', this.name)
      this.name = ''
    }
  },

  watch: {
    name() {
      if (this.showError) this.showError = false
    }
  }
}
</script>

<style scoped>

button {
    margin-left: 10px;
    cursor: pointer;
}

.input-error {
    border: 1px solid red;
}

.error-message {
    color: red;
    margin: 5px 0 0 0;
    font-size: 0.9rem;
}
</style>

<template>
  <div class="app">
    <h1>Item Manager</h1>

    <!-- Add Item Form -->
    <AddItemForm @add-item="handleAdd" :loading="loading" />

    <p v-if="loading">Loading...</p>
    <p v-if="error" class="error-message">{{ error }}</p>

    <!-- Table Component -->
    <ItemTable :items="items" :loading="loading" @delete="handleDelete" />
  </div>
</template>

<script>
import { Api } from './api/index.js'
import ItemTable from './components/ItemTable.vue'
import AddItemForm from './components/AddItemForm.vue'

export default {
  components: { ItemTable, AddItemForm },
  data() {
    return {
      items: [],
      loading: false,
      error: ''
    }
  },
  methods: {
    async fetchItems() {
      this.loading = true
      this.error = ''
      try {
        // fetch items from the database
        this.items = await Api.getAllItems()
      } catch (err) {
        this.error = err.message
      } finally {
        this.loading = false
      }
    },

    async handleAdd(name) {
      this.loading = true
      this.error = ''
      try {
        // create a new item
        const item = await Api.createItem(name)
        // fetch again from the server
        await this.fetchItems()
      } catch (err) {
        this.error = err.message
      } finally {
        this.loading = false
      }
    },

    async handleDelete(id) {
      this.loading = true
      this.error = ''
      try {
        await Api.deleteItem(id)
        this.items = this.items.filter(i => i.id !== id)
      } catch (err) {
        this.error = err.message
      } finally {
        this.loading = false
      }
    }
  },
  mounted() {
    this.fetchItems()
  }
}
</script>

<style scoped>
  .app {
    max-width: 500px;
    margin: 0 auto;
    font-family: Arial, sans-serif;
  }

  .error-message {
    color: red;
    margin-top: 5px;
    font-size: 0.9rem;
  }
</style>
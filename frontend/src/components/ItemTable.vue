<template>
  <table class="item-table" v-if="!loading || items.length > 0">
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="item in items" :key="item.id">
        <td>{{ item.id }}</td>
        <td>{{ item.name }}</td>
        <td>
          <button @click="$emit('delete', item.id)">Delete</button>
        </td>
      </tr>

      <!-- Show 'No items' only if not loading -->
      <tr v-if="items.length === 0 && !loading">
        <td colspan="3" style="text-align:center">No items found</td>
      </tr>
      
    </tbody>
  </table>
</template>

<script>
export default {
  name: 'ItemTable',
  props: {
    items: {
      type: Array,
      required: true
    },
    loading: {
      type: Boolean,
      default: false
    }
  }
}
</script>

<style scoped>
  .item-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  .item-table th,
  .item-table td {
    border: 1px solid #ddd;
    padding: 8px;
  }

  .item-table th {
    background-color: #f4f4f4;
    text-align: left;
  }

  button {
    padding: 5px 10px;
    cursor: pointer;
  }
</style>
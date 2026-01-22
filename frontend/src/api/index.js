import axios from 'axios'

// Base URL for the Laravel API
const API_BASE = 'http://127.0.0.1:8000/api/items'

export const Api = {
  // Get all items
  getAllItems: async function () {
    try {
      const res = await axios.get(API_BASE)
      return res.data
    } catch (err) {
      throw new Error('Failed to load items')
    }
  },

  // Create a new item
  createItem: async function (name) {
    try {
      const res = await axios.post(API_BASE, { name })
      return res.data
    } catch (err) {
      throw new Error('Failed to add item')
    }
  },

  // Delete an item
  deleteItem: async function (id) {
    try {
      await axios.delete(`${API_BASE}/${id}`)
    } catch (err) {
      throw new Error('Failed to delete item')
    }
  }
}

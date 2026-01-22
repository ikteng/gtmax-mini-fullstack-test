# GTMax – Mini Fullstack Coding Test

Build a small fullstack web app that allows users to manage a list of items (e.g. tasks, products, notes, etc)

## How to run the project
1. Make sure that run.sh is executable: chmod +x run.sh
2. Run both backend and frontend: ./run.sh (Git Bash on Windows)

## Folder Structure
```
gtmax-mini-fullstack-test/
├─ backend/ # Laravel project
│ ├─ app/Models/Item.php
│ ├─ app/Http/Controllers/ItemController.php
│ └─ routes/api.php
├─ frontend/ # Vue.js project
│ ├─ api/Api.js # Axios API wrapper
│ ├─ components/ItemTable.vue # Table with all of the items
│ └─ App.vue # Main page
└─ run.sh # Script to start both frontend and backend
```

- Backend: http://127.0.0.1:8000
- Frontend: http://localhost:5173 (Vite default)

## Design Decisions
- Separation of concerns:
    - Api.js handles all API calls (GET, POST, DELETE)
    - Components handle display of the table, while
    - App.vue handles state and events

- Validation & error handling:
    - Input field cannot be empty, shows red border and error message
    - API errors are displayed to the user

- Loading state:
    - "Loading..." message is displayed

# What I would improve with more time
 - add column sorting in the table by clicking headers
 - add more database checks like if there is already item with the same name
 - add spinner animation for loading state
 - add unit tests for both frontend and backend
 - add confirmation modal for deleteing items
 - add edit button that allow user to edit the name of the item

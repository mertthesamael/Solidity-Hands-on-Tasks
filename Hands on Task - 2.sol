pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT



contract TodoList {
    // Setting default todo state. Text is simply todo task, and bool is state of tasks.
    struct Todo {
        string text;
        bool completed;

    }

    Todo[] public todos;

    // Creating an array for tasks and add task in to array.
    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    // Function for change the task content.
    function updateText(uint256 _index, string calldata _text) external {
        todos[_index].text = _text;

        Todo storage todo = todos[_index];
        todo.text=_text;
    }

    // Function for reviewing the task by index number.
    function get(uint256 _index) external view returns(string memory, bool){
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);

    }

    // Function for mark the tasks as completed.
    function toggleCompleted(uint256 _index) external {
        todos[_index].completed = !todos[_index].completed;
    }


}
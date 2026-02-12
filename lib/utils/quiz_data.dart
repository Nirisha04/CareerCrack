final Map<String, List<Map<String, dynamic>>> quizData = {
  'C': [
    {
      'question': 'What is the size of int in C?',
      'options': ['2 bytes', '4 bytes', 'Depends on compiler', '8 bytes'],
      'answer': 'Depends on compiler',
      'difficulty': 'easy',
    },
    {
      'question': 'How do you declare a pointer in C?',
      'options': ['int p;', 'int *p;', 'int &p;', 'pointer p;'],
      'answer': 'int *p;',
      'difficulty': 'easy',
    },
    {
      'question': 'Spot the Error: What is wrong with this print statement?',
      'codeSnippet': 'int x = 10;\nprintf("Value is %d", &x);',
      'language': 'C',
      'options': [
        'Format specifier %d is wrong',
        'Passing address &x instead of value x',
        'Missing semicolon',
        'printf is not a C function',
      ],
      'answer': 'Passing address &x instead of value x',
      'difficulty': 'medium',
      'explanation':
          'printf() expects the value of the variable, not its address (unless using %p for pointers).',
    },
    {
      'question':
          'Complete the Code: How do you include the standard input output library?',
      'codeSnippet': '____ <stdio.h>',
      'language': 'C',
      'options': ['include', '#import', '#include', 'using'],
      'answer': '#include',
      'difficulty': 'easy',
      'explanation':
          'C uses the #include preprocessor directive to include header files.',
    },
    {
      'question': 'Spot the Error: Improper variable declaration.',
      'codeSnippet': 'int 1num = 10;',
      'language': 'C',
      'options': [
        'Variable name cannot start with a number',
        'Missing semicolon',
        'int is a keyword',
        'Syntax is correct',
      ],
      'answer': 'Variable name cannot start with a number',
      'difficulty': 'easy',
      'explanation': 'In C, identifiers cannot start with digits.',
    },
    {
      'question': 'Fill the Code: Read an integer using scanf.',
      'codeSnippet': 'int x;\nscanf("%d", ____);',
      'language': 'C',
      'options': ['x', '&x', '*x', '&&x'],
      'answer': '&x',
      'difficulty': 'easy',
      'explanation':
          'scanf() requires the address of the variable to store the value.',
    },
    {
      'question': 'Complete the Code: Standard return for main.',
      'codeSnippet': 'int main() {\n    return ____;\n}',
      'language': 'C',
      'options': ['0', '1', 'exit', 'void'],
      'answer': '0',
      'difficulty': 'easy',
      'explanation':
          'Returning 0 from main conventionally indicates successful execution.',
    },
    {
      'question': 'Spot the Error: String initialization.',
      'codeSnippet': 'char name = "Alice";',
      'language': 'C',
      'options': [
        'char should be char*',
        'Use single quotes for char',
        'Missing array brackets',
        'A or C',
      ],
      'answer': 'A or C',
      'difficulty': 'easy',
      'explanation': 'A string in C is a pointer to char or an array of char.',
    },
    {
      'question': 'Fill the Code: Use the correct logical operator for AND.',
      'codeSnippet': 'if (x > 0 ____ x < 10) { }',
      'language': 'C',
      'options': ['&', '&&', 'and', '|'],
      'answer': '&&',
      'difficulty': 'easy',
      'explanation': '&& is the logical AND operator in C.',
    },
    {
      'question': 'Complete the Code: Define a preprocessor constant.',
      'codeSnippet': '____ PI 3.14',
      'language': 'C',
      'options': ['#const', '#define', '#value', 'const'],
      'answer': '#define',
      'difficulty': 'easy',
      'explanation': '#define is used for macro definitions.',
    },
    {
      'question': 'Spot the Error: Increment operator.',
      'codeSnippet': 'int x = 5;\nx+++;',
      'language': 'C',
      'options': [
        'Too many +',
        'L-value required',
        'Syntax Error',
        'Works fine',
      ],
      'answer': 'Syntax Error',
      'difficulty': 'easy',
      'explanation':
          'The increment operator is ++, and +++ is not a single valid operator.',
    },
    {
      'question': 'Fill the Code: Infinite loop.',
      'codeSnippet': 'for (____) { }',
      'language': 'C',
      'options': [';;', '1', 'true', 'infinite'],
      'answer': ';;',
      'difficulty': 'easy',
      'explanation': 'for(;;) is a standard C idiom for an infinite loop.',
    },
    {
      'question': 'Complete the Code: Size of data type.',
      'codeSnippet': 'int s = ____(int);',
      'language': 'C',
      'options': ['len', 'size', 'sizeof', 'bytes'],
      'answer': 'sizeof',
      'difficulty': 'easy',
      'explanation':
          'sizeof is a compile-time operator that returns size in bytes.',
    },
    // C Medium
    {
      'question': 'Spot the Error: Pointer arithmetic.',
      'codeSnippet': 'int arr[5];\nint *p = &arr[0];\np = p * 2;',
      'language': 'C',
      'options': [
        'Works fine',
        'Cannot multiply pointers',
        'Syntax Error',
        'p is not an int',
      ],
      'answer': 'Cannot multiply pointers',
      'difficulty': 'medium',
      'explanation':
          'You can add/subtract integers to pointers, but multiplication is illegal.',
    },
    {
      'question': 'Fill the Code: Allocate memory for 5 integers.',
      'codeSnippet': 'int *p = (int*)____(5 * sizeof(int));',
      'language': 'C',
      'options': ['alloc', 'malloc', 'new', 'mcreate'],
      'answer': 'malloc',
      'difficulty': 'medium',
      'explanation': 'malloc allocates a block of memory on the heap.',
    },
    {
      'question': 'Complete the Code: Access structure member using pointer.',
      'codeSnippet':
          'struct Point { int x; };\nstruct Point *p;\nint val = p____x;',
      'language': 'C',
      'options': ['.', '->', '=>', '::'],
      'answer': '->',
      'difficulty': 'medium',
      'explanation':
          'The arrow operator -> is used to access structure members via a pointer.',
    },
    {
      'question': 'Spot the Error: Comparison vs Assignment.',
      'codeSnippet': 'if (x = 0) { printf("Zero"); }',
      'language': 'C',
      'options': [
        'Syntax Error',
        'Logic Error: always evaluates to false',
        'Works fine',
        'Logic Error: always evaluates to true',
      ],
      'answer': 'Logic Error: always evaluates to false',
      'difficulty': 'medium',
      'explanation':
          'x=0 assigns 0 to x, and since 0 is false in C, the block never executes.',
    },
    {
      'question': 'Fill the Code: String copy.',
      'codeSnippet': 'char src[] = "hi";\nchar dest[3];\n____(dest, src);',
      'language': 'C',
      'options': ['copy', 'strcpy', 'str_copy', 'memcpy'],
      'answer': 'strcpy',
      'difficulty': 'medium',
      'explanation': 'strcpy(dest, src) is the standard string copy function.',
    },
    {
      'question': 'Complete the Code: Switch fallthrough.',
      'codeSnippet':
          'switch(x) {\n    case 1: doA(); ____;\n    case 2: doB();\n}',
      'language': 'C',
      'options': ['stop', 'exit', 'break', 'return'],
      'answer': 'break',
      'difficulty': 'medium',
      'explanation':
          'break prevents execution from falling through to the next case.',
    },
    {
      'question': 'Spot the Error: Dangling pointer.',
      'codeSnippet': 'int* get() {\n    int x = 10;\n    return &x;\n}',
      'language': 'C',
      'options': [
        'Returning address of local variable',
        'Memory leak',
        'Syntax Error',
        'Works fine',
      ],
      'answer': 'Returning address of local variable',
      'difficulty': 'medium',
      'explanation':
          'Local variables are destroyed when the function returns, making the pointer invalid.',
    },
    {
      'question': 'Fill the Code: Bitwise OR.',
      'codeSnippet': 'int result = a ____ b;',
      'language': 'C',
      'options': ['||', '|', 'or', '++'],
      'answer': '|',
      'difficulty': 'medium',
      'explanation': 'The single pipe | is the bitwise OR operator.',
    },
    {
      'question': 'Complete the Code: Null pointer definition.',
      'codeSnippet': 'int *p = ____;',
      'language': 'C',
      'options': ['0', 'NULL', 'nullptr', 'A or B'],
      'answer': 'A or B',
      'difficulty': 'medium',
      'explanation': 'NULL is typically defined as 0 in C.',
    },
    {
      'question': 'Spot the Error: Buffer overflow.',
      'codeSnippet': 'char b[2];\nstrcpy(b, "Hello");',
      'language': 'C',
      'options': [
        'Works fine',
        'Memory corruption',
        'Syntax Error',
        'Buffer overflow',
      ],
      'answer': 'Buffer overflow',
      'difficulty': 'medium',
      'explanation':
          'The string "Hello" (plus null terminator) is larger than the buffer b.',
    },
    // C Hard
    {
      'question': 'Spot the Error: Constant pointer vs Pointer to constant.',
      'codeSnippet': 'const int *p = &x;\n*p = 20;',
      'language': 'C',
      'options': [
        'Cannot modify p',
        'Cannot modify the value at p',
        'Syntax Error',
        'Logic Error',
      ],
      'answer': 'Cannot modify the value at p',
      'difficulty': 'hard',
      'explanation':
          'const int *p means the integer being pointed to is constant.',
    },
    {
      'question': 'Fill the Code: Free heap memory.',
      'codeSnippet': 'int *p = malloc(4);\n____(p);',
      'language': 'C',
      'options': ['delete', 'remove', 'free', 'release'],
      'answer': 'free',
      'difficulty': 'hard',
      'explanation':
          'free() is used to deallocate memory allocated by malloc/calloc.',
    },
    {
      'question': 'Complete the Code: Open file for binary reading.',
      'codeSnippet': 'FILE *f = fopen("data.bin", "____");',
      'language': 'C',
      'options': ['r', 'rb', 'read', 'binary'],
      'answer': 'rb',
      'difficulty': 'hard',
      'explanation': '"rb" opens a file for reading in binary mode.',
    },
    {
      'question': 'Spot the Error: Function pointer syntax.',
      'codeSnippet': 'int (*f)(int) = &my_func;\nint res = f(10);',
      'language': 'C',
      'options': ['Syntax Error', 'Works fine', 'Missing * in call', 'A and C'],
      'answer': 'Works fine',
      'difficulty': 'hard',
      'explanation':
          'This is the correct syntax for declaring and calling a function pointer.',
    },
    {
      'question': 'Fill the Code: Typedef for a struct.',
      'codeSnippet': '____ struct { int x; } Point;',
      'language': 'C',
      'options': ['type', 'alias', 'typedef', 'name'],
      'answer': 'typedef',
      'difficulty': 'hard',
      'explanation': 'typedef creates a new type alias for an existing type.',
    },
    {
      'question': 'Complete the Code: Access union member.',
      'codeSnippet':
          'union Data { int i; float f; } d;\nd.i = 10; // What happens to d.f?',
      'language': 'C',
      'options': ['Remains same', 'Overwritten', 'Random value', 'B and C'],
      'answer': 'B and C',
      'difficulty': 'hard',
      'explanation':
          'Union members share the same memory location, so writing to one affects the others.',
    },
    {
      'question': 'Spot the Error: Memory leak.',
      'codeSnippet': 'while(1) { malloc(100); }',
      'language': 'C',
      'options': [
        'Out of memory eventually',
        'Works fine',
        'Syntax Error',
        'Logic Error',
      ],
      'answer': 'Out of memory eventually',
      'difficulty': 'hard',
      'explanation':
          'Allocating memory without freeing it in a loop leads to a memory leak.',
    },
    {
      'question': 'Fill the Code: External variable declaration.',
      'codeSnippet': '____ int global_count;',
      'language': 'C',
      'options': ['static', 'extern', 'global', 'public'],
      'answer': 'extern',
      'difficulty': 'hard',
      'explanation':
          'extern declares a variable that is defined in another file.',
    },
    {
      'question': 'Complete the Code: Volatile keyword.',
      'codeSnippet': '____ int status; // Prevents compiler optimization',
      'language': 'C',
      'options': ['static', 'const', 'volatile', 'atomic'],
      'answer': 'volatile',
      'difficulty': 'hard',
      'explanation':
          'volatile tells the compiler that the value can change unexpectedly (e.g., from hardware).',
    },
    {
      'question': 'Spot the Error: Array index out of bounds.',
      'codeSnippet': 'int a[2]; a[2] = 5;',
      'language': 'C',
      'options': [
        'Works fine',
        'Compiler error',
        'Undefined behavior',
        'Syntax Error',
      ],
      'answer': 'Undefined behavior',
      'difficulty': 'hard',
      'explanation':
          'C does not check array bounds; accessing index 2 (out of 0, 1) is undefined.',
    },
    {
      'question': 'Which function is used to allocate memory dynamically in C?',
      'options': ['malloc()', 'alloc()', 'new', 'mcreate()'],
      'answer': 'malloc()',
      'difficulty': 'medium',
    },
    {
      'question': 'What is the format specifier for a double in printf?',
      'options': ['%d', '%f', '%lf', '%s'],
      'answer': '%lf',
      'difficulty': 'medium',
    },
    {
      'question': 'What does the "volatile" keyword do in C?',
      'options': [
        'Optimizes the variable',
        'Prevents compiler optimization',
        'Makes it constant',
        'Allocates in heap',
      ],
      'answer': 'Prevents compiler optimization',
      'difficulty': 'hard',
    },
    {
      'question': 'Which of the following is not a storage class in C?',
      'options': ['auto', 'static', 'extern', 'volatile'],
      'answer': 'volatile',
      'difficulty': 'hard',
    },
    {
      'question': 'What is the result of sizeof(char)?',
      'options': ['1', '2', '4', 'Depends'],
      'answer': '1',
      'difficulty': 'easy',
    },
    {
      'question': 'Which operator is used to get the address of a variable?',
      'options': ['*', '&', '#', '@'],
      'answer': '&',
      'difficulty': 'easy',
    },
    {
      'question': 'Function to find length of string in C?',
      'options': ['len()', 'strlen()', 'strsize()', 'length()'],
      'answer': 'strlen()',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a segmentation fault?',
      'options': [
        'Syntax error',
        'Memory access violation',
        'Division by zero',
        'Infinite loop',
      ],
      'answer': 'Memory access violation',
      'difficulty': 'hard',
    },
    {
      'question': 'Which header file is required for malloc()?',
      'options': ['stdio.h', 'stdlib.h', 'string.h', 'math.h'],
      'answer': 'stdlib.h',
      'difficulty': 'easy',
    },
    {
      'question': 'What is the purpose of the register keyword?',
      'options': [
        'Stores in RAM',
        'Suggests storing in CPU register',
        'Makes it constant',
        'Used for recursion',
      ],
      'answer': 'Suggests storing in CPU register',
      'difficulty': 'medium',
    },
    {
      'question': 'How do you define a constant in C?',
      'options': ['#define', 'const', 'Both', 'None'],
      'answer': 'Both',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a dangling pointer?',
      'options': [
        'Pointer to NULL',
        'Pointer to freed memory',
        'Uninitialized pointer',
        'Pointer to a pointer',
      ],
      'answer': 'Pointer to freed memory',
      'difficulty': 'hard',
    },
    {
      'question': 'What is the size of a pointer in a 64-bit system?',
      'options': ['4 bytes', '8 bytes', '16 bytes', 'Depends on type'],
      'answer': '8 bytes',
      'difficulty': 'medium',
    },
    {
      'question': 'Which operator is used for structure member access?',
      'options': ['.', '->', 'Both', '&'],
      'answer': 'Both',
      'difficulty': 'medium',
    },
    {
      'question': 'What does the continue statement do?',
      'options': [
        'Exits the loop',
        'Skips current iteration',
        'Resets the loop',
        'Ends the program',
      ],
      'answer': 'Skips current iteration',
      'difficulty': 'easy',
    },
    {
      'question': 'What is the entry point of a C program?',
      'options': ['start()', 'init()', 'main()', 'run()'],
      'answer': 'main()',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a macro in C?',
      'options': [
        'A function',
        'A preprocessor directive',
        'A variable',
        'A data type',
      ],
      'answer': 'A preprocessor directive',
      'difficulty': 'medium',
    },
    {
      'question': 'What is memory leak?',
      'options': [
        'Hardware failure',
        'Unallocated memory',
        'Memory not freed after use',
        'Buffer overflow',
      ],
      'answer': 'Memory not freed after use',
      'difficulty': 'hard',
    },
  ],
  'C++': [
    {
      'question':
          'Which feature of OOP is demonstrated by function overloading?',
      'options': [
        'Inheritance',
        'Polymorphism',
        'Encapsulation',
        'Abstraction',
      ],
      'answer': 'Polymorphism',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a constructor?',
      'options': [
        'A function to destroy objects',
        'A function to initialize objects',
        'A static method',
        'A global variable',
      ],
      'answer': 'A function to initialize objects',
      'difficulty': 'easy',
    },
    {
      'question': 'What does the "virtual" keyword do in C++?',
      'options': [
        'Makes a variable invisible',
        'Enables late binding',
        'Speeds up execution',
        'Prevents inheritance',
      ],
      'answer': 'Enables late binding',
      'difficulty': 'hard',
    },
    {
      'question': 'Which operator cannot be overloaded?',
      'options': ['+', '==', '::', '<<'],
      'answer': '::',
      'difficulty': 'hard',
    },
    {
      'question': 'Spot the Error: What is wrong with this C++ code?',
      'codeSnippet': 'int* ptr = new int(10);\ndelete ptr;\nptr = 20;',
      'language': 'C++',
      'options': [
        'Missing semicolon',
        'Cannot assign int to int*',
        'delete ptr is wrong',
        'new int(10) is wrong',
      ],
      'answer': 'Cannot assign int to int*',
      'difficulty': 'medium',
      'explanation':
          'ptr is a pointer to an integer (int*), so you cannot assign a raw integer value like 20 to it; it must be an address.',
    },
    {
      'question': 'Complete the Code: Use the correct stream to output text.',
      'codeSnippet':
          '#include <iostream>\nusing namespace std;\nint main() {\n    ____ << "Hello World";\n    return 0;\n}',
      'language': 'C++',
      'options': ['print', 'cout', 'out', 'write'],
      'answer': 'cout',
      'difficulty': 'easy',
      'explanation': 'std::cout is the standard output stream in C++.',
    },
    {
      'question': 'Spot the Error: Improper namespace usage.',
      'codeSnippet': 'cout << "Hi";',
      'language': 'C++',
      'options': [
        'std:: is missing',
        'using namespace std; is missing',
        'cout is not defined',
        'A or B',
      ],
      'answer': 'A or B',
      'difficulty': 'easy',
      'explanation': 'cout is part of the std namespace.',
    },
    {
      'question': 'Fill the Code: Basic inheritance syntax.',
      'codeSnippet': 'class Car ____ public Vehicle { };',
      'language': 'C++',
      'options': [':', '::', 'extends', 'inherits'],
      'answer': ':',
      'difficulty': 'easy',
      'explanation': 'C++ uses a single colon for inheritance.',
    },
    {
      'question': 'Complete the Code: Input a value.',
      'codeSnippet': 'int x;\nstd::____ >> x;',
      'language': 'C++',
      'options': ['in', 'cin', 'input', 'read'],
      'answer': 'cin',
      'difficulty': 'easy',
      'explanation': 'std::cin is the standard input stream.',
    },
    {
      'question': 'Spot the Error: Accessing private member.',
      'codeSnippet': 'class A { int x; };\nA obj;\nobj.x = 10;',
      'language': 'C++',
      'options': [
        'x is private by default',
        'Missing public keyword',
        'Syntax Error',
        'A or B',
      ],
      'answer': 'A or B',
      'difficulty': 'easy',
      'explanation': 'In C++ classes, members are private by default.',
    },
    {
      'question': 'Fill the Code: Scope resolution operator.',
      'codeSnippet': 'void MyClass____myFunc() { }',
      'language': 'C++',
      'options': ['.', '->', '::', ':'],
      'answer': '::',
      'difficulty': 'easy',
      'explanation': ':: is the scope resolution operator.',
    },
    {
      'question': 'Complete the Code: Standard string inclusion.',
      'codeSnippet': '#include <____>',
      'language': 'C++',
      'options': ['string', 'string.h', 'strings', 'cstring'],
      'answer': 'string',
      'difficulty': 'easy',
      'explanation': '<string> is the header for the C++ string class.',
    },
    {
      'question': 'Spot the Error: Incorrect bool value.',
      'codeSnippet': 'bool is_ready = TRUE;',
      'language': 'C++',
      'options': [
        'TRUE should be true',
        'C++ has no bool',
        'Missing semicolon',
        'Logic Error',
      ],
      'answer': 'TRUE should be true',
      'difficulty': 'easy',
      'explanation': 'C++ keywords are lowercase (true, false).',
    },
    {
      'question': 'Fill the Code: For-each loop (C++11).',
      'codeSnippet': 'vector<int> v = {1, 2};\nfor (int n ____ v) { }',
      'language': 'C++',
      'options': [':', 'in', 'of', '->'],
      'answer': ':',
      'difficulty': 'easy',
      'explanation': 'A range-based for loop uses a colon.',
    },
    {
      'question': 'Complete the Code: End line and flush.',
      'codeSnippet': 'cout << "hi" << std::____;',
      'language': 'C++',
      'options': ['nl', 'end', 'endl', 'br'],
      'answer': 'endl',
      'difficulty': 'easy',
      'explanation': 'std::endl inserts a newline and flushes the stream.',
    },
    // C++ Medium
    {
      'question': 'Spot the Error: Multiple inheritance ambiguity.',
      'codeSnippet':
          'class A { void f(); };\nclass B { void f(); };\nclass C : public A, public B { };\nC obj; obj.f();',
      'language': 'C++',
      'options': [
        'Logic Error',
        'Diamond problem',
        'Ambiguous call to f()',
        'Syntax Error',
      ],
      'answer': 'Ambiguous call to f()',
      'difficulty': 'medium',
      'explanation':
          'The compiler doesn\'t know whether to call A::f() or B::f().',
    },
    {
      'question': 'Fill the Code: Declare a virtual function.',
      'codeSnippet': 'class A {\n    ____ void show() { }\n};',
      'language': 'C++',
      'options': ['abstract', 'virtual', 'override', 'dynamic'],
      'answer': 'virtual',
      'difficulty': 'medium',
      'explanation':
          'virtual allows a function to be overridden in derived classes.',
    },
    {
      'question': 'Complete the Code: STL Vector push.',
      'codeSnippet': 'vector<int> v;\nv.____(10);',
      'language': 'C++',
      'options': ['add', 'append', 'push_back', 'insert'],
      'answer': 'push_back',
      'difficulty': 'medium',
      'explanation': 'push_back() adds an element to the end of a vector.',
    },
    {
      'question': 'Spot the Error: Reference initialization.',
      'codeSnippet': 'int &ref;',
      'language': 'C++',
      'options': [
        'Syntax Error',
        'References must be initialized',
        'Logic Error',
        'Missing type',
      ],
      'answer': 'References must be initialized',
      'difficulty': 'medium',
      'explanation':
          'A reference cannot be null and must point to a valid object upon declaration.',
    },
    {
      'question': 'Fill the Code: This pointer access.',
      'codeSnippet': 'void setX(int x) {\n    ____->x = x;\n}',
      'language': 'C++',
      'options': ['this', 'self', 'me', 'ptr'],
      'answer': 'this',
      'difficulty': 'medium',
      'explanation': 'this is a pointer to the current object.',
    },
    {
      'question': 'Complete the Code: Template function.',
      'codeSnippet': '____ <typename T>\nT sum(T a, T b) { return a + b; }',
      'language': 'C++',
      'options': ['generic', 'template', 'type', 'macro'],
      'answer': 'template',
      'difficulty': 'medium',
      'explanation':
          'Templates allow functions/classes to work with generic types.',
    },
    {
      'question': 'Spot the Error: Using auto without initialization.',
      'codeSnippet': 'auto x;',
      'language': 'C++',
      'options': [
        'Missing type',
        'auto must infer type from initializer',
        'Syntax Error',
        'Works fine',
      ],
      'answer': 'auto must infer type from initializer',
      'difficulty': 'medium',
      'explanation':
          'The compiler needs the initializer to determine the type for auto.',
    },
    {
      'question': 'Fill the Code: Dynamic cast.',
      'codeSnippet': 'B* b = ____<B*>(aPtr);',
      'language': 'C++',
      'options': ['cast', 'convert', 'dynamic_cast', 'reinterpret_cast'],
      'answer': 'dynamic_cast',
      'difficulty': 'medium',
      'explanation':
          'dynamic_cast safely converts pointers/references within an inheritance hierarchy.',
    },
    {
      'question': 'Complete the Code: Const member function.',
      'codeSnippet': 'void show() ____ {\n    // cannot modify members\n}',
      'language': 'C++',
      'options': ['final', 'const', 'static', 'readonly'],
      'answer': 'const',
      'difficulty': 'medium',
      'explanation':
          'Marking a member function const ensures it doesn\'t modify the object.',
    },
    {
      'question': 'Spot the Error: Vector iterator.',
      'codeSnippet': 'vector<int> v; \nfor(int it = v.begin(); ...)',
      'language': 'C++',
      'options': [
        'it must be vector<int>::iterator',
        'v.begin() returns int',
        'Syntax Error',
        'A or C',
      ],
      'answer': 'A or C',
      'difficulty': 'medium',
      'explanation': 'begin() returns an iterator object, not an integer.',
    },
    // C++ Hard
    {
      'question': 'Spot the Error: Why use a virtual destructor?',
      'codeSnippet':
          'class Base { ~Base(); };\nclass Derived : public Base { };',
      'language': 'C++',
      'options': [
        'Memory leak on deleting Base*',
        'Syntax Error',
        'Required for inheritance',
        'Logic Error',
      ],
      'answer': 'Memory leak on deleting Base*',
      'difficulty': 'hard',
      'explanation':
          'Deleting a derived object via a Base pointer without a virtual destructor results in undefined behavior (usually leak).',
    },
    {
      'question': 'Fill the Code: Smart pointer initialization.',
      'codeSnippet': 'std::____<int> p = std::make_unique<int>(10);',
      'language': 'C++',
      'options': ['unique_ptr', 'shared_ptr', 'auto_ptr', 'smart_ptr'],
      'answer': 'unique_ptr',
      'difficulty': 'hard',
      'explanation':
          'unique_ptr is the modern C++ way to handle exclusive ownership.',
    },
    {
      'question': 'Complete the Code: Lambda capture all by value.',
      'codeSnippet': 'auto f = [____]() { return x + y; };',
      'language': 'C++',
      'options': ['=', '&', 'val', 'this'],
      'answer': '=',
      'difficulty': 'hard',
      'explanation':
          '[=] captures all local variables used in the lambda by value.',
    },
    {
      'question': 'Spot the Error: L-value vs R-value reference.',
      'codeSnippet': 'int &&a = 10;\nint &&b = a;',
      'language': 'C++',
      'options': [
        'Works fine',
        'Cannot bind R-value reference to L-value "a"',
        'Syntax Error',
        'Logic Error',
      ],
      'answer': 'Cannot bind R-value reference to L-value "a"',
      'difficulty': 'hard',
      'explanation':
          'Even though "a" has an R-value reference type, it is an L-value itself. Use std::move(a).',
    },
    {
      'question': 'Fill the Code: Move constructor signature.',
      'codeSnippet': 'MyClass(MyClass____ other) { }',
      'language': 'C++',
      'options': ['&', '&&', '*', 'move'],
      'answer': '&&',
      'difficulty': 'hard',
      'explanation': 'The move constructor takes an R-value reference (&&).',
    },
    {
      'question': 'Complete the Code: Static assert.',
      'codeSnippet': '____(sizeof(int) == 4, "msg");',
      'language': 'C++',
      'options': ['assert', 'test', 'static_assert', 'check'],
      'answer': 'static_assert',
      'difficulty': 'hard',
      'explanation': 'static_assert performs a compile-time check.',
    },
    {
      'question': 'Spot the Error: Using non-POD in a union.',
      'codeSnippet': 'union U { std::string s; };',
      'language': 'C++',
      'options': [
        'Works fine in C++11+',
        'Wait, string has a constructor',
        'Illegal in old C++',
        'A and C',
      ],
      'answer': 'A and C',
      'difficulty': 'hard',
      'explanation':
          'Old C++ restricted unions to POD types. C++11 allows non-POD but requires manual management of lifetime.',
    },
    {
      'question': 'Fill the Code: Use "friend" function.',
      'codeSnippet': 'class A {\n    ____ void show(A&);\n};',
      'language': 'C++',
      'options': ['public', 'private', 'friend', 'helper'],
      'answer': 'friend',
      'difficulty': 'hard',
      'explanation':
          'A friend function can access private and protected members of the class.',
    },
    {
      'question': 'Complete the Code: Pure virtual function.',
      'codeSnippet': 'virtual void draw() = ____;',
      'language': 'C++',
      'options': ['0', 'NULL', 'abstract', 'pure'],
      'answer': '0',
      'difficulty': 'hard',
      'explanation':
          '= 0 defines the function as pure virtual, making the class abstract.',
    },
    {
      'question': 'Spot the Error: Inline function definition.',
      'codeSnippet': 'inline void f(); // defined in .cpp',
      'language': 'C++',
      'options': [
        'Must be defined in header',
        'Works fine',
        'Linking error',
        'A and C',
      ],
      'answer': 'A and C',
      'difficulty': 'hard',
      'explanation':
          'Inline functions must be visible to every translation unit that uses them, typically by defining them in a header.',
    },
    {
      'question': 'What is the purpose of "this" pointer?',
      'options': [
        'Points to base class',
        'Points to current object',
        'Points to static member',
        'Points to global scope',
      ],
      'answer': 'Points to current object',
      'difficulty': 'medium',
    },
    {
      'question': 'What is an abstract class?',
      'options': [
        'A class with no methods',
        'A class with at least one pure virtual function',
        'A class that cannot be inherited',
        'A class with only static members',
      ],
      'answer': 'A class with at least one pure virtual function',
      'difficulty': 'medium',
    },
    {
      'question': 'Difference between struct and class in C++?',
      'options': [
        'No difference',
        'Default access modifier',
        'Performance',
        'Memory usage',
      ],
      'answer': 'Default access modifier',
      'difficulty': 'medium',
    },
    {
      'question': 'STL stands for?',
      'options': [
        'Standard Template Library',
        'Simple Template List',
        'Static Type Link',
        'Standard Tool Library',
      ],
      'answer': 'Standard Template Library',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a friend function?',
      'options': [
        'A function in the same file',
        'A function with access to private members',
        'A recursive function',
        'A main function',
      ],
      'answer': 'A function with access to private members',
      'difficulty': 'hard',
    },
    {
      'question': 'What is the default return type of main() in C++?',
      'options': ['void', 'int', 'char', 'float'],
      'answer': 'int',
      'difficulty': 'easy',
    },
    {
      'question': 'What is name mangling in C++?',
      'options': [
        'Encoding names for overloading',
        'Randomizing variable names',
        'Deleting unused names',
        'Joining strings',
      ],
      'answer': 'Encoding names for overloading',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a destructor?',
      'options': [
        'Creates objects',
        'Cleans up resources',
        'A static method',
        'A global variable',
      ],
      'answer': 'Cleans up resources',
      'difficulty': 'easy',
    },
    {
      'question': 'What is the difference between delete and delete[]?',
      'options': [
        'No difference',
        'delete is for arrays',
        'delete[] is for arrays',
        'delete is faster',
      ],
      'answer': 'delete[] is for arrays',
      'difficulty': 'medium',
    },
    {
      'question': 'What are templates in C++?',
      'options': [
        'Predefined UIs',
        'Framework for generic programming',
        'Database schemas',
        'Coding standards',
      ],
      'answer': 'Framework for generic programming',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain the diamond problem in C++.',
      'options': [
        'Memory fragmentation',
        'Multiple inheritance ambiguity',
        'Pointer errors',
        'Recursive calls',
      ],
      'answer': 'Multiple inheritance ambiguity',
      'difficulty': 'hard',
    },
    {
      'question': 'What is RAII?',
      'options': [
        'Resource Acquisition Is Initialization',
        'Random Access Internal Interface',
        'Render All Integrated Images',
        'Runtime Access Information Index',
      ],
      'answer': 'Resource Acquisition Is Initialization',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a lambda expression?',
      'options': [
        'A math symbol',
        'An anonymous function',
        'A type of class',
        'A loop style',
      ],
      'answer': 'An anonymous function',
      'difficulty': 'medium',
    },
    {
      'question': 'What is std::move used for?',
      'options': [
        'Copying data',
        'Enabling move semantics',
        'Deleting pointers',
        'Changing file paths',
      ],
      'answer': 'Enabling move semantics',
      'difficulty': 'hard',
    },
    {
      'question': 'What does the const keyword after a function name mean?',
      'options': [
        'Function is fast',
        'Function does not modify object state',
        'Function returns a constant',
        'Function is static',
      ],
      'answer': 'Function does not modify object state',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a smart pointer?',
      'options': [
        'A pointer that thinks',
        'Wrapper for raw pointers to automate memory management',
        'A fast pointer',
        'A pointer to an object',
      ],
      'answer': 'Wrapper for raw pointers to automate memory management',
      'difficulty': 'medium',
    },
  ],
  'Java': [
    {
      'question': 'What is the size of boolean in Java?',
      'options': ['1 bit', '1 byte', 'Depends on JVM', '4 bytes'],
      'answer': 'Depends on JVM',
      'difficulty': 'hard',
    },
    {
      'question': 'Which keyword is used to inherit a class in Java?',
      'options': ['implements', 'extends', 'inherits', 'includes'],
      'answer': 'extends',
      'difficulty': 'easy',
    },
    {
      'question': 'Spot the Error: Why will this code fail to compile?',
      'codeSnippet':
          'public class Main {\n    public static void main(String args) {\n        System.out.println("Hello");\n    }\n}',
      'language': 'Java',
      'options': [
        'Main method must return int',
        'Main method parameter must be String[]',
        'System.out.println is misspelled',
        'ClassName must be lowercase',
      ],
      'answer': 'Main method parameter must be String[]',
      'difficulty': 'medium',
      'explanation':
          'The standard main method signature is public static void main(String[] args).',
    },
    {
      'question':
          'Fill the Code: Use the correct keyword to implement an interface.',
      'codeSnippet': 'class MyClass ____ MyInterface {\n    // methods\n}',
      'language': 'Java',
      'options': ['extends', 'implements', 'inherits', 'uses'],
      'answer': 'implements',
      'difficulty': 'easy',
      'explanation':
          'In Java, a class uses the "implements" keyword to inherit from an interface.',
    },
    {
      'question': 'Spot the Error: String comparison.',
      'codeSnippet':
          'String s1 = new String("hi");\nString s2 = new String("hi");\nif (s1 == s2) { }',
      'language': 'Java',
      'options': [
        'Always true',
        'Always false',
        'Syntax Error',
        'Compares content correctly',
      ],
      'answer': 'Always false',
      'difficulty': 'easy',
      'explanation':
          '== compares memory references. For content comparison, use .equals().',
    },
    {
      'question': 'Complete the Code: Print to console.',
      'codeSnippet': 'System.____.println("Hello");',
      'language': 'Java',
      'options': ['in', 'err', 'out', 'print'],
      'answer': 'out',
      'difficulty': 'easy',
      'explanation': 'System.out is the standard output stream.',
    },
    {
      'question': 'Spot the Error: Array initialization.',
      'codeSnippet': 'int nums = {1, 2, 3};',
      'language': 'Java',
      'options': [
        'int should be int[]',
        'Curly braces are wrong',
        'Missing new keyword',
        'Both A and B',
      ],
      'answer': 'int should be int[]',
      'difficulty': 'easy',
      'explanation':
          'To declare an array, you must use square brackets after the type.',
    },
    {
      'question': 'Fill the Code: Infinite loop check.',
      'codeSnippet': 'while (____) {\n    // do something\n}',
      'language': 'Java',
      'options': ['1', 'true', 'yes', 'always'],
      'answer': 'true',
      'difficulty': 'easy',
      'explanation':
          'In Java, while expects a boolean expression, not an integer.',
    },
    {
      'question': 'Complete the Code: Define a constant.',
      'codeSnippet': 'public ____ int MAX = 100;',
      'language': 'Java',
      'options': ['const', 'static', 'final', 'fixed'],
      'answer': 'final',
      'difficulty': 'easy',
      'explanation':
          'The "final" keyword prevents a variable from being modified.',
    },
    {
      'question': 'Spot the Error: Missing import.',
      'codeSnippet': 'ArrayList<String> list = new ArrayList<>();',
      'language': 'Java',
      'options': [
        'Missing java.util.ArrayList',
        'Missing java.util.List',
        'Missing java.util.*',
        'A or C',
      ],
      'answer': 'A or C',
      'difficulty': 'easy',
      'explanation': 'ArrayList belongs to the java.util package.',
    },
    {
      'question': 'Fill the Code: Handle exceptions.',
      'codeSnippet':
          'try {\n    // code\n} ____ (Exception e) {\n    // handle\n}',
      'language': 'Java',
      'options': ['except', 'catch', 'error', 'handle'],
      'answer': 'catch',
      'difficulty': 'easy',
      'explanation': 'Java uses the catch keyword to handle exceptions.',
    },
    {
      'question': 'Complete the Code: Create a new object.',
      'codeSnippet': 'MyClass obj = ____ MyClass();',
      'language': 'Java',
      'options': ['create', 'new', 'make', 'init'],
      'answer': 'new',
      'difficulty': 'easy',
      'explanation': 'The "new" keyword is used to instantiate objects.',
    },
    // Java Medium
    {
      'question': 'Spot the Error: Abstract class instantiation.',
      'codeSnippet': 'abstract class A { }\nA obj = new A();',
      'language': 'Java',
      'options': [
        'Works fine',
        'Cannot instantiate abstract class',
        'Missing constructor',
        'Needs main method',
      ],
      'answer': 'Cannot instantiate abstract class',
      'difficulty': 'medium',
      'explanation':
          'Abstract classes cannot be instantiated with the "new" keyword.',
    },
    {
      'question': 'Fill the Code: Call parent constructor.',
      'codeSnippet':
          'class B extends A {\n    B() {\n        ____();\n    }\n}',
      'language': 'Java',
      'options': ['this', 'parent', 'super', 'base'],
      'answer': 'super',
      'difficulty': 'medium',
      'explanation': 'super() calls the constructor of the parent class.',
    },
    {
      'question': 'Complete the Code: Interface method.',
      'codeSnippet': 'interface MyInterface {\n    void doSomething();\n}',
      'language': 'Java',
      'options': [
        'Needs public',
        'Implicitly public and abstract',
        'Needs body',
        'Both A and B',
      ],
      'answer': 'Both A and B',
      'difficulty': 'medium',
      'explanation': 'Interface methods are implicitly public and abstract.',
    },
    {
      'question': 'Spot the Error: Static vs Non-static.',
      'codeSnippet':
          'class Test {\n    int x = 10;\n    public static void main(String[] args) {\n        System.out.println(x);\n    }\n}',
      'language': 'Java',
      'options': [
        'Works fine',
        'Cannot access non-static x from static main',
        'x must be final',
        'main should not be static',
      ],
      'answer': 'Cannot access non-static x from static main',
      'difficulty': 'medium',
      'explanation':
          'Static methods can only access other static members directly.',
    },
    {
      'question': 'Fill the Code: Iterate using enhanced for loop.',
      'codeSnippet': 'int[] nums = {1, 2};\nfor (int n ____ nums) { }',
      'language': 'Java',
      'options': ['in', ':', 'of', '->'],
      'answer': ':',
      'difficulty': 'medium',
      'explanation': 'Java uses a colon (:) for the enhanced for loop.',
    },
    {
      'question': 'Complete the Code: Using Wrapper classes.',
      'codeSnippet': 'Integer x = 10;\nint y = x; // What is this called?',
      'language': 'Java',
      'options': ['Autoboxing', 'Unboxing', 'Casting', 'Conversion'],
      'answer': 'Unboxing',
      'difficulty': 'medium',
      'explanation':
          'Converting an Integer object to a primitive int is called unboxing.',
    },
    {
      'question': 'Spot the Error: Checked Exception.',
      'codeSnippet': 'public void write() {\n    throw new IOException();\n}',
      'language': 'Java',
      'options': [
        'Works fine',
        'Must declare "throws IOException"',
        'Must use try-catch',
        'A or C',
      ],
      'answer': 'A or C',
      'difficulty': 'medium',
      'explanation':
          'IOException is a checked exception and must be handled or declared.',
    },
    {
      'question': 'Fill the Code: Access private member in inner class.',
      'codeSnippet':
          'class Outer {\n    private int x = 5;\n    class Inner {\n        void show() { System.out.println(____); }\n    }\n}',
      'language': 'Java',
      'options': ['x', 'Outer.x', 'this.x', 'Outer.this.x'],
      'answer': 'x',
      'difficulty': 'medium',
      'explanation':
          'Inner classes have direct access to private members of the outer class.',
    },
    {
      'question': 'Complete the Code: Lambda expression for Runnable.',
      'codeSnippet': 'Runnable r = () ____ System.out.println("hi");',
      'language': 'Java',
      'options': ['->', '=>', ':', '::'],
      'answer': '->',
      'difficulty': 'medium',
      'explanation': 'Java uses the arrow (->) for lambda expressions.',
    },
    {
      'question': 'Spot the Error: Switch statement with floating point.',
      'codeSnippet': 'double d = 1.0;\nswitch(d) { case 1.0: break; }',
      'language': 'Java',
      'options': [
        'Works fine',
        'Switch cannot use double',
        'Case must be int',
        'Syntax Error',
      ],
      'answer': 'Switch cannot use double',
      'difficulty': 'medium',
      'explanation':
          'Java switch statements only support int, char, String, and enum.',
    },
    // Java Hard
    {
      'question': 'Spot the Error: What is "volatile" keyword for?',
      'codeSnippet': 'volatile int counter = 0;',
      'language': 'Java',
      'options': [
        'Makes it constant',
        'Ensures visibility across threads',
        'Prevents caching',
        'Both B and C',
      ],
      'answer': 'Both B and C',
      'difficulty': 'hard',
      'explanation':
          'Volatile ensures that changes to a variable are always read from main memory.',
    },
    {
      'question': 'Fill the Code: Use generics to restrict type.',
      'codeSnippet': 'public <T ____ Number> void process(T val) { }',
      'language': 'Java',
      'options': ['implements', 'extends', 'super', 'is'],
      'answer': 'extends',
      'difficulty': 'hard',
      'explanation': 'In generics, "extends" is used for upper bounding.',
    },
    {
      'question': 'Complete the Code: Reflection to get class name.',
      'codeSnippet': 'String name = obj.____().getName();',
      'language': 'Java',
      'options': ['class()', 'getClass()', 'type()', 'getType()'],
      'answer': 'getClass()',
      'difficulty': 'hard',
      'explanation':
          'Object.getClass() returns the runtime class of the object.',
    },
    {
      'question':
          'Spot the Error: Thread safety with StringBuffer vs StringBuilder.',
      'codeSnippet':
          'StringBuilder sb = new StringBuilder();\n// accessed by multiple threads',
      'language': 'Java',
      'options': [
        'StringBuffer is thread-safe',
        'StringBuilder is thread-safe',
        'StringBuilder is faster but not thread-safe',
        'Both A and C',
      ],
      'answer': 'Both A and C',
      'difficulty': 'hard',
      'explanation':
          'StringBuilder should not be used in multi-threaded environments without synchronization.',
    },
    {
      'question': 'Fill the Code: Use Stream API to filter.',
      'codeSnippet': 'list.stream().____(x -> x > 5).collect(...);',
      'language': 'Java',
      'options': ['select', 'find', 'filter', 'where'],
      'answer': 'filter',
      'difficulty': 'hard',
      'explanation':
          'filter() is the intermediate operation to select elements.',
    },
    {
      'question': 'Complete the Code: Synchronization block.',
      'codeSnippet': '____ (this) {\n    // thread-safe block\n}',
      'language': 'Java',
      'options': ['lock', 'synchronized', 'secure', 'guard'],
      'answer': 'synchronized',
      'difficulty': 'hard',
      'explanation': 'The synchronized keyword provides mutual exclusion.',
    },
    {
      'question': 'Spot the Error: Serialization UID.',
      'codeSnippet':
          'class User implements Serializable {\n    private static final long serialVersionUID = 1L;\n}',
      'language': 'Java',
      'options': [
        'Works fine',
        'serialVersionUID is optional but recommended',
        'UID must be String',
        'Logic Error',
      ],
      'answer': 'serialVersionUID is optional but recommended',
      'difficulty': 'hard',
      'explanation':
          'It is best practice to define a serialVersionUID to ensure version compatibility.',
    },
    {
      'question':
          'Fill the Code: Use Optional to prevent NullPointerException.',
      'codeSnippet': 'Optional<String> opt = Optional.____(name);',
      'language': 'Java',
      'options': ['from', 'ofNullable', 'create', 'wrap'],
      'answer': 'ofNullable',
      'difficulty': 'hard',
      'explanation':
          'Optional.ofNullable() handles cases where name might be null.',
    },
    {
      'question': 'Complete the Code: Method reference.',
      'codeSnippet': 'list.forEach(System.out____println);',
      'language': 'Java',
      'options': ['::', '->', '.', '=>'],
      'answer': '::',
      'difficulty': 'hard',
      'explanation': 'Java uses double colons (::) for method references.',
    },
    {
      'question': 'Spot the Error: Multi-catch block syntax.',
      'codeSnippet': 'try { ... } catch (IOException | SQLException e) { ... }',
      'language': 'Java',
      'options': [
        'Works fine (Java 7+)',
        'Must use separate catch blocks',
        'Logic Error',
        'Syntax Error',
      ],
      'answer': 'Works fine (Java 7+)',
      'difficulty': 'hard',
      'explanation':
          'Java 7 introduced the ability to catch multiple exceptions in a single block using the pipe operator.',
    },
    {
      'question': 'What is JRE?',
      'options': [
        'Java Runtime Environment',
        'Java Remote Engine',
        'Java Realtime Entry',
        'Java Resource Editor',
      ],
      'answer': 'Java Runtime Environment',
      'difficulty': 'easy',
    },
    {
      'question': 'Which of these is not a primitive type?',
      'options': ['int', 'double', 'String', 'char'],
      'answer': 'String',
      'difficulty': 'easy',
    },
    {
      'question': 'What is the purpose of "final" keyword?',
      'options': [
        'To end a loop',
        'To make a variable constant',
        'To finish the program',
        'To declare a finalizer',
      ],
      'answer': 'To make a variable constant',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a package in Java?',
      'options': [
        'A compressed file',
        'A group of related classes',
        'A library',
        'A framework',
      ],
      'answer': 'A group of related classes',
      'difficulty': 'medium',
    },
    {
      'question': 'Which method is the entry point for Java?',
      'options': ['start()', 'init()', 'main()', 'run()'],
      'answer': 'main()',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain Garbage Collection in Java.',
      'options': [
        'Manual memory deletion',
        'Automatic memory management',
        'Deleting unused files',
        'Clearing cache',
      ],
      'answer': 'Automatic memory management',
      'difficulty': 'medium',
    },
    {
      'question': 'What is an Interface?',
      'options': [
        'A concrete class',
        'A fully abstract class',
        'A data type',
        'A UI component',
      ],
      'answer': 'A fully abstract class',
      'difficulty': 'medium',
    },
    {
      'question': 'Can we overload the main() method?',
      'options': ['Yes', 'No', 'Only in static classes', 'Only in Java 8+'],
      'answer': 'Yes',
      'difficulty': 'hard',
    },
    {
      'question': 'What is JVM?',
      'options': [
        'Java Visual Machine',
        'Java Virtual Machine',
        'Java Verified Module',
        'Java Variable Manager',
      ],
      'answer': 'Java Virtual Machine',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a ClassLoader in Java?',
      'options': [
        'Creates classes',
        'Loads class files at runtime',
        'A memory manager',
        'A UI builder',
      ],
      'answer': 'Loads class files at runtime',
      'difficulty': 'medium',
    },
    {
      'question': 'Difference between ArrayList and LinkedList?',
      'options': [
        'No difference',
        'Storage vs Linking',
        'ArrayList is always faster',
        'LinkedList uses less memory',
      ],
      'answer': 'Storage vs Linking',
      'difficulty': 'medium',
    },
    {
      'question': 'What is Reflection in Java?',
      'options': [
        'Displaying images',
        'Inspecting classes at runtime',
        'A type of inheritance',
        'Mirroring a database',
      ],
      'answer': 'Inspecting classes at runtime',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain the "super" keyword.',
      'options': [
        'Refers to current object',
        'Refers to immediate parent object',
        'Refers to main method',
        'Refers to static members',
      ],
      'answer': 'Refers to immediate parent object',
      'difficulty': 'easy',
    },
    {
      'question': 'What is an Abstract method?',
      'options': [
        'A method with no body',
        'A fast method',
        'A private method',
        'A final method',
      ],
      'answer': 'A method with no body',
      'difficulty': 'medium',
    },
    {
      'question': 'What are Annotations?',
      'options': [
        'Comments',
        'Metadata for code',
        'Variable types',
        'File names',
      ],
      'answer': 'Metadata for code',
      'difficulty': 'medium',
    },
    {
      'question': 'What is Serialization?',
      'options': [
        'Sorting data',
        'Converting object to byte stream',
        'Encrypted storage',
        'Deleting old objects',
      ],
      'answer': 'Converting object to byte stream',
      'difficulty': 'hard',
    },
    {
      'question': 'What is the purpose of "volatile" in Java?',
      'options': [
        'Optimization',
        'Thread safety for variable visibility',
        'Making it constant',
        'Allocating in stack',
      ],
      'answer': 'Thread safety for variable visibility',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain Functional Interfaces.',
      'options': [
        'Interfaces with many methods',
        'Interfaces with exactly one abstract method',
        'A type of class',
        'UI interfaces',
      ],
      'answer': 'Interfaces with exactly one abstract method',
      'difficulty': 'hard',
    },
  ],
  'Python': [
    {
      'question': 'Which data type is immutable in Python?',
      'options': ['List', 'Dictionary', 'Tuple', 'Set'],
      'answer': 'Tuple',
      'difficulty': 'easy',
    },
    {
      'question': 'How do you create a function in Python?',
      'options': [
        'function name():',
        'def name():',
        'void name():',
        'create name():',
      ],
      'answer': 'def name():',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "self" in Python classes?',
      'options': [
        'Keyword for inheritance',
        'Reference to current instance',
        'A static variable',
        'A hidden parameter',
      ],
      'answer': 'Reference to current instance',
      'difficulty': 'medium',
    },
    {
      'question': 'What does pip stand for?',
      'options': [
        'Python Install Program',
        'Preferred Installer Program',
        'Packages In Python',
        'Python Integer Pointer',
      ],
      'answer': 'Preferred Installer Program',
      'difficulty': 'medium',
    },
    {
      'question': 'Spot the Error: What is wrong with this code?',
      'codeSnippet': 'def add_numbers(a, b)\n    return a + b',
      'language': 'Python',
      'options': [
        'Missing colon after function definition',
        'Incorrect return statement',
        'Parameter names are too short',
        'None of the above',
      ],
      'answer': 'Missing colon after function definition',
      'difficulty': 'easy',
      'explanation':
          'In Python, a function definition must end with a colon (:).',
    },
    {
      'question':
          'Fill the Code: Use the correct method to add "Apple" to the list.',
      'codeSnippet': 'fruits = ["Banana", "Cherry"]\nfruits.____("Apple")',
      'language': 'Python',
      'options': ['add', 'insert', 'append', 'push'],
      'answer': 'append',
      'difficulty': 'easy',
      'explanation': 'The append() method adds an item to the end of a list.',
    },
    {
      'question':
          'Complete the Code: How do you check if a key exists in a dictionary?',
      'codeSnippet': 'my_dict = {"name": "Alice"}\nif "name" ____ my_dict:',
      'language': 'Python',
      'options': ['has', 'exists', 'in', 'contains'],
      'answer': 'in',
      'difficulty': 'easy',
      'explanation':
          'The "in" operator is used to check for the presence of a key in a dictionary.',
    },
    {
      'question': 'Spot the Error: Why will this loop fail?',
      'codeSnippet': 'for i in range(10)\nprint(i)',
      'language': 'Python',
      'options': [
        'range(10) is wrong',
        'Missing indentation',
        'Missing colon',
        'Both B and C',
      ],
      'answer': 'Both B and C',
      'difficulty': 'easy',
      'explanation':
          'The loop needs a colon and the next line must be indented.',
    },
    {
      'question': 'Fill the Code: Print "hello" in lowercase.',
      'codeSnippet': 'text = "HELLO"\nprint(text.____())',
      'language': 'Python',
      'options': ['low', 'down', 'lower', 'small'],
      'answer': 'lower',
      'difficulty': 'easy',
      'explanation': 'The lower() method returns the string in lower case.',
    },
    {
      'question': 'Spot the Error: Finding the length of a list.',
      'codeSnippet': 'my_list = [1, 2, 3]\nprint(my_list.length())',
      'language': 'Python',
      'options': [
        'length() is not a list method',
        'Use len(my_list) instead',
        'Use size(my_list)',
        'Both A and B',
      ],
      'answer': 'Both A and B',
      'difficulty': 'easy',
      'explanation':
          'Lists do not have a length() method; use the len() function.',
    },
    {
      'question': 'Complete the Code: Converting a string to an integer.',
      'codeSnippet': 'num_str = "100"\nnum = ____(num_str)',
      'language': 'Python',
      'options': ['integer', 'to_int', 'int', 'parse'],
      'answer': 'int',
      'difficulty': 'easy',
      'explanation': 'The int() function converts a string to an integer.',
    },
    {
      'question': 'Spot the Error: String concatenation.',
      'codeSnippet': 'age = 25\nprint("I am " + age + " years old")',
      'language': 'Python',
      'options': [
        'Missing quotes',
        'Cannot concatenate string and int',
        'Use f-string instead',
        'Both B and C',
      ],
      'answer': 'Both B and C',
      'difficulty': 'easy',
      'explanation':
          'Python cannot concatenate strings and integers directly. Use str(age) or f-strings.',
    },
    {
      'question': 'Fill the Code: Iterate through keys and values.',
      'codeSnippet':
          'd = {"a": 1, "b": 2}\nfor k, v in d.____():\n    print(k, v)',
      'language': 'Python',
      'options': ['all', 'pairs', 'items', 'entries'],
      'answer': 'items',
      'difficulty': 'easy',
      'explanation':
          'The items() method returns a list of dictionary\'s (key, value) tuple pairs.',
    },
    {
      'question': 'Complete the Code: Open a file for writing.',
      'codeSnippet': 'f = open("data.txt", "____")',
      'language': 'Python',
      'options': ['r', 'w', 'a', 'x'],
      'answer': 'w',
      'difficulty': 'easy',
      'explanation': '"w" is the mode for opening a file for writing.',
    },
    // Python Medium
    {
      'question': 'Spot the Error: What happens if the key is missing?',
      'codeSnippet': 'd = {"x": 10}\nval = d["y"]',
      'language': 'Python',
      'options': [
        'Returns None',
        'Throws KeyError',
        'Returns 0',
        'Creates the key',
      ],
      'answer': 'Throws KeyError',
      'difficulty': 'medium',
      'explanation': 'Accessing a non-existent key with [] raises a KeyError.',
    },
    {
      'question': 'Fill the Code: Use list comprehension to get squares.',
      'codeSnippet': 'nums = [1, 2, 3]\nsquares = [x*x ____ x in nums]',
      'language': 'Python',
      'options': ['in', 'for', 'each', 'loop'],
      'answer': 'for',
      'difficulty': 'medium',
      'explanation': 'List comprehension syntax uses "for" to iterate.',
    },
    {
      'question': 'Complete the Code: Define a class constructor.',
      'codeSnippet':
          'class Person:\n    def ____(self, name):\n        self.name = name',
      'language': 'Python',
      'options': ['init', '__init__', 'constructor', '__new__'],
      'answer': '__init__',
      'difficulty': 'medium',
      'explanation':
          '__init__ is the standard name for the Python class constructor.',
    },
    {
      'question': 'Spot the Error: Global variable modification.',
      'codeSnippet': 'count = 0\ndef increment():\n    count += 1\nincrement()',
      'language': 'Python',
      'options': [
        'UnboundLocalError',
        'Syntax Error',
        'Works fine',
        'Missing parameter',
      ],
      'answer': 'UnboundLocalError',
      'difficulty': 'medium',
      'explanation':
          'To modify a global variable inside a function, you must declare it as "global count".',
    },
    {
      'question': 'Fill the Code: Check if all elements are True.',
      'codeSnippet': 'bits = [True, False, True]\nresult = ____(bits)',
      'language': 'Python',
      'options': ['is_all', 'every', 'all', 'check'],
      'answer': 'all',
      'difficulty': 'medium',
      'explanation':
          'The all() function returns True if all elements in the iterable are true.',
    },
    {
      'question': 'Complete the Code: Sort a list without modifying original.',
      'codeSnippet': 'nums = [3, 1, 2]\nnew_list = ____(nums)',
      'language': 'Python',
      'options': ['sort', 'order', 'sorted', 'ranked'],
      'answer': 'sorted',
      'difficulty': 'medium',
      'explanation':
          'The sorted() function returns a new sorted list, unlike .sort().',
    },
    {
      'question': 'Spot the Error: Indentation check.',
      'codeSnippet': 'def func():\n    print("line 1")\n  print("line 2")',
      'language': 'Python',
      'options': ['SyntaxError', 'IndentationError', 'TabError', 'LogicError'],
      'answer': 'IndentationError',
      'difficulty': 'medium',
      'explanation': 'Consistent indentation levels are required in Python.',
    },
    {
      'question': 'Fill the Code: Handle multiple exceptions.',
      'codeSnippet': 'try:\n    pass\n____ (ValueError, TypeError):\n    pass',
      'language': 'Python',
      'options': ['catch', 'handle', 'except', 'error'],
      'answer': 'except',
      'difficulty': 'medium',
      'explanation':
          'Python uses "except" followed by a tuple for multiple exceptions.',
    },
    {
      'question': 'Complete the Code: Join strings from a list.',
      'codeSnippet': 'words = ["a", "b"]\nresult = "-".____(words)',
      'language': 'Python',
      'options': ['concat', 'merge', 'join', 'add'],
      'answer': 'join',
      'difficulty': 'medium',
      'explanation': 'The join() method is called on the separator string.',
    },
    {
      'question': 'Spot the Error: Mutable default argument.',
      'codeSnippet':
          'def append_to(element, to=[]):\n    to.append(element)\n    return to',
      'language': 'Python',
      'options': [
        'Memory leak',
        'Shared list across calls',
        'Logic error',
        'Syntax error',
      ],
      'answer': 'Shared list across calls',
      'difficulty': 'medium',
      'explanation':
          'Default arguments are evaluated once at definition, not at each call.',
    },
    // Python Hard
    {
      'question': 'Spot the Error: What is "mro" ambiguity?',
      'codeSnippet': 'class A: pass\nclass B(A): pass\nclass C(A, B): pass',
      'language': 'Python',
      'options': [
        'Cyclic inheritance',
        'TypeError: Cannot create consistent MRO',
        'Multiple inheritance error',
        'Base class conflict',
      ],
      'answer': 'TypeError: Cannot create consistent MRO',
      'difficulty': 'hard',
      'explanation':
          'Python\'s MRO (C3 linearization) prevents creating a class where B is an ancestor of C and also follows A in C\'s base list.',
    },
    {
      'question': 'Fill the Code: Create a generator function.',
      'codeSnippet':
          'def count_up():\n    n = 1\n    while True:\n        ____ n\n        n += 1',
      'language': 'Python',
      'options': ['return', 'emit', 'yield', 'next'],
      'answer': 'yield',
      'difficulty': 'hard',
      'explanation': '"yield" turns a function into a generator.',
    },
    {
      'question': 'Complete the Code: Use a decorator to log calls.',
      'codeSnippet':
          'def log(f):\n    def wrapper(*args):\n        print("Calling")\n        return f(*args)\n    ____ wrapper',
      'language': 'Python',
      'options': ['return', 'yield', 'give', 'attach'],
      'answer': 'return',
      'difficulty': 'hard',
      'explanation': 'A decorator must return a wrapper function.',
    },
    {
      'question': 'Spot the Error: Metaclass definition.',
      'codeSnippet':
          'class MyMeta(type):\n    pass\nclass MyClass(____=MyMeta): pass',
      'language': 'Python',
      'options': ['base', 'parent', 'metaclass', 'source'],
      'answer': 'metaclass',
      'difficulty': 'hard',
      'explanation':
          'The metaclass argument is used to specify a metaclass in class definition.',
    },
    {
      'question': 'Fill the Code: Context manager entry method.',
      'codeSnippet':
          'class MyContext:\n    def ____(self):\n        return self\n    def __exit__(self, *args): pass',
      'language': 'Python',
      'options': ['open', 'start', 'enter', '__enter__'],
      'answer': '__enter__',
      'difficulty': 'hard',
      'explanation':
          '__enter__ is the required dunder method for context managers.',
    },
    {
      'question': 'Complete the Code: Deep copy an object.',
      'codeSnippet':
          'import copy\nold_list = [[1], [2]]\nnew_list = copy.____(old_list)',
      'language': 'Python',
      'options': ['copy', 'full_copy', 'deepcopy', 'clone'],
      'answer': 'deepcopy',
      'difficulty': 'hard',
      'explanation':
          'copy.deepcopy() creates a fully independent copy of complex structures.',
    },
    {
      'question': 'Spot the Error: Threading GIL limitation.',
      'codeSnippet':
          'import threading\ndef cpu_bound():\n    while True: pass\nt1 = threading.Thread(target=cpu_bound)\nt2 = threading.Thread(target=cpu_bound)',
      'language': 'Python',
      'options': [
        'Both threads run on different cores',
        'Threads share memory incorrectly',
        'GIL blocks true parallel CPU-bound execution',
        'Syntax Error',
      ],
      'answer': 'GIL blocks true parallel CPU-bound execution',
      'difficulty': 'hard',
      'explanation':
          'The Global Interpreter Lock (GIL) prevents multiple threads from executing Python bytecode simultaneously on multiple cores.',
    },
    {
      'question': 'Fill the Code: Use slot for memory optimization.',
      'codeSnippet': 'class Point:\n    ____ = ("x", "y")',
      'language': 'Python',
      'options': ['slots', '__slots__', 'members', 'fields'],
      'answer': '__slots__',
      'difficulty': 'hard',
      'explanation':
          '__slots__ avoids the creation of a __dict__ for each instance, saving memory.',
    },
    {
      'question': 'Complete the Code: Deserializing JSON data.',
      'codeSnippet': 'import json\ndata = \'{"a": 1}\'\nobj = json.____(data)',
      'language': 'Python',
      'options': ['parse', 'load', 'loads', 'read'],
      'answer': 'loads',
      'difficulty': 'hard',
      'explanation':
          'json.loads() (load string) converts a JSON string to a Python dictionary.',
    },
    {
      'question': 'Spot the Error: Dictionary ordering expected in old Python.',
      'codeSnippet': 'd = {"a": 1, "b": 2}\nprint(list(d.keys()))',
      'language': 'Python',
      'options': [
        'Always sorted',
        'Preserves insertion order since 3.7+',
        'Random order in 3.6',
        'Both B and C',
      ],
      'answer': 'Both B and C',
      'difficulty': 'hard',
      'explanation': 'Dictionary order was not guaranteed before Python 3.7.',
    },
    {
      'question': 'Which of these is used for multi-threading in Python?',
      'options': ['threading', 'multiprocess', 'asyncio', 'All of above'],
      'answer': 'All of above',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a decorator in Python?',
      'options': [
        'A design pattern',
        'A function that modifies another function',
        'A documentation tool',
        'A UI element',
      ],
      'answer': 'A function that modifies another function',
      'difficulty': 'hard',
    },
    {
      'question': 'What is PEP 8?',
      'options': [
        'A python version',
        'Style guide for Python',
        'A math library',
        'A compiler flag',
      ],
      'answer': 'Style guide for Python',
      'difficulty': 'medium',
    },
    {
      'question': 'How do you handle exceptions in Python?',
      'options': ['try-catch', 'try-except', 'throw-catch', 'handle-error'],
      'answer': 'try-except',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a list comprehension?',
      'options': [
        'A way to search lists',
        'A concise way to create lists',
        'A sorting algorithm',
        'A memory management tool',
      ],
      'answer': 'A concise way to create lists',
      'difficulty': 'medium',
    },
    {
      'question': 'Which operator is used for exponentiation?',
      'options': ['^', '**', 'pow', 'exp'],
      'answer': '**',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a "Generator" in Python?',
      'options': [
        'A random number tool',
        'A function that returns an iterator',
        'A class builder',
        'A power tool',
      ],
      'answer': 'A function that returns an iterator',
      'difficulty': 'hard',
    },
    {
      'question': 'Difference between "is" and "=="?',
      'options': [
        'No difference',
        'Reference vs Value equality',
        'Speed',
        'Memory',
      ],
      'answer': 'Reference vs Value equality',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "docstring"?',
      'options': [
        'A string of doctors',
        'Documentation inside functions/classes',
        'A type of list',
        'A hidden variable',
      ],
      'answer': 'Documentation inside functions/classes',
      'difficulty': 'easy',
    },
    {
      'question': 'What is monkey patching?',
      'options': [
        'Playing with code',
        'Modifying code at runtime',
        'A testing style',
        'Fixing bugs in monkeys',
      ],
      'answer': 'Modifying code at runtime',
      'difficulty': 'hard',
    },
    {
      'question': 'What are *args and **kwargs?',
      'options': [
        'Variable length arguments',
        'Math operators',
        'File names',
        'Memory addresses',
      ],
      'answer': 'Variable length arguments',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain GIL (Global Interpreter Lock).',
      'options': [
        'A security lock',
        'Lock that allows only one thread to control Python interpreter',
        'A file system lock',
        'Database lock',
      ],
      'answer':
          'Lock that allows only one thread to control Python interpreter',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "virtualenv"?',
      'options': [
        'A game world',
        'Tool to create isolated Python environments',
        'A cloud service',
        'A type of function',
      ],
      'answer': 'Tool to create isolated Python environments',
      'difficulty': 'medium',
    },
    {
      'question': 'How do you merge two dictionaries?',
      'options': [
        'dic1 + dic2',
        'dic1.update(dic2)',
        'dic1.merge(dic2)',
        'combine(dic1, dic2)',
      ],
      'answer': 'dic1.update(dic2)',
      'difficulty': 'medium',
    },
    {
      'question': 'What is the purpose of "__init__.py"?',
      'options': [
        'Initializes variables',
        'Makes a directory a package',
        'Starts the program',
        'A dummy file',
      ],
      'answer': 'Makes a directory a package',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a "namespace"?',
      'options': [
        'A space for names',
        'A system of naming to ensure unique names',
        'A folder name',
        'A string type',
      ],
      'answer': 'A system of naming to ensure unique names',
      'difficulty': 'hard',
    },
  ],
  'SDE': [
    {
      'question': 'What is Big O notation used for?',
      'options': [
        'Design patterns',
        'Algorithm complexity',
        'Networking',
        'Database naming',
      ],
      'answer': 'Algorithm complexity',
      'difficulty': 'easy',
    },
    {
      'question': 'What is the time complexity of binary search?',
      'options': ['O(n)', 'O(log n)', 'O(n^2)', 'O(1)'],
      'answer': 'O(log n)',
      'difficulty': 'easy',
    },
    {
      'question': 'What is SOLID?',
      'options': [
        'A database type',
        'Design principles',
        'A programming language',
        'A security protocol',
      ],
      'answer': 'Design principles',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain MVC architecture.',
      'options': [
        'Model-View-Controller',
        'Main-Virtual-Core',
        'Module-Value-Check',
        'Mask-View-Click',
      ],
      'answer': 'Model-View-Controller',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a deadlock?',
      'options': [
        'A program crash',
        'Processes waiting for each other',
        'A secure lock',
        'A slow network',
      ],
      'answer': 'Processes waiting for each other',
      'difficulty': 'medium',
    },
    {
      'question': 'Difference between SQL and NoSQL?',
      'options': [
        'Relational vs Non-relational',
        'Fast vs Slow',
        'New vs Old',
        'No difference',
      ],
      'answer': 'Relational vs Non-relational',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a Singleton pattern?',
      'options': [
        'Only one instance of a class',
        'A pattern for single variables',
        'A sorting method',
        'A UI design',
      ],
      'answer': 'Only one instance of a class',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a REST API?',
      'options': [
        'Representational State Transfer',
        'Remote Entry System Task',
        'Realtime Electronic Search',
        'Rational Entry Socket',
      ],
      'answer': 'Representational State Transfer',
      'difficulty': 'medium',
    },
    {
      'question': 'What is dependency injection?',
      'options': [
        'A virus',
        'Injecting code into loops',
        'Providing objects a class needs',
        'A networking technique',
      ],
      'answer': 'Providing objects a class needs',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain the difference between Git merge and rebase.',
      'options': [
        'No difference',
        'History preservation',
        'Speed',
        'File size',
      ],
      'answer': 'History preservation',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a binary tree?',
      'options': [
        'A tree with two roots',
        'A tree where each node has at most two children',
        'A tree with even number of nodes',
        'A type of list',
      ],
      'answer': 'A tree where each node has at most two children',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a hash table?',
      'options': [
        'A table for hashing food',
        'Data structure that maps keys to values',
        'A sorted list',
        'A type of database',
      ],
      'answer': 'Data structure that maps keys to values',
      'difficulty': 'medium',
    },
    {
      'question': 'What is the time complexity of QuickSort (average case)?',
      'options': ['O(n)', 'O(n^2)', 'O(n log n)', 'O(1)'],
      'answer': 'O(n log n)',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Normalization" in databases.',
      'options': [
        'Making data normal',
        'Process of organizing data to reduce redundancy',
        'Scaling numbers',
        'Deleting old data',
      ],
      'answer': 'Process of organizing data to reduce redundancy',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a Load Balancer?',
      'options': [
        'A gym equipment',
        'Device that distributes network traffic across multiple servers',
        'A battery tester',
        'A speed booster',
      ],
      'answer':
          'Device that distributes network traffic across multiple servers',
      'difficulty': 'medium',
    },
    {
      'question': 'Difference between multithreading and multitasking.',
      'options': [
        'No difference',
        'Tasks vs Threads execution',
        'Hardware vs Software',
        'Speed',
      ],
      'answer': 'Tasks vs Threads execution',
      'difficulty': 'medium',
    },
    {
      'question': 'What is the purpose of a Cache?',
      'options': [
        'Storing money',
        'Temporary storage for fast data access',
        'A type of database',
        'A network protocol',
      ],
      'answer': 'Temporary storage for fast data access',
      'difficulty': 'easy',
    },
    {
      'question': 'What is Microservices architecture?',
      'options': [
        'Tiny services',
        'Developing application as small independent services',
        'A single large code block',
        'Cloud storage style',
      ],
      'answer': 'Developing application as small independent services',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain the difference between TCP and UDP.',
      'options': [
        'Connection-oriented vs Connectionless',
        'Fast vs Slow',
        'New vs Old',
        'Hardware vs Software',
      ],
      'answer': 'Connection-oriented vs Connectionless',
      'difficulty': 'medium',
    },
    {
      'question': 'What is horizontal partitioning (Sharding)?',
      'options': [
        'Splitting table into rows',
        'Splitting table into columns',
        'Joining tables',
        'Deleting tables',
      ],
      'answer': 'Splitting table into rows',
      'difficulty': 'hard',
    },
  ],
  'SRE': [
    {
      'question': 'What does SRE stand for?',
      'options': [
        'Software Reliability Engineer',
        'Site Reliability Engineering',
        'System Realtime Engine',
        'Security Resource Entry',
      ],
      'answer': 'Site Reliability Engineering',
      'difficulty': 'easy',
    },
    {
      'question': 'What is an SLO?',
      'options': [
        'Service Level Objective',
        'System Log output',
        'Service List Order',
        'Secondary Link Option',
      ],
      'answer': 'Service Level Objective',
      'difficulty': 'easy',
    },
    {
      'question': 'Difference between SLA and SLO?',
      'options': [
        'SLA is internal, SLO is legal',
        'SLA has consequences, SLO is a target',
        'No difference',
        'SLA is for hardware',
      ],
      'answer': 'SLA has consequences, SLO is a target',
      'difficulty': 'medium',
    },
    {
      'question': 'What is Error Budget?',
      'options': [
        'Financial cost of errors',
        'Allowed unreliability before stopping changes',
        'Memory allocated for errors',
        'Number of bugs in code',
      ],
      'answer': 'Allowed unreliability before stopping changes',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain "Toil" in SRE context.',
      'options': [
        'Hard work',
        'Manual, repetitive, automatable work',
        'Coding time',
        'Bug fixing',
      ],
      'answer': 'Manual, repetitive, automatable work',
      'difficulty': 'medium',
    },
    {
      'question': 'What is observability?',
      'options': [
        'Monitoring everything',
        'Understanding system state from external outputs',
        'Looking at logs',
        'Watching graphs',
      ],
      'answer': 'Understanding system state from external outputs',
      'difficulty': 'hard',
    },
    {
      'question': 'Name the "Four Golden Signals" of monitoring.',
      'options': [
        'Latency, Traffic, Errors, Saturation',
        'CPU, RAM, Disk, Network',
        'Speed, Size, Cost, Time',
        'Users, Clicks, Views, Sales',
      ],
      'answer': 'Latency, Traffic, Errors, Saturation',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a post-mortem?',
      'options': [
        'A funeral',
        'Analysis of an incident after it is resolved',
        'A code review',
        'A test case',
      ],
      'answer': 'Analysis of an incident after it is resolved',
      'difficulty': 'easy',
    },
    {
      'question': 'What is IaC?',
      'options': [
        'Infrastructure as Code',
        'Internet and Cloud',
        'Internal access control',
        'Integrated auto compiler',
      ],
      'answer': 'Infrastructure as Code',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain horizontal vs vertical scaling.',
      'options': [
        'Adding more machines vs bigger machines',
        'Adding disks vs CPUs',
        'Up vs Down',
        'North vs South',
      ],
      'answer': 'Adding more machines vs bigger machines',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Blameless" post-mortem?',
      'options': [
        'No one is wrong',
        'Focus on process improvement rather than blaming individuals',
        'Deleting the logs',
        'Ignoring the issue',
      ],
      'answer': 'Focus on process improvement rather than blaming individuals',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "MTTR"?',
      'options': [
        'Mean Time To Resolve',
        'Mean Time To Recover',
        'Both',
        'Maximum Time To Run',
      ],
      'answer': 'Both',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Canary Deployment"?',
      'options': [
        'Deploying birds',
        'Gradual rollout to a small subset of users',
        'Rolling back code',
        'Deploying on weekends',
      ],
      'answer': 'Gradual rollout to a small subset of users',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain "Chaos Engineering".',
      'options': [
        'Causing bugs on purpose',
        'Experimenting on a system to ensure it can withstand turbulent conditions',
        'Writing messy code',
        'Random testing',
      ],
      'answer':
          'Experimenting on a system to ensure it can withstand turbulent conditions',
      'difficulty': 'hard',
    },
    {
      'question': 'What is the "Circuit Breaker" pattern?',
      'options': [
        'Electrical safety',
        'Software pattern to prevent cascading failures',
        'A type of compiler',
        'A networking cable',
      ],
      'answer': 'Software pattern to prevent cascading failures',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a "Health Check"?',
      'options': [
        'Doctor visit',
        'Endpoint to determine if a service is running correctly',
        'Memory check',
        'Log analysis',
      ],
      'answer': 'Endpoint to determine if a service is running correctly',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "Configuration Drift"?',
      'options': [
        'Fast configuration',
        'Unharted changes that cause environment inconsistency',
        'Changing colors in UI',
        'Slow network',
      ],
      'answer': 'Unharted changes that cause environment inconsistency',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Sidecar" pattern?',
      'options': [
        'A motorcycle attachment',
        'Helper container running alongside main container',
        'A backup server',
        'A mobile app',
      ],
      'answer': 'Helper container running alongside main container',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Prometheus" used for in SRE?',
      'options': [
        'Monitoring and alerting',
        'Cloud storage',
        'Code review',
        'CI/CD',
      ],
      'answer': 'Monitoring and alerting',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Blue-Green Deployment".',
      'options': [
        'Using two identical environments',
        'Coloring the UI',
        'A type of database',
        'Deploying on holidays',
      ],
      'answer': 'Using two identical environments',
      'difficulty': 'medium',
    },
  ],
  'Cloud': [
    {
      'question': 'What is SaaS?',
      'options': [
        'Software as a Service',
        'System as a Search',
        'Server as a Socket',
        'Security as a Service',
      ],
      'answer': 'Software as a Service',
      'difficulty': 'easy',
    },
    {
      'question': 'Which of these is a public cloud provider?',
      'options': ['AWS', 'Azure', 'GCP', 'All of above'],
      'answer': 'All of above',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a Docker container?',
      'options': [
        'A virtual machine',
        'Lightweight, standalone package of software',
        'A cloud storage unit',
        'A networking tool',
      ],
      'answer': 'Lightweight, standalone package of software',
      'difficulty': 'medium',
    },
    {
      'question': 'What is Kubernetes?',
      'options': [
        'A cloud provider',
        'Container orchestration system',
        'A database',
        'A programming language',
      ],
      'answer': 'Container orchestration system',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Serverless" computing.',
      'options': [
        'No servers involved',
        'Cloud provider manages server allocation',
        'Running on user PC',
        'Offline computing',
      ],
      'answer': 'Cloud provider manages server allocation',
      'difficulty': 'medium',
    },
    {
      'question': 'What is an S3 bucket in AWS?',
      'options': [
        'A waste bin',
        'Object storage service',
        'Database table',
        'Virtual machine',
      ],
      'answer': 'Object storage service',
      'difficulty': 'easy',
    },
    {
      'question': 'What is an EC2 instance?',
      'options': [
        'A storage unit',
        'A virtual server',
        'A load balancer',
        'A lambda function',
      ],
      'answer': 'A virtual server',
      'difficulty': 'easy',
    },
    {
      'question': 'What is VPC?',
      'options': [
        'Virtual Private Cloud',
        'Very Private Connection',
        'Virtual Power Circuit',
        'Volume Processing Center',
      ],
      'answer': 'Virtual Private Cloud',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Cloud Native".',
      'options': [
        'Software made in the cloud',
        'Designed specifically for cloud environments',
        'Software with its own server',
        'Using only one cloud provider',
      ],
      'answer': 'Designed specifically for cloud environments',
      'difficulty': 'hard',
    },
    {
      'question': 'What is CI/CD?',
      'options': [
        'Continuous Integration and Delivery',
        'Code Input and Check Design',
        'Cloud Integration and Data',
        'Click and Check',
      ],
      'answer': 'Continuous Integration and Delivery',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Serverless" function (FaaS)?',
      'options': [
        'Function as a Service',
        'Fast as a Service',
        'File as a Service',
        'Framework as a Service',
      ],
      'answer': 'Function as a Service',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Auto-scaling"?',
      'options': [
        'Scaling images',
        'Automatically adjusting resources based on load',
        'Fast code execution',
        'Manual server growth',
      ],
      'answer': 'Automatically adjusting resources based on load',
      'difficulty': 'easy',
    },
    {
      'question': 'What is an "Availability Zone" (AZ)?',
      'options': [
        'A time zone',
        'Isolated data centers within a region',
        'A free tier',
        'Speed zone',
      ],
      'answer': 'Isolated data centers within a region',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "Edge Computing"?',
      'options': [
        'Computing at the edge of a table',
        'Processing data closer to the source',
        'High end computing',
        'Cutting edge tech',
      ],
      'answer': 'Processing data closer to the source',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Object Storage"?',
      'options': [
        'Storing physical objects',
        'Storage architecture for unstructured data',
        'Database table',
        'A type of RAM',
      ],
      'answer': 'Storage architecture for unstructured data',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Private Cloud"?',
      'options': [
        'Secret cloud',
        'Cloud infrastructure for a single organization',
        'Offline cloud',
        'Inexpensive cloud',
      ],
      'answer': 'Cloud infrastructure for a single organization',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "Vendor Lock-in"?',
      'options': [
        'Secure vendor',
        'Difficulty of switching from one cloud provider to another',
        'Locked servers',
        'High prices',
      ],
      'answer': 'Difficulty of switching from one cloud provider to another',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Multi-cloud"?',
      'options': [
        'Many clouds in sky',
        'Using services from multiple cloud providers',
        'Cloud with many servers',
        'Fast cloud',
      ],
      'answer': 'Using services from multiple cloud providers',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain "Shared Responsibility Model".',
      'options': [
        'Everyone responsible for everything',
        'Provider manages cloud security, Customer manages security in the cloud',
        'No one responsible',
        'Shared passwords',
      ],
      'answer':
          'Provider manages cloud security, Customer manages security in the cloud',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "Terraform" used for?',
      'options': [
        'Earth moving',
        'Infrastructure as Code (IaC) tool',
        'A database',
        'A programming language',
      ],
      'answer': 'Infrastructure as Code (IaC) tool',
      'difficulty': 'medium',
    },
  ],
  'Flutter': [
    {
      'question': 'What is Flutter?',
      'options': [
        'A UI framework',
        'A database',
        'A programming language',
        'An OS',
      ],
      'answer': 'A UI framework',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a Widget in Flutter?',
      'options': [
        'A small tool',
        'A basic building block of UI',
        'A network protocol',
        'A database table',
      ],
      'answer': 'A basic building block of UI',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain StatelessWidget vs StatefulWidget.',
      'options': [
        'One is fast, one is slow',
        'One has state, one does not',
        'One is for text, one for images',
        'No difference',
      ],
      'answer': 'One has state, one does not',
      'difficulty': 'medium',
    },
    {
      'question': 'What does "Hot Reload" do?',
      'options': [
        'Reloads the OS',
        'Updates code changes instantly',
        'Reheats the CPU',
        'Compiles for release',
      ],
      'answer': 'Updates code changes instantly',
      'difficulty': 'easy',
    },
    {
      'question': 'What is pubspec.yaml used for?',
      'options': [
        'Storing passwords',
        'Project configuration and dependencies',
        'Writing code',
        'Database schema',
      ],
      'answer': 'Project configuration and dependencies',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain build() method.',
      'options': [
        'Compiles the app',
        'Constructs the UI given context',
        'Starts the app',
        'Saves the state',
      ],
      'answer': 'Constructs the UI given context',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a key in Flutter?',
      'options': [
        'A security key',
        'Used to preserve state when widgets move',
        'A keyboard button',
        'A database primary key',
      ],
      'answer': 'Used to preserve state when widgets move',
      'difficulty': 'hard',
    },
    {
      'question': 'How do you perform navigation in Flutter?',
      'options': [
        'Link tag',
        'Navigator class',
        'Route command',
        'Jump function',
      ],
      'answer': 'Navigator class',
      'difficulty': 'easy',
    },
    {
      'question': 'What is an InheritedWidget?',
      'options': [
        'A widget that inherits from others',
        'Used to pass data down the tree efficiently',
        'A widget used only once',
        'A legacy widget',
      ],
      'answer': 'Used to pass data down the tree efficiently',
      'difficulty': 'hard',
    },
    {
      'question': 'What is Flutter "shades" in colors?',
      'options': [
        'Sunglasses',
        'Variants of a color with different weights',
        'Different fonts',
        'Pixel offsets',
      ],
      'answer': 'Variants of a color with different weights',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Provider" in Flutter?',
      'options': [
        'A data provider',
        'A wrapper around InheritedWidget for state management',
        'A networking library',
        'A UI component',
      ],
      'answer': 'A wrapper around InheritedWidget for state management',
      'difficulty': 'medium',
    },
    {
      'question': 'How do you handle responsiveness in Flutter?',
      'options': ['MediaQuery', 'LayoutBuilder', 'Both', 'Only CSS'],
      'answer': 'Both',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Sliver"?',
      'options': [
        'A small piece of wood',
        'A portion of a scrollable area',
        'A type of button',
        'A color name',
      ],
      'answer': 'A portion of a scrollable area',
      'difficulty': 'hard',
    },
    {
      'question': 'What is the purpose of "CustomPaint"?',
      'options': [
        'Painting a room',
        'Providing a canvas for drawing custom shapes',
        'Editing images',
        'Changing app theme',
      ],
      'answer': 'Providing a canvas for drawing custom shapes',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "Isolate" in Flutter/Dart?',
      'options': [
        'Stay alone',
        'A separate thread of execution with its own memory',
        'A type of widget',
        'A network error',
      ],
      'answer': 'A separate thread of execution with its own memory',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "MainAxisAlignment" in a Column?',
      'options': [
        'Horizontal alignment',
        'Vertical alignment',
        'Diagonal alignment',
        'Spacing',
      ],
      'answer': 'Vertical alignment',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a "Hero" widget?',
      'options': [
        'A powerful widget',
        'Used for shared element transitions between routes',
        'A main character',
        'A large button',
      ],
      'answer': 'Used for shared element transitions between routes',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "GlobalKey" used for?',
      'options': [
        'Opening all doors',
        'Uniquely identifies a widget and allows access to its state',
        'A static key',
        'A database key',
      ],
      'answer': 'Uniquely identifies a widget and allows access to its state',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain "Semantics" in Flutter.',
      'options': [
        'Meaning of words',
        'Provides meaning to widgets for accessibility tools',
        'A type of font',
        'Code style',
      ],
      'answer': 'Provides meaning to widgets for accessibility tools',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Flutter Engines" role?',
      'options': [
        'Starts the car',
        'Provides low-level implementation of Flutters core API',
        'A search engine',
        'A game engine',
      ],
      'answer': 'Provides low-level implementation of Flutters core API',
      'difficulty': 'hard',
    },
  ],
  'Dart': [
    {
      'question': 'What is Dart?',
      'options': [
        'A database',
        'A programming language',
        'A hardware',
        'A cloud service',
      ],
      'answer': 'A programming language',
      'difficulty': 'easy',
    },
    {
      'question': 'Is Dart a single-threaded language?',
      'options': ['Yes', 'No', 'Depends on OS', 'Only on web'],
      'answer': 'Yes',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a Future in Dart?',
      'options': [
        'A variable for tomorrow',
        'The result of an asynchronous operation',
        'A loop keyword',
        'A type of list',
      ],
      'answer': 'The result of an asynchronous operation',
      'difficulty': 'medium',
    },
    {
      'question': 'What does "async" and "await" do?',
      'options': [
        'Speeds up the app',
        'Handles async programming',
        'Makes the app sleep',
        'Stops the app',
      ],
      'answer': 'Handles async programming',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "final" vs "const"?',
      'options': [
        'Same thing',
        'Runtime vs Compile-time constant',
        'Final is for strings',
        'Const is for ints',
      ],
      'answer': 'Runtime vs Compile-time constant',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a Mixin?',
      'options': [
        'A blender',
        'A way to reuse a class\'s code in multiple hierarchies',
        'A type of inheritance',
        'A constructor',
      ],
      'answer': 'A way to reuse a class\'s code in multiple hierarchies',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain Sound Null Safety.',
      'options': [
        'Prevents 0 in math',
        'Ensures variables can\'t be null unless specified',
        'Makes the app louder',
        'A security feature',
      ],
      'answer': 'Ensures variables can\'t be null unless specified',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a Stream?',
      'options': [
        'A flow of data',
        'A type of file',
        'A UI element',
        'A networking protocol',
      ],
      'answer': 'A flow of data',
      'difficulty': 'medium',
    },
    {
      'question': 'Difference between list and set?',
      'options': [
        'Size',
        'Ordered vs Unordered/Unique',
        'Performance',
        'Type of data',
      ],
      'answer': 'Ordered vs Unordered/Unique',
      'difficulty': 'easy',
    },
    {
      'question': 'What is the "main" function in Dart?',
      'options': [
        'Project root',
        'Program entry point',
        'Custom function',
        'UI builder',
      ],
      'answer': 'Program entry point',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "Dynamic" vs "Object" in Dart?',
      'options': [
        'Same thing',
        'Dynamic disables type checking, Object is root of hierarchy',
        'Dynamic is faster',
        'Object is for strings',
      ],
      'answer': 'Dynamic disables type checking, Object is root of hierarchy',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain "Extensions" in Dart.',
      'options': [
        'File extensions',
        'Adding functionality to existing libraries/classes',
        'Downloading more RAM',
        'Browser extensions',
      ],
      'answer': 'Adding functionality to existing libraries/classes',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Factory Constructor"?',
      'options': [
        'A place where objects are made',
        'A constructor that doesn\'t always create a new instance',
        'A constructor for factories',
        'A private constructor',
      ],
      'answer': 'A constructor that doesn\'t always create a new instance',
      'difficulty': 'medium',
    },
    {
      'question': 'What are "Zones" in Dart?',
      'options': [
        'Safety zones',
        'Way to handle async errors and manage execution context',
        'Speed zones',
        'Time zones',
      ],
      'answer': 'Way to handle async errors and manage execution context',
      'difficulty': 'hard',
    },
    {
      'question': 'What is the "cascade" operator (..)?',
      'options': [
        'For falling data',
        'Allows performing a sequence of operations on same object',
        'Calculates math',
        'Joins strings',
      ],
      'answer': 'Allows performing a sequence of operations on same object',
      'difficulty': 'medium',
    },
    {
      'question': 'What is an "Enum" in Dart?',
      'options': [
        'Electronic number',
        'A special class used to represent a fixed number of constant values',
        'A type of list',
        'A math function',
      ],
      'answer':
          'A special class used to represent a fixed number of constant values',
      'difficulty': 'easy',
    },
    {
      'question': 'What is the difference between "var" and "dynamic"?',
      'options': [
        'No difference',
        'var is type-inferred once, dynamic can change type',
        'var is faster',
        'dynamic is for web',
      ],
      'answer': 'var is type-inferred once, dynamic can change type',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Map" in Dart?',
      'options': [
        'A tool for navigation',
        'A collection of key-value pairs',
        'A type of list',
        'A UI element',
      ],
      'answer': 'A collection of key-value pairs',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain "External" keyword.',
      'options': [
        'Outside the file',
        'Function body provided elsewhere (e.g. by host)',
        'A public function',
        'A cloud function',
      ],
      'answer': 'Function body provided elsewhere (e.g. by host)',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "await for" used for?',
      'options': [
        'Waiting for for-loop',
        'Iterating over a Stream',
        'Parallel loops',
        'Wait for a list',
      ],
      'answer': 'Iterating over a Stream',
      'difficulty': 'medium',
    },
  ],
  'SQL': [
    {
      'question': 'What does SQL stand for?',
      'options': [
        'Structured Query Language',
        'Simple Query Level',
        'Standard Quick Link',
        'System Query Logic',
      ],
      'answer': 'Structured Query Language',
      'difficulty': 'easy',
    },
    {
      'question': 'Which clause is used to filter rows in SQL?',
      'options': ['FILTER', 'WHERE', 'HAVING', 'GROUP BY'],
      'answer': 'WHERE',
      'difficulty': 'easy',
    },
    {
      'question': 'Difference between DELETE and TRUNCATE?',
      'options': [
        'One is faster, one is slower',
        'DELETE can be rolled back, TRUNCATE cannot',
        'No difference',
        'DELETE removes tables',
      ],
      'answer': 'DELETE can be rolled back, TRUNCATE cannot',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a Primary Key?',
      'options': [
        'A key to open the database',
        'A unique identifier for a row',
        'A foreign reference',
        'A password',
      ],
      'answer': 'A unique identifier for a row',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain INNER JOIN.',
      'options': [
        'Returns all rows from both tables',
        'Returns rows with matching values in both tables',
        'Returns only left table rows',
        'Returns only right table rows',
      ],
      'answer': 'Returns rows with matching values in both tables',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a Foreign Key?',
      'options': [
        'A key from another country',
        'A field that links two tables',
        'An encrypted key',
        'A primary key of the same table',
      ],
      'answer': 'A field that links two tables',
      'difficulty': 'medium',
    },
    {
      'question': 'What is the purpose of the GROUP BY clause?',
      'options': [
        'To sort results',
        'To aggregate data by one or more columns',
        'To filter groups',
        'To join tables',
      ],
      'answer': 'To aggregate data by one or more columns',
      'difficulty': 'medium',
    },
    {
      'question': 'What is an Index in SQL?',
      'options': [
        'A table of contents',
        'A data structure that improves data retrieval speed',
        'A primary key',
        'A view',
      ],
      'answer': 'A data structure that improves data retrieval speed',
      'difficulty': 'hard',
    },
    {
      'question': 'Difference between WHERE and HAVING?',
      'options': [
        'No difference',
        'WHERE is for rows, HAVING is for groups',
        'HAVING is faster',
        'WHERE is for columns',
      ],
      'answer': 'WHERE is for rows, HAVING is for groups',
      'difficulty': 'hard',
    },
    {
      'question': 'What is ACID in databases?',
      'options': [
        'A type of database',
        'Atomicity, Consistency, Isolation, Durability',
        'A security protocol',
        'A query language',
      ],
      'answer': 'Atomicity, Consistency, Isolation, Durability',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a "Common Table Expression" (CTE)?',
      'options': [
        'A temporary result set',
        'A type of table',
        'A primary key',
        'A database view',
      ],
      'answer': 'A temporary result set',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Normalization" up to 3NF.',
      'options': [
        'Removing all data',
        'Eliminating transitive dependencies',
        'Removing duplicates only',
        'Scaling the DB',
      ],
      'answer': 'Eliminating transitive dependencies',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a "View" in SQL?',
      'options': [
        'A camera view',
        'A virtual table based on a result set of a query',
        'A UI component',
        'A physical table',
      ],
      'answer': 'A virtual table based on a result set of a query',
      'difficulty': 'medium',
    },
    {
      'question': 'Difference between UNION and UNION ALL?',
      'options': [
        'UNION removes duplicates, UNION ALL keeps them',
        'Speed only',
        'Union is for rows',
        'No difference',
      ],
      'answer': 'UNION removes duplicates, UNION ALL keeps them',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Stored Procedure"?',
      'options': [
        'A grocery list',
        'A prepared SQL code that you can save and reuse',
        'A type of variable',
        'A database backup',
      ],
      'answer': 'A prepared SQL code that you can save and reuse',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Trigger"?',
      'options': [
        'An event that starts something',
        'A SQL script that automatically runs when an event occurs',
        'A mouse click',
        'A delete command',
      ],
      'answer': 'A SQL script that automatically runs when an event occurs',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "Referential Integrity"?',
      'options': [
        'Integrity of names',
        'Consistency between coupled tables using foreign keys',
        'Encrypted data',
        'Speed of lookups',
      ],
      'answer': 'Consistency between coupled tables using foreign keys',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Candidate Key" vs "Super Key".',
      'options': [
        'Same thing',
        'Minimal set of attributes to uniquely identify a row',
        'Keys for candidates',
        'Master password',
      ],
      'answer': 'Minimal set of attributes to uniquely identify a row',
      'difficulty': 'hard',
    },
    {
      'question': 'What is the purpose of the "HAVING" clause?',
      'options': [
        'To filter rows',
        'To filter groups after aggregation',
        'To join tables',
        'To sort results',
      ],
      'answer': 'To filter groups after aggregation',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "NoSQL"?',
      'options': [
        'No SQL allowed',
        'Non-relational database management system',
        'A faster SQL',
        'Old database',
      ],
      'answer': 'Non-relational database management system',
      'difficulty': 'easy',
    },
  ],
  'Networking': [
    {
      'question': 'What is the OSI model?',
      'options': [
        'Open Systems Interconnection',
        'Operating System Interface',
        'Office System Integration',
        'Output Speed Index',
      ],
      'answer': 'Open Systems Interconnection',
      'difficulty': 'easy',
    },
    {
      'question': 'How many layers are in the OSI model?',
      'options': ['4', '5', '7', '8'],
      'answer': '7',
      'difficulty': 'easy',
    },
    {
      'question': 'What is the purpose of the IP address?',
      'options': [
        'To identify a device on a network',
        'To speed up internet',
        'To secure a computer',
        'To store data',
      ],
      'answer': 'To identify a device on a network',
      'difficulty': 'easy',
    },
    {
      'question': 'Difference between IPv4 and IPv6?',
      'options': ['Speed', 'Number of bits (32 vs 128)', 'Security', 'Color'],
      'answer': 'Number of bits (32 vs 128)',
      'difficulty': 'medium',
    },
    {
      'question': 'What is DNS?',
      'options': [
        'Domain Name System',
        'Data Network Service',
        'Digital Name Secure',
        'Dynamic Network System',
      ],
      'answer': 'Domain Name System',
      'difficulty': 'easy',
    },
    {
      'question': 'What does HTTP stand for?',
      'options': [
        'Hyper Text Transfer Protocol',
        'High Technical Task Process',
        'Hyper Tool Task Protocol',
        'High Type Text Process',
      ],
      'answer': 'Hyper Text Transfer Protocol',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a Router?',
      'options': [
        'A device that forwards data packets between networks',
        'A tool for wood',
        'A speed booster',
        'A storage device',
      ],
      'answer': 'A device that forwards data packets between networks',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain the function of the Transport layer.',
      'options': [
        'Moving data physically',
        'Encryption',
        'End-to-end communication and error recovery',
        'Routing',
      ],
      'answer': 'End-to-end communication and error recovery',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Subnet Mask"?',
      'options': [
        'A security mask',
        'Used to divide an IP address into network and host parts',
        'A faster network',
        'A type of cable',
      ],
      'answer': 'Used to divide an IP address into network and host parts',
      'difficulty': 'medium',
    },
    {
      'question': 'What is DHCP?',
      'options': [
        'Dynamic Host Configuration Protocol',
        'Data High Change Process',
        'Digital Host Connection Part',
        'Dynamic Hardware Check',
      ],
      'answer': 'Dynamic Host Configuration Protocol',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Port" in networking?',
      'options': [
        'A place for ships',
        'A communication endpoint',
        'A physical cable',
        'A type of software',
      ],
      'answer': 'A communication endpoint',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "Latency"?',
      'options': [
        'File size',
        'Time delay in data transmission',
        'Network speed',
        'Data corruption',
      ],
      'answer': 'Time delay in data transmission',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Packet Switching".',
      'options': [
        'Changing packages',
        'Grouping data into packets for transmission',
        'Switching cables',
        'Deleting data',
      ],
      'answer': 'Grouping data into packets for transmission',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "NAT" (Network Address Translation)?',
      'options': [
        'Name and Type',
        'Mapping private to public IP addresses',
        'Network access tool',
        'New address technology',
      ],
      'answer': 'Mapping private to public IP addresses',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Firewall"?',
      'options': [
        'A hot wall',
        'Security system that monitors and controls network traffic',
        'A backup system',
        'A faster router',
      ],
      'answer': 'Security system that monitors and controls network traffic',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "FTP" used for?',
      'options': [
        'Fast Task Process',
        'File Transfer Protocol',
        'Future Task Part',
        'Fine Type Protocol',
      ],
      'answer': 'File Transfer Protocol',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain the "Three-way Handshake".',
      'options': [
        'Meeting people',
        'Process to establish a TCP connection (SYN, SYN-ACK, ACK)',
        'A security check',
        'Deleting a file',
      ],
      'answer': 'Process to establish a TCP connection (SYN, SYN-ACK, ACK)',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "VPN"?',
      'options': [
        'Virtual Private Network',
        'Very Private Network',
        'Virtual Phone Node',
        'Verified Private Network',
      ],
      'answer': 'Virtual Private Network',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Default Gateway"?',
      'options': [
        'Main entrance',
        'IP address that a device uses to access other networks',
        'A security door',
        'A fast server',
      ],
      'answer': 'IP address that a device uses to access other networks',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Bandwidth"?',
      'options': [
        'String size',
        'Maximum data transfer rate of a network',
        'Internet cost',
        'Computer speed',
      ],
      'answer': 'Maximum data transfer rate of a network',
      'difficulty': 'easy',
    },
  ],
  'OS': [
    {
      'question': 'What is an Operating System?',
      'options': [
        'A game',
        'Software that manages hardware and software resources',
        'A hardware component',
        'A type of RAM',
      ],
      'answer': 'Software that manages hardware and software resources',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a "Kernel"?',
      'options': [
        'A seed',
        'Core part of an OS that manages system resources',
        'A file browser',
        'A shell',
      ],
      'answer': 'Core part of an OS that manages system resources',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Process" vs "Thread".',
      'options': [
        'Same thing',
        'Process is an executing program, Thread is a unit of process',
        'Thread is bigger',
        'Process is faster',
      ],
      'answer': 'Process is an executing program, Thread is a unit of process',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Virtual Memory"?',
      'options': [
        'Memory in cloud',
        'Technique that gives an illusion of having more RAM',
        'A fast SSD',
        'Hidden memory',
      ],
      'answer': 'Technique that gives an illusion of having more RAM',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a "Deadlock"?',
      'options': [
        'A broken lock',
        'Situation where two processes are waiting for each other',
        'A crashed OS',
        'A virus',
      ],
      'answer': 'Situation where two processes are waiting for each other',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Paging"?',
      'options': [
        'Turning pages in a book',
        'Memory management scheme that eliminates external fragmentation',
        'Sorting files',
        'Scaling images',
      ],
      'answer':
          'Memory management scheme that eliminates external fragmentation',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain "Context Switching".',
      'options': [
        'Changing topics',
        'Storing state of a process so it can be resumed later',
        'Switching users',
        'Rebooting OS',
      ],
      'answer': 'Storing state of a process so it can be resumed later',
      'difficulty': 'hard',
    },
    {
      'question': 'What is a "File System"?',
      'options': [
        'A cabinet',
        'Method for storing and organizing computer files',
        'A type of code',
        'A network folder',
      ],
      'answer': 'Method for storing and organizing computer files',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "GUI"?',
      'options': [
        'Graphical User Interface',
        'Global Unit Index',
        'General User Interface',
        'Great UI',
      ],
      'answer': 'Graphical User Interface',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "Bash" or "Shell"?',
      'options': [
        'A sea shell',
        'Command-line interface to interact with OS',
        'A programming language',
        'A browser',
      ],
      'answer': 'Command-line interface to interact with OS',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain "Multi-programming".',
      'options': [
        'Coding many apps',
        'Keeping multiple programs in main memory',
        'Running many CPUs',
        'Using many languages',
      ],
      'answer': 'Keeping multiple programs in main memory',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Interrupt"?',
      'options': [
        'Stopping someone',
        'Signal to the processor that needs immediate attention',
        'A program bug',
        'Shutdown',
      ],
      'answer': 'Signal to the processor that needs immediate attention',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Fragmentation"?',
      'options': [
        'Breaking into small pieces',
        'Storage space used inefficiently',
        'Deleting files',
        'Data corruption',
      ],
      'answer': 'Storage space used inefficiently',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Spooling"?',
      'options': [
        'Spinning thread',
        'Placing data in intermediate storage for later processing',
        'Network speed',
        'Memory check',
      ],
      'answer': 'Placing data in intermediate storage for later processing',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain "Throughput" in OS.',
      'options': [
        'Total work done per unit time',
        'Speed of mouse',
        'Time to start app',
        'Number of files',
      ],
      'answer': 'Total work done per unit time',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "System Call"?',
      'options': [
        'A phone call',
        'Mechanism to request a service from the Kernel',
        'A function call',
        'An error message',
      ],
      'answer': 'Mechanism to request a service from the Kernel',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Race Condition"?',
      'options': [
        'A sports event',
        'Flaw in a system where output depends on sequence/timing of events',
        'Fast code',
        'Network competition',
      ],
      'answer':
          'Flaw in a system where output depends on sequence/timing of events',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "Critical Section"?',
      'options': [
        'Main part of code',
        'Code segment where shared resources are accessed',
        'An error prone area',
        'Boot sector',
      ],
      'answer': 'Code segment where shared resources are accessed',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "SJF" scheduling?',
      'options': [
        'Shortest Job First',
        'Small Job Free',
        'Single Job Flow',
        'Start Job Fast',
      ],
      'answer': 'Shortest Job First',
      'difficulty': 'easy',
    },
    {
      'question': 'Explain "Bootstrapping".',
      'options': [
        'Tying shoes',
        'Initial set of operations to load OS when computer starts',
        'Fast coding',
        'A type of test',
      ],
      'answer': 'Initial set of operations to load OS when computer starts',
      'difficulty': 'medium',
    },
  ],
  'DSA': [
    {
      'question': 'What does DSA stand for?',
      'options': [
        'Data Structures and Algorithms',
        'Digital System Architecture',
        'Dynamic Server Access',
        'Data Search Algorithm',
      ],
      'answer': 'Data Structures and Algorithms',
      'difficulty': 'easy',
    },
    {
      'question': 'What is an "Array"?',
      'options': [
        'A collection of items stored at contiguous memory locations',
        'A linked list',
        'A type of map',
        'A random set',
      ],
      'answer': 'A collection of items stored at contiguous memory locations',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a "Linked List"?',
      'options': [
        'A list with links',
        'Linear data structure where elements are not stored contiguously',
        'A faster array',
        'A circular buffer',
      ],
      'answer':
          'Linear data structure where elements are not stored contiguously',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Stack"?',
      'options': [
        'A pile of books',
        'LIFO (Last In First Out) data structure',
        'FIFO (First In First Out) data structure',
        'A random access list',
      ],
      'answer': 'LIFO (Last In First Out) data structure',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "Queue"?',
      'options': [
        'A line of people',
        'FIFO (First In First Out) data structure',
        'LIFO data structure',
        'A sorted list',
      ],
      'answer': 'FIFO (First In First Out) data structure',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "Binary Search" complexity?',
      'options': ['O(n)', 'O(log n)', 'O(n^2)', 'O(1)'],
      'answer': 'O(log n)',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Graph"?',
      'options': [
        'A pie chart',
        'Collection of nodes connected by edges',
        'A linear list',
        'A sorted array',
      ],
      'answer': 'Collection of nodes connected by edges',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Dynamic Programming".',
      'options': [
        'Programming while moving',
        'Solving complex problems by breaking them into simpler subproblems',
        'A new coding language',
        'Real-time updates',
      ],
      'answer':
          'Solving complex problems by breaking them into simpler subproblems',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "Recursion"?',
      'options': [
        'Doing something again',
        'Function calling itself',
        'A type of loop',
        'A data type',
      ],
      'answer': 'Function calling itself',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Time Complexity"?',
      'options': [
        'How much time code takes to run',
        'Efficiency of an algorithm as input size grows',
        'Clock speed',
        'Number of files',
      ],
      'answer': 'Efficiency of an algorithm as input size grows',
      'difficulty': 'medium',
    },
    {
      'question': 'What is a "Heap" in DSA?',
      'options': [
        'A pile of waste',
        'Tree-based data structure that satisfies heap property',
        'Memory area',
        'A type of stack',
      ],
      'answer': 'Tree-based data structure that satisfies heap property',
      'difficulty': 'hard',
    },
    {
      'question': 'Explain "Bubble Sort".',
      'options': [
        'Sorting bubbles',
        'Simple sorting algorithm that repeatedly steps through the list',
        'A fast sorting method',
        'No such thing',
      ],
      'answer':
          'Simple sorting algorithm that repeatedly steps through the list',
      'difficulty': 'easy',
    },
    {
      'question': 'What is a "Priority Queue"?',
      'options': [
        'Important line',
        'Queue where elements have priority',
        'A stack',
        'A fast queue',
      ],
      'answer': 'Queue where elements have priority',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Binary Search Tree" (BST)?',
      'options': [
        'A tree for searching binary codes',
        'Nodes to left are smaller, nodes to right are larger',
        'A balanced tree only',
        'A multi-way tree',
      ],
      'answer': 'Nodes to left are smaller, nodes to right are larger',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "DFS" and "BFS"?',
      'options': [
        'Depth First / Breadth First Search',
        'Deep / Broad File System',
        'Digital / Basic File Search',
        'None',
      ],
      'answer': 'Depth First / Breadth First Search',
      'difficulty': 'hard',
    },
    {
      'question': 'What is "Hashing"?',
      'options': [
        'Cutting things',
        'Process of mapping data to a unique fixed-size value',
        'A type of encryption only',
        'Sorting technique',
      ],
      'answer': 'Process of mapping data to a unique fixed-size value',
      'difficulty': 'medium',
    },
    {
      'question': 'Explain "Big O Notation".',
      'options': [
        'A big O character',
        'Mathematical notation that describes the limiting behavior of a function',
        'A grading system',
        'An output format',
      ],
      'answer':
          'Mathematical notation that describes the limiting behavior of a function',
      'difficulty': 'easy',
    },
    {
      'question': 'What is "Adjacency Matrix"?',
      'options': [
        'Matrix for adjacent people',
        'Way of representing a graph using a 2D array',
        'A identity matrix',
        'A sparse matrix',
      ],
      'answer': 'Way of representing a graph using a 2D array',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Merge Sort"?',
      'options': [
        'Joining and sorting',
        'Divide and conquer algorithm that splits list into halves',
        'Merging files',
        'Simple swap sort',
      ],
      'answer': 'Divide and conquer algorithm that splits list into halves',
      'difficulty': 'medium',
    },
    {
      'question': 'What is "Greedy Algorithm"?',
      'options': [
        'Takes everything',
        'Makes locally optimal choices at each stage',
        'A slow algorithm',
        'A random search',
      ],
      'answer': 'Makes locally optimal choices at each stage',
      'difficulty': 'hard',
    },
  ],
  'Quantitative Aptitude': [
    {
      'question':
          'A train 120 m long passes a telegraph post in 6 seconds. Find the speed of the train.',
      'options': ['60 km/hr', '72 km/hr', '64 km/hr', '70 km/hr'],
      'answer': '72 km/hr',
      'difficulty': 'easy',
      'explanation':
          'Speed = Distance / Time = 120/6 = 20 m/s. To convert to km/hr: 20 * 18/5 = 72 km/hr.',
    },
    {
      'question': 'What is the average of first five multiples of 3?',
      'options': ['9', '12', '15', '18'],
      'answer': '9',
      'difficulty': 'easy',
      'explanation':
          'Multiples are 3, 6, 9, 12, 15. Average = (3+6+9+12+15)/5 = 45/5 = 9.',
    },
    {
      'question':
          'A person crosses a 600 m long street in 5 minutes. What is his speed in km/hr?',
      'options': ['3.6 km/hr', '7.2 km/hr', '8.4 km/hr', '10 km/hr'],
      'answer': '7.2 km/hr',
      'difficulty': 'easy',
      'explanation':
          'Speed = 600m / (5*60)s = 600/300 = 2 m/s. km/hr = 2 * 18/5 = 7.2 km/hr.',
    },
    {
      'question':
          'If 15% of 40 is greater than 25% of a number by 2, then the number is?',
      'options': ['16', '20', '24', '32'],
      'answer': '16',
      'difficulty': 'medium',
      'explanation':
          '15% of 40 = 6. Let number be x. 6 - 0.25x = 2 => 0.25x = 4 => x = 16.',
    },
    {
      'question':
          'The ratio of ages of A and B is 3:4. After 10 years, it becomes 4:5. Find A\'s present age.',
      'options': ['20', '30', '40', '50'],
      'answer': '30',
      'difficulty': 'medium',
      'explanation':
          'Let ages be 3x and 4x. (3x+10)/(4x+10) = 4/5 => 15x + 50 = 16x + 40 => x = 10. A = 3x = 30.',
    },
    {
      'question':
          'A sum of money doubles itself at compound interest in 15 years. It will become eight times in how many years?',
      'options': ['30 years', '45 years', '50 years', '60 years'],
      'answer': '45 years',
      'difficulty': 'hard',
      'explanation':
          '2P = P(1+r)^15 => 2 = (1+r)^15. For 8P: 8 = (1+r)^t => 2^3 = ((1+r)^15)^3 => t = 3 * 15 = 45 years.',
    },
    {
      'question':
          'A boat can travel with a speed of 13 km/hr in still water. If the speed of the stream is 4 km/hr, find the time taken by the boat to go 68 km downstream.',
      'options': ['2 hours', '3 hours', '4 hours', '5 hours'],
      'answer': '4 hours',
      'difficulty': 'medium',
      'explanation':
          'Downstream speed = 13 + 4 = 17 km/hr. Time = Distance / Speed = 68 / 17 = 4 hours.',
    },
    {
      'question': 'Find the odd man out: 3, 5, 11, 14, 17, 21',
      'options': ['21', '17', '14', '3'],
      'answer': '14',
      'difficulty': 'easy',
      'explanation': 'All other numbers except 14 are odd numbers.',
    },
    {
      'question':
          'Two numbers are in the ratio 5:4 and their HCF is 4. What is their LCM?',
      'options': ['40', '60', '80', '100'],
      'answer': '80',
      'difficulty': 'medium',
      'explanation': 'Numbers are 5x4=20 and 4x4=16. LCM(20, 16) = 80.',
    },
    {
      'question':
          'A vendor bought toffees at 6 for a rupee. How many for a rupee must he sell to gain 20%?',
      'options': ['3', '4', '5', '6'],
      'answer': '5',
      'difficulty': 'hard',
      'explanation':
          'CP of 6 = 1. SP of 6 = 1.2. Gain 20% means he should sell fewer. SP of 1 toffee = 1.2/6 = 0.2. Number for 1 rupee = 1/0.2 = 5.',
    },
    {
      'question':
          'In how many ways can the letters of the word "LEADER" be arranged?',
      'options': ['72', '144', '360', '720'],
      'answer': '360',
      'difficulty': 'hard',
      'explanation':
          '6 letters, E repeats twice. Ways = 6! / 2! = 720 / 2 = 360.',
    },
    {
      'question':
          'What is the compound interest on Rs. 2500 for 2 years at 4% per annum?',
      'options': ['Rs. 200', 'Rs. 202', 'Rs. 204', 'Rs. 206'],
      'answer': '204',
      'difficulty': 'medium',
      'explanation':
          'Amount = 2500(1 + 0.04)^2 = 2500(1.0816) = 2704. CI = 2704 - 2500 = 204.',
    },
    {
      'question':
          'Pipe A can fill a tank in 20 mins and Pipe B can fill it in 30 mins. Both are opened together.',
      'options': ['10 mins', '12 mins', '15 mins', '25 mins'],
      'answer': '12 mins',
      'difficulty': 'medium',
      'explanation': '1/20 + 1/30 = (3+2)/60 = 5/60 = 1/12. So 12 mins.',
    },
    {
      'question':
          'The simple interest on a sum of money for 3 years at 12.5% is Rs 3500. Find the sum.',
      'options': ['Rs 8000', 'Rs 9333', 'Rs 10000', 'Rs 12000'],
      'answer': 'Rs 9333',
      'difficulty': 'hard',
      'explanation':
          'SI = PRT/100 => 3500 = P * 12.5 * 3 / 100 => 350000 = 37.5P => P = 9333.33',
    },
    {
      'question': 'Area of a square is 225 sq cm. What is its perimeter?',
      'options': ['30 cm', '45 cm', '60 cm', '100 cm'],
      'answer': '60 cm',
      'difficulty': 'easy',
      'explanation':
          'Side = sqrt(225) = 15 cm. Perimeter = 4 * side = 4 * 15 = 60 cm.',
    },
    {
      'question':
          'If A and B can complete a work in 12 and 18 days respectively, how long will they take working together?',
      'options': ['6.2 days', '7.2 days', '8.2 days', '9.2 days'],
      'answer': '7.2 days',
      'difficulty': 'medium',
      'explanation':
          'Working together rate = 1/12 + 1/18 = (3+2)/36 = 5/36. Time = 36/5 = 7.2 days.',
    },
    {
      'question':
          'A man sells an article for Rs. 450, losing 10%. At what price should he sell it to gain 10%?',
      'options': ['Rs. 495', 'Rs. 500', 'Rs. 550', 'Rs. 600'],
      'answer': 'Rs. 550',
      'difficulty': 'medium',
      'explanation':
          '90% of CP = 450 => CP = 500. To gain 10%, SP = 1.1 * 500 = 550.',
    },
    {
      'question': 'What is the value of x if 2x + 7 = 3x - 5?',
      'options': ['2', '10', '12', '14'],
      'answer': '12',
      'difficulty': 'easy',
      'explanation': '2x + 7 = 3x - 5 => 3x - 2x = 7 + 5 => x = 12.',
    },
    {
      'question': 'Solve for x: x^2 - 7x + 12 = 0',
      'options': ['(3, 4)', '(2, 6)', '(1, 12)', '(7, 0)'],
      'answer': '(3, 4)',
      'difficulty': 'medium',
      'explanation':
          'The equation factors into (x-3)(x-4) = 0, so roots are 3 and 4.',
    },
    {
      'question':
          'The perimeter of a rectangle is 40 cm and its length is 12 cm. What is its area?',
      'options': ['80 sq cm', '96 sq cm', '100 sq cm', '120 sq cm'],
      'answer': '96 sq cm',
      'difficulty': 'medium',
      'explanation':
          '2(L+B)=40 => 12+B=20 => B=8. Area = L*B = 12*8 = 96 sq cm.',
    },
    {
      'question': 'What is the sum of interior angles of a hexagon?',
      'options': ['360°', '540°', '720°', '900°'],
      'answer': '720°',
      'difficulty': 'medium',
      'explanation': 'Sum = (n-2) * 180 = (6-2) * 180 = 4 * 180 = 720°.',
    },
    {
      'question':
          'If the radius of a circle is doubled, its area becomes how many times?',
      'options': ['2 times', '3 times', '4 times', '8 times'],
      'answer': '4 times',
      'difficulty': 'easy',
      'explanation': 'Area = πr^2. If r becomes 2r, Area = π(2r)^2 = 4πr^2.',
    },
    {
      'question':
          'In a class of 60 students, 40% are girls. How many boys are there?',
      'options': ['24', '30', '36', '40'],
      'answer': '36',
      'difficulty': 'easy',
      'explanation': 'Girls = 40% of 60 = 24. Boys = 60 - 24 = 36.',
    },
    {
      'question':
          'A shopkeeper marks his goods 20% above CP and allows a 10% discount. What is his overall gain percentage?',
      'options': ['8%', '10%', '12%', '15%'],
      'answer': '8%',
      'difficulty': 'medium',
      'explanation': 'Let CP=100. MP=120. SP = 90% of 120 = 108. Gain = 8%.',
    },
    {
      'question':
          'If log 2 = 0.301 and log 3 = 0.477, what is the value of log 6?',
      'options': ['0.176', '0.778', '0.825', '1.141'],
      'answer': '0.778',
      'difficulty': 'hard',
      'explanation':
          'log 6 = log(2*3) = log 2 + log 3 = 0.301 + 0.477 = 0.778.',
    },
    {
      'question':
          'The volume of a cylinder with radius 7 cm and height 10 cm is (Take π = 22/7):',
      'options': ['1440 cu cm', '1540 cu cm', '1640 cu cm', '1740 cu cm'],
      'answer': '1540 cu cm',
      'difficulty': 'medium',
      'explanation':
          'V = πr^2h = (22/7) * 7 * 7 * 10 = 22 * 7 * 10 = 1540 cu cm.',
    },
    {
      'question':
          'Data Interpretation: If the total sales in 2023 was 5000 units and it grew by 20% in 2024, what are the sales in 2024?',
      'options': ['5500', '6000', '6500', '7000'],
      'answer': '6000',
      'difficulty': 'easy',
      'explanation':
          '20% growth = 0.20 * 5000 = 1000. Total = 5000 + 1000 = 6000.',
    },
    {
      'question':
          'A pie chart shows that 25% of a company\'s budget is spent on Marketing. If total budget is \$1,000,000, how much is spent on Marketing?',
      'options': ['\$200,000', '\$250,000', '\$300,000', '\$500,000'],
      'answer': '\$250,000',
      'difficulty': 'easy',
      'explanation': '25% of 1,000,000 = 0.25 * 1,000,000 = 250,000.',
    },
    {
      'question':
          'Average speed of a car covering 150 km in 3 hours and then 200 km in 5 hours is:',
      'options': ['40.25 km/hr', '43.75 km/hr', '45.5 km/hr', '50 km/hr'],
      'answer': '43.75 km/hr',
      'difficulty': 'medium',
      'explanation':
          'Total Distance = 350 km. Total Time = 8 hrs. Avg Speed = 350 / 8 = 43.75 km/hr.',
    },
    {
      'question':
          'If the ratio of two numbers is 2:3 and their sum is 100, find the larger number.',
      'options': ['40', '50', '60', '70'],
      'answer': '60',
      'difficulty': 'easy',
      'explanation':
          '2x + 3x = 100 => 5x = 100 => x = 20. Larger number = 3x = 60.',
    },
    {
      'question':
          'What is the simple interest on Rs. 5000 for 2 years at 10% per annum?',
      'options': ['Rs. 500', 'Rs. 1000', 'Rs. 1500', 'Rs. 2000'],
      'answer': 'Rs. 1000',
      'difficulty': 'easy',
      'explanation': 'SI = (P*R*T)/100 = (5000 * 10 * 2) / 100 = 1000.',
    },
    {
      'question': 'Find the average of 10, 20, 30, and 40.',
      'options': ['20', '25', '30', '35'],
      'answer': '25',
      'difficulty': 'easy',
      'explanation': 'Average = (10+20+30+40)/4 = 100/4 = 25.',
    },
    {
      'question': 'If A:B = 2:3 and B:C = 4:5, find the ratio A:B:C.',
      'options': ['8:12:15', '2:12:5', '8:10:15', '2:3:5'],
      'answer': '8:12:15',
      'difficulty': 'medium',
      'explanation':
          'Multiply A:B by 4 and B:C by 3 to make B common (12): 8:12 and 12:15. So 8:12:15.',
    },
    {
      'question': 'Solve for x and y: x + y = 10, x - y = 2.',
      'options': ['x=6, y=4', 'x=5, y=5', 'x=7, y=3', 'x=8, y=2'],
      'answer': 'x=6, y=4',
      'difficulty': 'easy',
      'explanation':
          'Adding equations: 2x = 12 => x = 6. Substituting x: 6 + y = 10 => y = 4.',
    },
    {
      'question': 'Simplify: 2^3 * 2^4',
      'options': ['2^7', '2^12', '4^{7}', '2^1'],
      'answer': '2^7',
      'difficulty': 'easy',
      'explanation':
          'Powers with same base add when multiplied: 2^{3+4} = 2^7.',
    },
    {
      'question': 'Find the value of f(x) = x^2 + 2x + 1 when x = 2.',
      'options': ['5', '7', '9', '11'],
      'answer': '9',
      'difficulty': 'easy',
      'explanation': 'f(2) = 2^2 + 2(2) + 1 = 4 + 4 + 1 = 9.',
    },
    {
      'question':
          'What is the circumference of a circle with radius 7 cm? (Take π = 22/7)',
      'options': ['22 cm', '44 cm', '88 cm', '154 cm'],
      'answer': '44 cm',
      'difficulty': 'easy',
      'explanation': 'Circumference = 2πr = 2 * (22/7) * 7 = 44 cm.',
    },
    {
      'question': 'Area of a triangle with base 10 cm and height 5 cm is:',
      'options': ['25 sq cm', '50 sq cm', '75 sq cm', '100 sq cm'],
      'answer': '25 sq cm',
      'difficulty': 'easy',
      'explanation': 'Area = 1/2 * base * height = 1/2 * 10 * 5 = 25 sq cm.',
    },
    {
      'question':
          'In a right-angled triangle, if legs are 3 cm and 4 cm, find the hypotenuse.',
      'options': ['5 cm', '6 cm', '7 cm', '10 cm'],
      'answer': '5 cm',
      'difficulty': 'easy',
      'explanation': 'h^2 = 3^2 + 4^2 = 9 + 16 = 25. h = 5 cm.',
    },
    {
      'question':
          'If sales increased from \$4000 to \$5000, what is the percentage increase?',
      'options': ['10%', '20%', '25%', '50%'],
      'answer': '25%',
      'difficulty': 'medium',
      'explanation': 'Increase = 1000. Percentage = (1000/4000) * 100 = 25%.',
    },
  ],
  'Logical Reasoning': [
    {
      'question':
          'Look at this series: 2, 1, (1/2), (1/4), ... What number should come next?',
      'options': ['(1/3)', '(1/8)', '(2/8)', '(1/16)'],
      'answer': '(1/8)',
      'difficulty': 'easy',
      'explanation':
          'Each number is half of the previous number. half of 1/4 is 1/8.',
    },
    {
      'question': 'SCD, TEF, UGH, ____, WKL',
      'options': ['CMN', 'UJI', 'VIJ', 'IJT'],
      'answer': 'VIJ',
      'difficulty': 'easy',
      'explanation':
          'First letter: S, T, U, V, W. Second and third: CD, EF, GH, IJ, KL.',
    },
    {
      'question':
          'A is the father of B. C is the son of B. D is the brother of C. Who is A to D?',
      'options': ['Father', 'Brother', 'Grandfather', 'Uncle'],
      'answer': 'Grandfather',
      'difficulty': 'medium',
      'explanation':
          'A is B\'s father. C is B\'s son (so A is C\'s grandfather). D is C\'s brother, so A is also D\'s grandfather.',
    },
    {
      'question':
          'Point B is 4 km North of point A. Point C is 3 km East of point B. Find distance AC.',
      'options': ['5 km', '7 km', '10 km', '12 km'],
      'answer': '5 km',
      'difficulty': 'medium',
      'explanation':
          'AC is the hypotenuse. AC^2 = 4^2 + 3^2 = 16 + 9 = 25. AC = 5 km.',
    },
    {
      'question': 'Calendar : Date :: Clock : ?',
      'options': ['Watch', 'Time', 'Second', 'Hour'],
      'answer': 'Time',
      'difficulty': 'easy',
      'explanation': 'Calendar shows Date, Clock shows Time.',
    },
    {
      'question':
          'In a certain code language, "COMPUTER" is written as "RFUVQNPC". How is "MEDICINE" written?',
      'options': ['EOJDJEFM', 'EOHJDKRE', 'MFEJDJOE', 'EOJDEJFM'],
      'answer': 'EOJDJEFM',
      'difficulty': 'hard',
      'explanation':
          'The pattern involves reversing and shifting letters. (Specific logic: Reverse, then first/last remain, inner ones +1).',
    },
    {
      'question':
          'If South-East becomes North, North-East becomes West and so on. What will West become?',
      'options': ['North-East', 'South-East', 'North-West', 'South-West'],
      'answer': 'South-East',
      'difficulty': 'hard',
      'explanation': 'The compass rotates 135 degrees clockwise.',
    },
    {
      'question':
          'Statements: All fish are tortoises. No tortoise is a crocodile. Conclusion I: No fish is a crocodile.',
      'options': [
        'Only I follows',
        'Only II follows',
        'Both follow',
        'Neither follows',
      ],
      'answer': 'Only I follows',
      'difficulty': 'medium',
      'explanation':
          'If all fish are tortoises and no tortoise is a crocodile, it naturally follows that no fish can be a crocodile.',
    },
    {
      'question': 'Which word does NOT belong with the others?',
      'options': ['Parsley', 'Basil', 'Dill', 'Mayonnaise'],
      'answer': 'Mayonnaise',
      'difficulty': 'easy',
      'explanation': 'Others are herbs, mayonnaise is a condiment.',
    },
    {
      'question': '1, 4, 9, 16, 25, 36, 49, (....)',
      'options': ['54', '56', '64', '81'],
      'answer': '64',
      'difficulty': 'easy',
      'explanation': 'Series of squares: 1^2, 2^2, ..., 8^2 = 64.',
    },
    {
      'question':
          'A is 40 m South-West of B. C is 40 m South-East of B. Then C is in which direction of A?',
      'options': ['East', 'West', 'North', 'South'],
      'answer': 'East',
      'difficulty': 'medium',
      'explanation': 'A and C are on the same latitude relative to B.',
    },
    {
      'question': 'Find the missing number: 8, 24, 12, 36, 18, 54, (..)',
      'options': ['27', '108', '68', '72'],
      'answer': '27',
      'difficulty': 'hard',
      'explanation': 'Pattern is: *3, /2, *3, /2. 54 / 2 = 27.',
    },
    {
      'question': 'CUP : LIP :: BIRD : ?',
      'options': ['BUSH', 'GRASS', 'FOREST', 'BEAK'],
      'answer': 'BEAK',
      'difficulty': 'easy',
      'explanation':
          'You drink from a cup with lips; a bird eats with its beak.',
    },
    {
      'question':
          'If blue is called green, green is called white, white is called yellow, what is the color of milk?',
      'options': ['Green', 'White', 'Yellow', 'Blue'],
      'answer': 'Yellow',
      'difficulty': 'easy',
      'explanation': 'Milk is white. White is called yellow.',
    },
    {
      'question':
          'Eight people J, K, L, M, N, O, P, Q sit in a circle... (logic riddle)',
      'options': ['J', 'K', 'M', 'P'],
      'answer': 'M',
      'difficulty': 'hard',
      'explanation': 'Based on sitting arrangement logic.',
    },
    {
      'question':
          'Statements: Some pens are books. All books are pencils. Conclusion:?',
      'options': [
        'All pens are pencils',
        'Some pens are pencils',
        'No pen is pencil',
        'All pencils are pens',
      ],
      'answer': 'Some pens are pencils',
      'difficulty': 'medium',
      'explanation':
          'Since some pens are books and all books are pencils, those books which are pens must also be pencils.',
    },
    {
      'question':
          'Statements: All cats are dogs. All dogs are birds. Conclusion:?',
      'options': [
        'All birds are cats',
        'All cats are birds',
        'Some birds are not dogs',
        'No cat is bird',
      ],
      'answer': 'All cats are birds',
      'difficulty': 'easy',
      'explanation':
          'Standard syllogism: if A inside B and B inside C, then A is inside C.',
    },
    {
      'question':
          'Pointing to a photograph, a man said, "I have no brother or sister but that man\'s father is my father\'s son." Whose photograph was it?',
      'options': ['His own', 'His son\'s', 'His father\'s', 'His nephew\'s'],
      'answer': 'His son\'s',
      'difficulty': 'hard',
      'explanation':
          '"My father\'s son" is the man himself (since he has no siblings). So, the man in the photo\'s father is HE. Thus, the photo is of his son.',
    },
    {
      'question':
          'If A is the brother of B; B is the sister of C; and C is the father of D, how is A related to D?',
      'options': ['Father', 'Uncle', 'Brother', 'Grandfather'],
      'answer': 'Uncle',
      'difficulty': 'medium',
      'explanation':
          'A is B and C\'s brother. Since C is D\'s father, A is D\'s uncle.',
    },
    {
      'question':
          'A man said to a lady, "Your mother\'s husband\'s sister is my aunt." How is the lady related to the man?',
      'options': ['Sister', 'Mother', 'Cousin', 'Daughter'],
      'answer': 'Sister',
      'difficulty': 'medium',
      'explanation':
          'Lady\'s mother\'s husband = Lady\'s father. Lady\'s father\'s sister = Lady\'s aunt. If she is also the man\'s aunt, the lady and man are siblings.',
    },
    {
      'question':
          'If in a certain language, MADRAS is coded as NBESBT, how is BOMBAY coded in that code?',
      'options': ['CPNCBZ', 'CQOCBZ', 'CPNCBX', 'CPNDBZ'],
      'answer': 'CPNCBZ',
      'difficulty': 'easy',
      'explanation': 'Each letter is shifted by +1 (M->N, A->B, etc.).',
    },
    {
      'question':
          'In a certain code, TRIPLE is written as SQHOKD. How is DISPOSE written in that code?',
      'options': ['CHRONRD', 'DSOPIES', 'ESQTPSF', 'CHRONRE'],
      'answer': 'CHRONRD',
      'difficulty': 'medium',
      'explanation': 'Each letter is shifted by -1 (T->S, R->Q, etc.).',
    },
    {
      'question':
          'If "book" is called "pencil", "pencil" is called "eraser", and "eraser" is called "bag", what will be used to write on paper?',
      'options': ['Book', 'Pencil', 'Eraser', 'Bag'],
      'answer': 'Eraser',
      'difficulty': 'easy',
      'explanation': 'One uses a pencil to write. Pencil is called "eraser".',
    },
    {
      'question':
          'Six people P, Q, R, S, T, U are sitting in a circle. Q is between P and R. T is between S and U. P and T are opposite each other. Who is opposite Q?',
      'options': ['R', 'S', 'U', 'P'],
      'answer': 'S',
      'difficulty': 'hard',
      'explanation':
          'Mapping the circle: P is opposite T. Q is next to P. S is next to T. If P and T are opposite, then the one opposite Q must be S.',
    },
    {
      'question':
          'A, B, C, D, E are sitting on a bench. E is on the left end. C is second from the right. A is next to B and C. Where is A sitting?',
      'options': [
        'Second from left',
        'Middle',
        'Third from right',
        'Second from right',
      ],
      'answer': 'Middle',
      'difficulty': 'medium',
      'explanation':
          'Positions: E, B, A, C, D. A is in the middle (3rd position).',
    },
  ],
  'Verbal Ability': [
    {
      'question': 'Choose the synonym for: "ADVERSITY"',
      'options': ['Happiness', 'Misfortune', 'Prosperity', 'Friendship'],
      'answer': 'Misfortune',
      'difficulty': 'easy',
      'explanation': 'Adversity means a state of misfortune or hardship.',
    },
    {
      'question': 'Choose the antonym for: "ELEGANT"',
      'options': ['Graceful', 'Crude', 'Refined', 'Fancy'],
      'answer': 'Crude',
      'difficulty': 'easy',
      'explanation':
          'Elegant means refined; its opposite is crude or unrefined.',
    },
    {
      'question': 'Pick the correctly spelled word:',
      'options': [
        'Accomodation',
        'Accommodation',
        'Acommodation',
        'Accomodasion',
      ],
      'answer': 'Accommodation',
      'difficulty': 'medium',
      'explanation': 'Correct spelling has double C and double M.',
    },
    {
      'question': 'He passed the exam ____ flying colors.',
      'options': ['with', 'by', 'in', 'at'],
      'answer': 'with',
      'difficulty': 'easy',
      'explanation': 'The idiom is "with flying colors".',
    },
    {
      'question': 'Select the odd one out:',
      'options': ['Bark', 'Meow', 'Chirp', 'Talk'],
      'answer': 'Talk',
      'difficulty': 'easy',
      'explanation': 'Others are animal sounds; humans talk.',
    },
    {
      'question':
          'Change to passive voice: "The chef cooked a delicious meal."',
      'options': [
        'A delicious meal was cooked by the chef.',
        'The chef was cooking a meal.',
        'A meal is cooked by chef.',
        'Chef cooked meal.',
      ],
      'answer': 'A delicious meal was cooked by the chef.',
      'difficulty': 'medium',
      'explanation': 'Standard passive construction.',
    },
    {
      'question': 'Meaning of the idiom: "Kill two birds with one stone"',
      'options': [
        'Do two tasks separately',
        'Achieve two aims with one action',
        'Save two birds',
        'Hunt efficiently',
      ],
      'answer': 'Achieve two aims with one action',
      'difficulty': 'easy',
      'explanation': 'Standard idiomatic expression.',
    },
    {
      'question': 'A person who writes the story of his own life.',
      'options': ['Biographer', 'Autobiographer', 'Author', 'Cartographer'],
      'answer': 'Autobiographer',
      'difficulty': 'medium',
      'explanation': 'Auto (self) + bio (life) + graphy (writing).',
    },
    {
      'question':
          'Identify the part of speech for "Quickly" in: "He ran quickly."',
      'options': ['Adjective', 'Adverb', 'Noun', 'Verb'],
      'answer': 'Adverb',
      'difficulty': 'easy',
      'explanation': 'Quickly modifies the verb "ran".',
    },
    {
      'question': 'Complete the analogy: Bee : Hive :: Lion : ?',
      'options': ['Den', 'Nest', 'Stable', 'Kennel'],
      'answer': 'Den',
      'difficulty': 'easy',
      'explanation': 'A bee lives in a hive; a lion lives in a den.',
    },
    {
      'question':
          'Select the most appropriate preposition: "The cat is hidden ____ the curtain."',
      'options': ['on', 'behind', 'at', 'into'],
      'answer': 'behind',
      'difficulty': 'easy',
      'explanation': 'One hides behind something.',
    },
    {
      'question':
          'Find the error: "Neither of the two candidates are qualified."',
      'options': ['Neither', 'two candidates', 'are', 'qualified'],
      'answer': 'are',
      'difficulty': 'hard',
      'explanation': '"Neither" is singular, so it should be "is qualified".',
    },
    {
      'question': 'Choose the correct meaning of "ENIGMATIC"',
      'options': ['Clear', 'Mysterious', 'Funny', 'Loud'],
      'answer': 'Mysterious',
      'difficulty': 'medium',
      'explanation':
          'Enigmatic means difficult to interpret or understand; mysterious.',
    },
    {
      'question': 'Plural of "Criterion"?',
      'options': ['Criterions', 'Criteria', 'Criterias', 'Criteriones'],
      'answer': 'Criteria',
      'difficulty': 'medium',
      'explanation': 'Criteria is the Latin plural form.',
    },
    {
      'question': 'Fill in: "If I ____ you, I would take that offer."',
      'options': ['am', 'was', 'were', 'be'],
      'answer': 'were',
      'difficulty': 'hard',
      'explanation': 'Subjunctive mood for hypothetical situations.',
    },
    {
      'question': 'Pick the grammatically correct sentence:',
      'options': [
        'He is one of those people who is always late.',
        'He is one of those people who are always late.',
        'He is one of those people who always late.',
        'He is one of those person who are always late.',
      ],
      'answer': 'He is one of those people who are always late.',
      'difficulty': 'hard',
      'explanation':
          '"Who" refers to "people" (plural), so the verb should be "are".',
    },
    {
      'question': 'Fill in the blank: Each of the boys ____ given a prize.',
      'options': ['was', 'were', 'are', 'have'],
      'answer': 'was',
      'difficulty': 'medium',
      'explanation':
          '"Each" is a singular subject, requiring a singular verb "was".',
    },
    {
      'question':
          'Identify the error: "Neither the salary (A) nor the working hours (B) varies (C) from one department (D) to another."',
      'options': ['A', 'B', 'C', 'D'],
      'answer': 'C',
      'difficulty': 'hard',
      'explanation':
          'When subjects are joined by "neither/nor", the verb agrees with the closer subject ("working hours"), which is plural. So "varies" should be "vary".',
    },
    {
      'question': 'Choose the synonym for: "DILIGENT"',
      'options': ['Hard-working', 'Lazy', 'Fast', 'Shy'],
      'answer': 'Hard-working',
      'difficulty': 'easy',
      'explanation': 'Diligent means showing care and effort in one\'s work.',
    },
    {
      'question': 'Choose the antonym for: "ABUNDANT"',
      'options': ['Scarce', 'Plenty', 'Rich', 'Full'],
      'answer': 'Scarce',
      'difficulty': 'easy',
      'explanation':
          'Abundant means existing in large quantities; scarce means in short supply.',
    },
    {
      'question': 'One word substitution: "A person who hates women"',
      'options': ['Misogynist', 'Philanthropist', 'Misogamist', 'Misanthrope'],
      'answer': 'Misogynist',
      'difficulty': 'medium',
      'explanation':
          'Misogynist comes from Greek "misos" (hatred) and "gyne" (woman).',
    },
    {
      'question':
          'Read the snippet: "Climate change is primarily driven by human activities, such as burning fossil fuels and deforestation." What is a primary driver?',
      'options': [
        'Natural cycles',
        'Human activities',
        'Volcanic eruptions',
        'Solar flares',
      ],
      'answer': 'Human activities',
      'difficulty': 'easy',
      'explanation':
          'The text explicitly states climate change is driven by human activities.',
    },
    {
      'question':
          'Read the snippet: "The internet has revolutionized communication, making it instant but sometimes impersonal." How does the author characterize internet communication?',
      'options': [
        'Slow but personal',
        'Instant but impersonal',
        'Always reliable',
        'Rarely used',
      ],
      'answer': 'Instant but impersonal',
      'difficulty': 'easy',
      'explanation':
          'The text describes it as "instant but sometimes impersonal".',
    },
    {
      'question':
          'Rearrange the fragments to form a meaningful sentence: P: the most, Q: population, R: India is, S: populous country',
      'options': ['RPQS', 'PQRS', 'SQRP', 'QSPR'],
      'answer': 'RPQS',
      'difficulty': 'medium',
      'explanation':
          'India is (R) the most (P) populous country (S) [implied by context of population Q]. Correct flow: India is the most populous country.',
    },
    {
      'question':
          'Rearrange the fragments: P: they were, Q: happy, R: because, S: they won',
      'options': ['PQRS', 'PRSQ', 'PQSR', 'RSPQ'],
      'answer': 'PQRS',
      'difficulty': 'easy',
      'explanation': 'They were happy because they won.',
    },
  ],
};

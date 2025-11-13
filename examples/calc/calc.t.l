%{
let inputBuffer = "";
let currentIndex = 0;

export function setInput(text: string) {
  inputBuffer = text;
  currentIndex = 0;
}

export function yylex(): any {
  skipWhitespace();

  if (currentIndex >= inputBuffer.length) {
    return 0; // EOF
  }

  const ch = inputBuffer[currentIndex++];

  // Handle single-character tokens
  if (/[+\-*/()]/.test(ch)) {
    return ch.charCodeAt(0); // Return token as ASCII code (like Tapir expects)
  }

  // Handle numbers
  if (/\d/.test(ch)) {
    let numStr = ch;
    while (currentIndex < inputBuffer.length && /\d/.test(inputBuffer[currentIndex])) {
      numStr += inputBuffer[currentIndex++];
    }
    (globalThis as any).yylval = parseInt(numStr, 10);
    return NUMBER;
  }

  // Handle newlines
  if (ch === '\n') {
    return '\n'.charCodeAt(0);
  }

  // Unknown character
  yyerror(`Unexpected character: '${ch}'`);
  return yylex(); // Skip and continue
}

function skipWhitespace() {
  while (currentIndex < inputBuffer.length && /\s/.test(inputBuffer[currentIndex])) {
    currentIndex++;
  }
}

function yyerror(s: string) {
  console.error("Lexer error:", s);
}
%}

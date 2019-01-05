module.exports = {
  collectCoverage: true,
  collectCoverageFrom: ['src/**/*.{{j,t}s{,x}}', '!src/.next/**/*'],
  coverageDirectory: './coverage/',
  globals: {
    'ts-jest': {
      babelConfig: true,
      tsConfig: '<rootDir>/tsconfig.jest.json',
    },
  },
  moduleFileExtensions: ['js', 'jsx', 'ts', 'tsx'],
  moduleNameMapper: {
    '@app/(.*)': '<rootDir>/src/$1',
  },
  setupFiles: ['<rootDir>/jest.setup.ts'],
  setupTestFrameworkScriptFile: '<rootDir>/jest.setup-test-framework.ts',
  testPathIgnorePatterns: ['<rootDir>/src/.next/', '<rootDir>/node_modules/'],
  testMatch: ['**/__tests__/**/*.test.{j,t}s{,x}'],
  transform: {
    '^.+\\.jsx?$': '<rootDir>/node_modules/babel-jest',
    '^.+\\.tsx?$': 'ts-jest',
  },
}

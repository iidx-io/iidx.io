import { configure } from 'enzyme'
import * as Adapter from 'enzyme-adapter-react-16'

configure({ adapter: new Adapter() })

import * as firebaseMock from 'firebase-mock'

const mockAuth = new firebaseMock.MockAuthentication()
const mockSDK = new firebaseMock.MockFirebaseSdk(
  // RTDB
  null,
  // AUTHENTICATION
  () => mockAuth,
  // FIRESTORE
  null,
  // STORAGE
  null,
  // MESSAGING
  null,
)

import * as app from '@app/lib/firebaseApp/app'

jest.mock('@app/lib/firebaseApp/app')
;(app as any).default = jest.fn(() => mockSDK)

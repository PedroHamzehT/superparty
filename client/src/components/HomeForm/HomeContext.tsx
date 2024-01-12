import { createContext, useReducer } from "react"

interface FormStateType {
  name?: string,
  email?: string,
  password?: string,
  confirm_password?: string,
  sign_type: 'login' | 'register' | 'passwordless'
}

const enum FormActionTypes {
  CHANGE_SIGN_TYPE,
  CHANGE_NAME,
  CHANGE_EMAIL,
  CHANGE_PASSWORD,
  CHANGE_CONFIRM_PASSWORD,
}

interface FormActionType {
  type: FormActionTypes,
  payload?: string
}

interface HomeContextType {
  formState: FormStateType,
  formDispatch: React.Dispatch<FormActionType>
}

const initialState: HomeContextType = {
  formState: {
    name: '',
    email: '',
    password: '',
    confirm_password: '',
    sign_type: 'login'
  },
  formDispatch: () => {}
}

const HomeContext = createContext<HomeContextType>(initialState)

interface HomeContextProviderProps {
  children: React.ReactNode
}

const formReducer = (state: FormStateType, action: FormActionType): FormStateType => {
  switch(action.type) {
    case FormActionTypes.CHANGE_SIGN_TYPE:
      if (action.payload === 'login' || action.payload === 'register' || action.payload === 'passwordless') {
        return {...state, sign_type: action.payload}
      } else {
        throw Error('Unknown sign type')
      }
    case FormActionTypes.CHANGE_NAME:
      return {...state, name: action.payload}
    case FormActionTypes.CHANGE_EMAIL:
      return {...state, email: action.payload}
    case FormActionTypes.CHANGE_PASSWORD:
      return {...state, password: action.payload}
    case FormActionTypes.CHANGE_CONFIRM_PASSWORD:
      return {...state, confirm_password: action.payload}
    default:
      throw Error('Unknown action')
  }
}

const HomeContextProvider = ({children}: HomeContextProviderProps) => {
  const [formState, formDispatch] = useReducer(formReducer, initialState.formState)

  return (
    <HomeContext.Provider value={{formState, formDispatch}}>
      {children}
    </HomeContext.Provider>
  )
}

export { HomeContext, HomeContextProvider, FormActionTypes }
